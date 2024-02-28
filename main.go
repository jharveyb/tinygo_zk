package main

import (
	"unsafe"
)

var livePointers = map[uintptr][]byte{}

//export _malloc
func malloc(size uint32) uintptr {
	buf := make([]byte, size)
	ptr := &buf[0]
	unsafePtr := uintptr(unsafe.Pointer(ptr))
	livePointers[unsafePtr] = buf
	return unsafePtr
}

//export _free
func free(ptr uintptr) {
	delete(livePointers, ptr)
}

func strToLeakedPtr(data string) uint64 {
	// must copy before leaking
	outStr := data
	ptr := uintptr(unsafe.Pointer(unsafe.StringData(outStr)))
	size := uint64(len(outStr))
	return (uint64(ptr<<32) | size)
}

func ptrToString(ptr uintptr, size uint32) string {
	return unsafe.String((*byte)(unsafe.Pointer(ptr)), size)
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
	outputString := "21 days of Festivus before" + inputStr
	return strToLeakedPtr(outputString)
}

// required for wasi & wasm target
func main() {}
