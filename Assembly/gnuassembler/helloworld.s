.data
HWString:
	.ascii "Hello World"
.text
.globl _start
_start:
	#write syscall
	movl $4, %eax
	movl $1, %ebx
	movl $HWString, %ecx
	movl $11, %edx
	int $0x80
	#exit syscall
	movl $1, %eax
	movl $0, %ebx
	int $0x80

