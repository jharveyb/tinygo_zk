#!/bin/bash

RUNTIME="wasmi_cli"
BIN="tinygo_main.wasm"
FUNC="extend"
ARGS="2 1"

# shellcheck disable=SC2086
$RUNTIME $BIN --invoke $FUNC $ARGS