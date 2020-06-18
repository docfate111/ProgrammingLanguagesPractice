.global _start

_start:
	mov r4, #1
	mov r5, #2
	stmdb sp!, {r4, r5} @ push both onto stack
	mov r4, #3
	mov r5, #4
	add r0, r4, #0 @ add 3 to r0
	add r0, r0, r5 @ add 4 to r0
	ldmia sp!, {r4, r5} @ put values from stack back in r4, r5
	add r0, r0, r4 @ add 1 to r0
	add r0, r0, r5 @ add 2 to r0
end:
	mov r7, #1
	swi 0


