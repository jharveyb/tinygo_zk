package main

//go:wasm-module zkvm_golang
//export extend
func extend(x, y uint32) {
	sum := uint64(x + y)
	prefix := "Festivus"
	println(sum, "days of", prefix)
}

// required for wasi & wasm target
func main() {}
