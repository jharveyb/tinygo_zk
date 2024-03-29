package main

import (
	"unsafe"
)

//export malloc
func malloc(size uint32) uintptr {
	buf := make([]byte, size)
	ptr := &buf[0]
	unsafePtr := uintptr(unsafe.Pointer(ptr))
	return unsafePtr
}

func strToPtr(data string) uint64 {
	ptr := uintptr(unsafe.Pointer(unsafe.StringData(data)))
	return (uint64(ptr) << uint64(32)) | uint64(len(data))
}

//export extend
func extend(x, y int32) int64 {
	return int64(x+y)<<32 + int64(1<<21)
}

//export ahoy
func ahoy(ptr *byte, size uint32) uint64 {
	inputStr := unsafe.String(ptr, size)
	outputString := "21 days of Festivus before " + inputStr
	return strToPtr(outputString)
}

// required for wasi & wasm target
func main() {}
