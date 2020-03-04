%include 'functions.asm'
SECTION .data
msg db 'Enter your name: ', 0h
msg2 db 'Hello, ', 0h
SECTION .bss
sinput: resb 20
SECTION .text
global _start

_start:
    mov eax, msg
    call sprint
    mov edx, 20
    mov ecx, sinput
    mov ebx, 0
    mov eax, 3
    int 80h
    mov eax, msg2
    call sprint
    mov eax, sinput
    call sprint
    call quit