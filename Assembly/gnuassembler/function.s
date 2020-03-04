.data
HWString:
	.ascii "Hello World"
.bss
	#arguments to pass
	.lcomm StrPtr, 4
	.lcomm StrLen, 4
.text
.globl _start
.type MyFunction, @function
MyFunction:
	#write syscall
	movl $4, %eax
	movl $1, %ebx
	movl StrPtr, %ecx
	movl StrLen, %edx
	int $0x80
	ret
_start:
	nop
	movl $HWString, StrPtr
	movl $11, StrLen
	call MyFunction
	call ExitCall
ExitCall:
	#exit syscall
	movl $1, %eax
	movl $0, %ebx
	int $0x80

