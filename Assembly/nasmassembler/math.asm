SECTION .data
addChar: db '+',0
subChar: db '-',0
mulChar: db 'X',0
divChar: db '/',0
msg: db '%d%c%d =%d',10,0
SECTION .text
extern printf
global main
main:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    sub esp, 4 ;reserve 4 bytes

    mov eax, 8
    mov edx, 4
    xor ecx, ecx
    add ecx, eax
    push ecx
    mul ecx
   ; push edx
    push DWORD [mulChar]
    push eax
    push msg
    call printf

    mov esp, ebp
    pop ebp
    ret