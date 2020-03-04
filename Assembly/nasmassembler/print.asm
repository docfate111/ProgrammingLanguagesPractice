SECTION .data

msg:db 'Hello world!',10,0

SECTION .text

extern printf ;externally available
global main

main:
    push ebp
    mov ebp, esp ;change stack frame(where it starts)
    push msg
    call printf
    mov esp, ebp ;restore stack pointer
    pop ebp
    ret