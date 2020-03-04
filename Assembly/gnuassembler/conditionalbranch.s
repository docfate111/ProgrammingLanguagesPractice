.data
	HelloWorld:
		.ascii "HelloWorld"
	ZeroFlagSet:
		.ascii "Zero Flag set!"
	ZeroFlagNotSet:
		.ascii "Zero Flag not set!"
.text
	.globl _start
	_start:
		nop
		movl $10, %eax
		jnz FlagSetPrint
		jz FlagNotSetPrint
		jmp ExitCall
	FlagNotSetPrint:
		movl $4, %eax
		movl $1, %ebx
		movl $ZeroFlagNotSet, %ecx
		movl $18, %edx
		int $0x80
		jmp ExitCall
	FlagSetPrint:
		movl $4, %eax
		movl $1, %ebx
		movl $ZeroFlagSet, %ecx
		movl $14, %edx
		int $0x80
		jmp ExitCall
	ExitCall:
		movl $1, %eax
		movl $0, %ebx
		int $0x80
