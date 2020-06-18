.data
primes:
	.word 2
	.word 3
	.word 5
	.word 7
.text

.global _start

_start:
	ldr r3, =primes @ loads address of primes into r3
	@ ldr r0, [r3] @ r0 = 2
	@ ldr r0, [r3, #4] @ r0 = 3
	ldr r0, [r3, #12] @ r0 = 5
	
end:
	mov r7, #1
	swi 0


