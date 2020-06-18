.global _start

_start:
	adr r3, numbers @ loads address of numbers into r3
	@ stores numbers into block r5 to r8
	ldmia r3, {r5-r8}
	mov r0, r6
	
end:
	mov r7, #1
	swi 0


numbers:
	.word 1, 2, 3, 4, 5

