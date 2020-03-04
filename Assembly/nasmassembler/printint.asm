SECTION .data
i: dd 120
fmt: db "Value of my integer: %d",10,0
SECTION .text

extern printf
global main

main:
    push ebp
    mov ebp, esp
    push DWORD [i]
    push fmt
    call printf
    mov esp, ebp
    pop ebp
    ret