SECTION .data
addChar: db '+',0
msg: db '%d%c%d =%d',10,0
SECTION .text
extern printf
global main
main:
    push ebp
    mov ebp, esp
    sub esp, 4 ;reserve 4 bytes

    mov eax, 4
    mov edx, 8
    xor ecx, ecx
    add ecx, edx
    add ecx, eax
    push ecx
    push edx
    push DWORD [addChar]
    push eax
    push msg
    call printf

    mov esp, ebp
    pop ebp
    ret