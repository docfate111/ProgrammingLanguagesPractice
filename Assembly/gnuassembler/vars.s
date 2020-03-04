.data
	HelloWorld:
		.ascii "Hello world!"
	ByteLocation:
		.byte 10
	Int32:
		.int 2
	Int16:
		.short 3
	Float:
		.float 10.23
	IntegerArray:
		.int 10, 20, 30, 40, 50
.bss
	.comm LargeBuffer, 10000
.text
	.globl _start
	_start:
		nop
		#syscall to exit
		movl $1, %eax
		movl $0, %ebx
		int $0x80
