.global _start

_start:
	mov r7, #3 @ syscall keyboard
	mov r0, #0 @ input stream keyboard
	mov r2, #1 @ read 1 char
	ldr r1, =character
	swi 0

_uppercase:
	ldr r1, =character
	ldr r0, [r1]
	bic r0, r0, #32
	str r0, [r1]
_write:
	mov r7, #4 @ syscall output to screen
	mov r0, #1 @ output monitor
	mov r2, #1 @ number of characters
	ldr r1, =character
	swi 0
	
end:
	mov r7, #1
	swi 0

.data
character:
	.ascii " "

