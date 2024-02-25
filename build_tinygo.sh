#!/bin/bash

FLAGS="-no-debug -panic=trap -scheduler=none -gc=leaking"
# TARGET="-target=wasm"
TARGET="-target=wasi"
OUTFILE="-o tinygo_main.wasm"
INFILE="main.go"

# shellcheck disable=SC2086
tinygo build $OUTFILE $FLAGS $TARGET $INFILE