.global _start

_start:
	mov r1, #1
	mov r2, #2
	str r1, [sp, #-4]! @ push onto stack and resest sp
	str r2, [sp, #-4]!
	ldr r0, [sp], #+4 @ pop off stack
	ldr r0, [sp], #+4
end:
	mov r7, #1
	swi 0


numbers:
	.word 1, 2, 3, 4, 5

