#!/bin/bash

export RISC0_DEV_MODE=true; RISC0_PPROF_OUT=./profile.pb cargo run --release
