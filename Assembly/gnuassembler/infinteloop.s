.data
HWString:
	.ascii "Hello World"
.text
	.globl _start

	_start:
		nop
		movl $10, %eax
		#set zero flag
		xorl %eax, %eax
		movl $10, %ecx
		movq $10, %rcx
		jz PrintLoop
		jmp ExitCall
	ExitCall:
		movl $1, %eax
		movl $0, %ebx
		int $0x80
	PrintLoop:
		#number of times to loop
		movl $10, %ecx
		PrintTenTimes:
			pushq %rax
			#printing syscall
			movl $4, %eax
			movl $1, %ebx
			movl HWString, %ecx
			movl $11, %edx
			int $0x80
			popq %rcx
			loop PrintTenTimes
			jmp ExitCall

