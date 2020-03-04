SECTION .data
x: dd 34
y: dd 29
msg: db 'X is greater than Y',10,0
msg2: db 'Y is greater than X',10,0
SECTION .bss

SECTION .text
extern printf
global main

main:
    ;create stack frame
    push ebp
    mov ebp, esp
    ;if(x>y): msg else: msg2
    mov eax, DWORD [x]
    mov ebx, DWORD [y]
    cmp eax, ebx
    jg bigger
    push DWORD msg2
    call printf
    mov esp, ebp
    pop ebp
    ret
bigger:
    push msg
    call printf
    mov esp, ebp
    pop ebp
    ret