#!/bin/bash

INFILE="tinygo_main.wasm"
DCEFILE="superopt_go.wasm"
OUTFILE="megaopt_go.wasm"

DCE="wasm_opt_metadce.json"

DCEDECOMP="optsuper.wat"
OPTDECOMP="optmega.wat"

wasm-metadce $INFILE --graph-file $DCE -o $DCEFILE
wasm-opt -O --remove-imports --vacuum --dae-optimizing $DCEFILE -o $OUTFILE

wasm2wat $DCEFILE -o $DCEDECOMP
wasm2wat $OUTFILE -o $OPTDECOMP