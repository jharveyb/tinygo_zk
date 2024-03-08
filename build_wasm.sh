#!/bin/bash

INFILE="megaopt_go.wasm"
OUTFILE="megaopt.aot"
OUTFILE_RV32="megaopt_rv32im.aot"
NATIVE="--target=x86_64 --cpu=znver3"
# base rv32, small ABI, no special F or D handling, add M

"$(pwd)"/../wasm-micro-runtime/wamr-compiler/build/wamrc --disable-simd -v=5 $NATIVE -o $OUTFILE $INFILE

# WAMRC_LLC_COMPILER=/usr/lib/ccache/clang \
# WAMRC_LLC_FLAGS="--target=riscv32-unknown-unknown-elf -c -O3" \
# 	"$(pwd)"/../wasm-micro-runtime/wamr-compiler/build/wamrc \
# 	--disable-simd -v=5 \
# 	--target=riscv32 --target-abi=ilp32 --cpu=generic-rv32 --cpu-features=m \
# 	-o $OUTFILE_RV32 $INFILE
