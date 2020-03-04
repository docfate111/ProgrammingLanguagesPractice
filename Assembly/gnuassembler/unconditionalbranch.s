.data
	HelloWorld:
		.ascii "Hello world!"
	CallDemo:
		.ascii "Call works!"
.text
	.globl _start
	_start:
		jmp CallMe
		movl $4, %eax
		movl $1, %ebx
		movl $HelloWorld, %ecx
		movl $12, %edx
		int $0x80
		jmp ExitProgram
	ExitProgram:
		movl $1, %eax
		movl $10, %ebx
		int $0x80
	CallMe:
		movl $4, %eax
		movl $1, %ebx
		movl $CallDemo, %ecx
		movl $11, %edx
		int $0x80
		jmp ExitProgram
