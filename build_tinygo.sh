#!/bin/bash

FLAGS="-no-debug -panic=trap -scheduler=none -gc=leaking"

# TARGET="-target=wasm-unknown"
TARGET="-target=wasm"

OUTFILE="tinygo_main.wasm"
DECOMP="optdefault.wat"

INFILE="main.go"

COMP="tinygo"

# shellcheck disable=SC2086
$COMP build -o $OUTFILE $FLAGS $TARGET $INFILE

wasm2wat $OUTFILE -o $DECOMP
