use wamr_rust_sdk::{
    function::Function, instance::Instance, module::Module, runtime::Runtime, value::WasmValue,
};
use wamr_sys::{wasm_runtime_addr_app_to_native, wasm_runtime_validate_app_addr};

use core::ffi::c_void;
use std::mem::ManuallyDrop;
use wasmi::Linker;

fn guest_to_host_ptr(instance: &Instance, guest_ptr: u32) -> Result<*mut c_void, &'static str> {
    let instance_ptr = instance.get_inner_instance();
    let safe_addr = unsafe { wasm_runtime_validate_app_addr(instance_ptr, guest_ptr, 4) };
    if !safe_addr {
        return Err("unsafe guest ptr");
    }

    Ok(unsafe { wasm_runtime_addr_app_to_native(instance_ptr, guest_ptr) })
}

fn write_to_wamr_mem(instance: &Instance, guest_ptr: u32, host_data: &[u8]) {
    let host_ptr = guest_to_host_ptr(instance, guest_ptr).unwrap();

    unsafe {
        std::ptr::copy(host_data.as_ptr(), host_ptr as *mut u8, host_data.len());
    };
}

fn read_from_wamr_mem(instance: &Instance, guest_ptr: u32, size: u32) -> ManuallyDrop<&[u8]> {
    let host_ptr = guest_to_host_ptr(instance, guest_ptr).unwrap();

    // Omit the slice destructor, as WAMR owns the guest memory.
    std::mem::ManuallyDrop::new(unsafe {
        std::slice::from_raw_parts(host_ptr as *mut u8, size as usize)
    })
}

fn main() {
    // have to load this at build time to go no_std
    let go_wasm_path = "megaopt_go.wasm";
    let go_wasm_aot_path = "megaopt.aot";
    let wasm_bytes = std::fs::read(go_wasm_path).unwrap();
    let wasm_aot_bytes = std::fs::read(go_wasm_aot_path).unwrap();

    // We have to map wasmi errors as we're using wasmi in no_std mode.
    let engine = wasmi::Engine::default();
    let module = wasmi::Module::new(&engine, &wasm_bytes[..]).unwrap();

    // Exposing host function to WASM module
    /*
    // All Wasm objects operate within the context of a `Store`.
    // Each `Store` has a type parameter to store host-specific data,
    // which in this case we are using `42` for.
    type HostState = u32;
    let mut store = Store::new(&engine, 42);
    let host_hello = Func::wrap(&mut store, |caller: Caller<'_, HostState>, param: i32| {
        println!("Got {param} from WebAssembly");
        println!("My host state is: {}", caller.data());
    });
    */

    // sometimes mut?
    let linker = <Linker<()>>::new(&engine);
    let mut store = wasmi::Store::new(&engine, ());
    let instance = linker
        .instantiate(&mut store, &module)
        .unwrap()
        .start(&mut store)
        .unwrap();
    let guest_memory = instance
        .get_memory(&store, "memory")
        .ok_or(anyhow::Error::msg("failed to get guest memory"))
        .unwrap();

    println!(
        "Guest memory state: {:?}",
        guest_memory.current_pages(&store)
    );

    const SAMPLE_SIZE: usize = 2 << 7;
    // match zstack-size compile option
    const GUEST_MEM_OFFSET: usize = 2 << 10;
    let read_guest_mem = |s: &wasmi::Store<()>| {
        let mut read_buf: [u8; SAMPLE_SIZE] = [0; SAMPLE_SIZE];
        guest_memory
            .read(s, GUEST_MEM_OFFSET, &mut read_buf)
            .unwrap();
        println!("Guest memory: {:02X?}", read_buf);
    };
    read_guest_mem(&store);

    // Register guest funcs
    let wasm_init = instance
        .get_typed_func::<(), ()>(&store, "_initialize")
        .expect("register init guest func");
    let extend = instance
        .get_typed_func::<(i32, i32), u64>(&store, "extend")
        .expect("register extend guest func");
    let ahoy = instance
        .get_typed_func::<(i32, i32), u64>(&store, "ahoy")
        .expect("register ahoy guest func");
    let malloc = instance
        .get_typed_func::<i32, i32>(&store, "malloc")
        .expect("register _malloc guest func");

    // Ask guest to make a buffer for host to write to; we have to free later
    let greet_string = "Honig";
    let greet_bytes = greet_string.as_bytes();
    let greet_size = greet_bytes.len() as i32;

    wasm_init.call(&mut store, ()).unwrap();
    let greet_ptr = malloc.call(&mut store, greet_size).expect("call malloc");
    let greet_ptr_host = greet_ptr as usize;

    println!("Guest ptr: 0x{:02X}", greet_ptr - GUEST_MEM_OFFSET as i32);

    // Write to guest memory directly, yolo
    guest_memory
        .write(&mut store, greet_ptr_host, greet_bytes)
        .expect("write str");
    read_guest_mem(&store);

    // quick maths
    let maths = extend.call(&mut store, (1, 2)).expect("call extend");

    println!("Quick maths: {:?}", maths);

    // call a guest func on the written string
    let ahoy_resp = ahoy
        .call(&mut store, (greet_ptr, greet_size))
        .expect("call ahoy");
    read_guest_mem(&store);

    // decode the guest memory location of the func output
    let ahoy_ptr_guest = (ahoy_resp >> 32) as u32;
    let ahoy_size_guest = (ahoy_resp & 0x000000000ffffffff) as u32;
    println!(
        "Guest result ptr: 0x{:X}, size: {}",
        ahoy_ptr_guest - GUEST_MEM_OFFSET as u32,
        ahoy_size_guest
    );

    // read output of guest func from guest memory
    let mut ahoy_bytes = vec![0; ahoy_size_guest as usize];
    guest_memory
        .read(&store, ahoy_ptr_guest as usize, &mut ahoy_bytes[..])
        .expect("read str");
    let guest_output = String::from_utf8(ahoy_bytes).unwrap();
    println!("Guest output: {:?}", guest_output);

    let wamr_runtime = Runtime::builder().use_system_allocator().build().unwrap();
    // let wamr_module = Module::from_buf(wasm_bytes.as_slice()).unwrap();
    let wamr_module = Module::from_buf(wasm_aot_bytes.as_slice()).unwrap();
    let wamr_instance = Instance::new_with_args(&wamr_module, 1024 * 2, 1024 * 62).unwrap();

    let wamr_init = Function::find_export_func(&wamr_instance, "_initialize").unwrap();
    let wamr_malloc = Function::find_export_func(&wamr_instance, "malloc").unwrap();
    let wamr_extend = Function::find_export_func(&wamr_instance, "extend").unwrap();

    let init_args: Vec<WasmValue> = vec![];
    wamr_init.call(&wamr_instance, &init_args).unwrap();

    let malloc_args: Vec<WasmValue> = vec![WasmValue::I32(greet_size)];
    let malloc_return = wamr_malloc
        .call(&wamr_instance, &malloc_args)
        .unwrap()
        .encode()[0];

    println!(
        "guest heap 0x{:02X}, guest absolute 0x{:02X}, host {:02X?}",
        malloc_return - GUEST_MEM_OFFSET as u32,
        malloc_return,
        guest_to_host_ptr(&wamr_instance, malloc_return).unwrap()
    );

    write_to_wamr_mem(&wamr_instance, malloc_return, greet_string.as_bytes());

    let guest_data = read_from_wamr_mem(&wamr_instance, malloc_return, greet_string.len() as u32);
    let data_str = std::str::from_utf8(&guest_data).unwrap();

    println!("{:?}", data_str);
}
