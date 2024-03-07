// Copyright 2024 RISC Zero, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

use risc0_zkvm::guest::env;
use wasmi::{Config, Engine, Linker, Module, Store};

fn main() {
    // TODO: Commit to hash of this wasm?
    let wasm: Vec<u8> = env::read();
    let input_string: String = env::read();
    let input_len = input_string.len() as i32;

    env::commit(&input_string);

    let mut config = Config::default();
    // config.wasm_mutable_global(false);
    config.wasm_sign_extension(true);
    config.wasm_multi_value(false);
    config.floats(false);
    let engine = Engine::new(&config);
    let module = Module::new(&engine, &wasm[..]).unwrap();

    let linker = <Linker<()>>::new(&engine);
    let mut store = Store::new(&engine, ());
    let instance = linker
        .instantiate(&mut store, &module)
        .unwrap()
        .start(&mut store)
        .unwrap();
    let guest_memory = instance
        .get_memory(&store, "memory")
        .ok_or("failed to get guest memory")
        .unwrap();

    let wasm_init= instance
        .get_typed_func::<(), ()>(&store, "_initialize")
        .expect("register init guest func");
    let ahoy = instance
        .get_typed_func::<(i32, i32), u64>(&store, "ahoy")
        .expect("register ahoy guest func");
    let malloc = instance
        .get_typed_func::<i32, i32>(&store, "malloc")
        .expect("register _malloc guest func");

    wasm_init.call(&mut store, ()).unwrap();
    let input_string_ptr = malloc
        .call(&mut store, input_len)
        .unwrap();
    guest_memory
        .write(&mut store, input_string_ptr as usize, input_string.as_bytes())
        .unwrap();

    let ahoy_resp = ahoy
        .call(&mut store, (input_string_ptr, input_len))
        .unwrap();

    let ahoy_ptr_guest = (ahoy_resp >> 32) as u32;
    let ahoy_size_guest = (ahoy_resp & 0x000000000ffffffff) as u32;

    let mut ahoy_bytes = vec![0; ahoy_size_guest as usize];
    guest_memory
        .read(&store, ahoy_ptr_guest as usize, &mut ahoy_bytes[..])
        .unwrap();

    let output_string = String::from_utf8(ahoy_bytes).unwrap();
    env::commit(&output_string);
}
