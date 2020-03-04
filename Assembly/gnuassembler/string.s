.data
	HelloWorldString:
		.asciz "Hello World of Assembly!"
	Hola:
		.asciz "H3110"
.bss
	.lcomm Destination, 100
	.lcomm DestinationUsingRep, 100
	.lcomm DestinationUsingStos, 100
.text
	.globl _start
	_start:
		nop
		movl $HelloWorldString, %esi
		movl $Destination, %edi
		movsb
		movsw
		movsl
		#setting/clearing the DF flag
		std #set
		cld #clear
		rep movsb
		std
		cld
		leal HelloWorldString, %esi
		movl $1, %eax
		movl $0, %ebx
		int $0x80
