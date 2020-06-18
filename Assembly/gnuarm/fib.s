.global _start

_start:
	mov r0, #0 @ first term of fibo
	mov r1, #1 @ second term of fibonacci
	mov r3, #11 @ r3th term of fibonacci
next:
	sub r3, r3, #1
	cmp r3, #0
	bne add
	b end

add:  
	add r2, r0, r1
	mov r0, r1
	mov r1, r2
	b next
end:
	mov r7, #1
	swi 0
