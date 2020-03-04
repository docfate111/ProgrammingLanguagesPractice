%include 'functions.asm'
SECTION .data
msg1 db 'Hello world!', 0Ah
msg2 db 'Another message!', 0Ah
SECTION .text
global _start

_start:
    mov eax, msg1
    call sprint
    mov eax, msg2
    call sprint
    call quit