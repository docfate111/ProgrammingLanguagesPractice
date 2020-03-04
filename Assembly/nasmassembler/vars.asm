SECTION .data
fmt: db "Value of the variables: %d, %d ",0,10
sum: db "Their sum is %d",0,10
SECTION .text

extern printf
global main

main:
    push ebp
    mov ebp, esp
    sub esp, 10
    mov ebx, 5
    mov eax, 10
    xor ecx, ecx
    add ecx, ebx
    add ecx, eax
    mov DWORD [ebp-4], ecx
    push ebx
    push eax
    push fmt
    call printf
    push DWORD [ebp-4]
    push sum
    call printf
    mov esp, ebp
    pop ebp
    ret