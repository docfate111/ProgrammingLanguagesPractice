; Hello World Program - asmtutor.com
; Compile with: nasm -f elf helloworld.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld.o -o helloworld
; Run with: ./helloworld
SECTION .data 
	%define STD_OUT 1
	%define SYS_WRITE 4
	%define SYS_EXIT 1	
	%define ZERO_STATUS 0
	msg db 'Hello World!', 0Ah
	len equ $-msg
SECTION .text
global _start

_start:
	mov edx, len
	mov ecx, msg
	mov ebx, STD_OUT
	mov eax, SYS_WRITE
	int 80h
	jmp _exit

_exit:
	mov ebx, ZERO_STATUS
	mov eax, SYS_EXIT
	int 80h


