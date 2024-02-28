use anyhow::{Error, Ok};
use wasmi::{Linker, Value};

fn main() -> anyhow::Result<()> {
    // have to load this at build time to go no_std
    let go_wasm_path = "megaopt_go.wasm";
    let wasm_bytes = std::fs::read(go_wasm_path)?;

    // We have to map the error as we're using wasmi in no_std mode.
    let engine = wasmi::Engine::default();
    let module = wasmi::Module::new(&engine, &wasm_bytes[..]).map_err(Error::msg)?;

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
        .map_err(Error::msg)?
        .start(&mut store)
        .map_err(Error::msg)?;
    let guest_memory = instance
        .get_memory(&store, "memory")
        .ok_or(Error::msg("failed to get guest memory"))?;

    println!(
        "Guest memory state: {:?}",
        guest_memory.current_pages(&store)
    );

    const SAMPLE_SIZE: usize = 2 << 9;
    let read_guest_mem = |s: &wasmi::Store<()>| -> anyhow::Result<()> {
        let mut read_buf: [u8; SAMPLE_SIZE] = [0; SAMPLE_SIZE];
        guest_memory
            .read(s, 2 << 15, &mut read_buf)
            .map_err(Error::msg)?;
        println!("Guest memory Page 2: {:?}", read_buf);
        Ok(())
    };
    read_guest_mem(&store)?;

    // Register guest funcs
    let extend = instance
        .get_typed_func::<(i32, i32), u64>(&store, "extend")
        .map_err(Error::msg)?;
    let ahoy = instance
        .get_typed_func::<(i32, i32), u64>(&store, "ahoy")
        .map_err(Error::msg)?;
    let malloc = instance
        .get_typed_func::<i32, i32>(&store, "_malloc")
        .map_err(Error::msg)?;

    // Ask guest to make a buffer for host to write to; we have to free later
    let greet_string = "Honig";
    let greet_bytes = greet_string.as_bytes();
    let greet_size = greet_bytes.len() as i32;

    let greet_ptr = malloc.call(&mut store, greet_size).map_err(Error::msg)?;
    let greet_ptr_host = greet_ptr as usize;

    println!("Guest ptr: {:X}", greet_ptr);

    // Write to guest memory directly, yolo
    guest_memory
        .write(&mut store, greet_ptr_host, greet_bytes)
        .map_err(Error::msg)?;
    read_guest_mem(&store)?;

    // quick maths
    let maths = extend.call(&mut store, (1, 2)).map_err(Error::msg)?;

    println!("Quick maths: {:?}", maths);

    // call a guest func on the written string
    let ahoy_resp = ahoy
        .call(&mut store, (greet_ptr, greet_size))
        .map_err(Error::msg)?;
    read_guest_mem(&store)?;

    let ahoy_ptr_guest = (ahoy_resp >> 32) as u32;
    let ahoy_size_guest = (ahoy_resp & 0x000000000ffffffff) as u32;
    eprintln!(
        "Guest result ptr: {:X}, size: {:X}",
        ahoy_ptr_guest, ahoy_size_guest
    );

    // read output of guest func from guest memory
    let mut ahoy_bytes = vec![0; ahoy_size_guest as usize];
    guest_memory
        .read(&store, ahoy_ptr_guest.try_into()?, &mut ahoy_bytes[..])
        .map_err(Error::msg)?;
    eprintln!("Guest output: {:?}", std::str::from_utf8(&ahoy_bytes)?);

    anyhow::Ok(())
}