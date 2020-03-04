%include 'functions.asm'
SECTION .text
global _start
_start:
    mov ecx, 47
    jmp countUp
countUp:
    inc ecx
    mov eax, ecx
    push eax
    mov eax, esp
    call sprintLF
    pop eax
    cmp ecx, 57
    jne countUp
    call quit
