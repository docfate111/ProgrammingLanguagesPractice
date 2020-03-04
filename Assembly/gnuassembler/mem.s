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
		#mov immediate value into register
		movl $10, %eax
		#mov immediate value into memory location
		movw $50, Int16
		#mov data between registers:
		movl %eax, %ebx
		#mov data from memory to register
		movl Int32, %eax
		#mov data from register to memory
		movb $3, %al
		movb %al, ByteLocation
		#mov data into indexed memory location
		#location decided by baseaddress(offset, index, datasize)
		movl $0, %ecx
		movl $2, %edi
		movl $22, IntegerArray(%ecx, %edi, 4)
		#syscall to exit
		movl $1, %eax
		movl $0, %ebx
		int $0x80
