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
	pushq %ebp
	movl %esp, %ebp
	#write syscall
	movl $4, %eax
	movl $1, %ebx
	movl 8(%ebp), %ecx
	movl 12(%ebp), %edx
	int $0x80
	movq %ebp, %esp #restore old esp
	popq %ebp
	ret
_start:
	nop
	push $13
	pushq $HWString
	movl $HWString, StrPtr
	movl $11, StrLen
	call MyFunction
	#move esp back
	addl $8, %
	call ExitCall
ExitCall:
	#exit syscall
	movl $1, %eax
	movl $0, %ebx
	int $0x80

