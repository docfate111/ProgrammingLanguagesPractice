%include 'functions.asm'
SECTION .text
global _start

_start:
    pop     ecx ;first value on stack is number of args
    jmp     nextArg
nextArg:
    cmp     ecx, 0 ;check if ecx is zero
    jz      quit
    pop     eax      ;take next arg off stack
    call    sprintLF
    dec     ecx
    jmp     nextArg
