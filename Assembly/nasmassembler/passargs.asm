SECTION .data
msg: db "Arguments: %s",10,0
SECTION .text
extern printf
global main
main:
    push ebp
    mov ebp, esp
    mov eax, DWORD [ebp+8] ;number of args
    mov ebx, DWORD [ebp+12] ;arguments
    xor ecx, ecx
    jmp loop
loop:
    ;push all registers we need to stack to preserve them
    push ebx
    push eax
    push ecx
    ;print
    push DWORD [ebx] ;4bytes
    push msg ;4 bytes
    call printf
    add esp, 8 ;8 bytes to reset esp
    ;restore values
    pop ecx
    pop eax
    pop ebx

    inc ecx
    add ebx, 4 ;move to next value (4 bytes apart)
    cmp ecx, eax
    jne loop
    jmp exit
exit:
    mov esp, ebp
    pop ebp
    ret
