package main

// go:wasm-module zkvm_golang
// export extend
func extend(x, y uint32, tag string) string {
	sum := uint64(x + y)
	prefix := "Honig"
	println(sum, "# of ", prefix, " and ", tag, " as well!")
	return prefix + tag
}

// required for wasi target
func main() {}
