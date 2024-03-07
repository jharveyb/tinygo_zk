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

use risc0_zkvm::{default_prover, ExecutorEnv};
use wasm_methods::{WASM_INTERP_ELF, WASM_INTERP_ID};

fn run_guest_wasm() {

    let go_wasm_path = "megaopt_go.wasm";
    let wasm_bytes = std::fs::read(go_wasm_path).unwrap();
    let input_string = "Honig".to_string();

    let env = ExecutorEnv::builder()
        .write(&wasm_bytes).unwrap()
        .write(&input_string).unwrap()
        .build().expect("");

    // Obtain the default prover.
    let prover = default_prover();

    // Produce a receipt by proving the specified ELF binary.
    let receipt = prover.prove(env, WASM_INTERP_ELF).unwrap();

    receipt.verify(WASM_INTERP_ID).expect(
        "Code you have proven should successfully verify; did you specify the correct image ID?",
    );

    let result: (String, String) = receipt.journal.decode().unwrap();
    println!("{:?}", result);
}

fn main() {
    run_guest_wasm();
}
