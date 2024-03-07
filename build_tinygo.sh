#!/bin/bash

FLAGS="-no-debug -panic=trap -scheduler=none -gc=leaking"

# custom target with bulk-memory enabled
# TARGET="-target=wasm-unknown-alloc"
# one wasm memory page vs. two
TARGET="-target=./wasm-onepage.json"
# TARGET="-target=wasm"

OUTFILE="tinygo_main.wasm"
DECOMP="optdefault.wat"

INFILE="main.go"

COMP="$HOME/tinygo/build/tinygo"
# COMP="tinygo"

# shellcheck disable=SC2086
$COMP build -o $OUTFILE $FLAGS $TARGET $INFILE

wasm2wat $OUTFILE -o $DECOMP
