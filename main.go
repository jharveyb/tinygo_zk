package main

import (
	"unsafe"
)

//export _malloc
func malloc(size uint32) uintptr {
	buf := make([]byte, size)
	ptr := &buf[0]
	unsafePtr := uintptr(unsafe.Pointer(ptr))
	return unsafePtr
}

func strToPtr(data string) uint64 {
	ptr := uintptr(unsafe.Pointer(unsafe.StringData(data)))
	size := uint64(len(data))
	return (uint64(ptr) << uint64(32)) | size
}

//export extend
func extend(x, y int32) int64 {
	sum := int64(x + y)
	lowerVal := int32(1 << 21)
	shiftSum := int64(sum<<32) + int64(lowerVal)
	return shiftSum
}

//export ahoy
func ahoy(ptr *byte, size uint32) uint64 {
	inputStr := unsafe.String(ptr, size)
	outputString := "21 days of Festivus before " + inputStr
	return strToPtr(outputString)
}

// required for wasi & wasm target
func main() {}
