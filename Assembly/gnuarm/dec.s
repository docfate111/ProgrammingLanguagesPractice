.global _start

_start:
	mov r1, #2
	mov r0, #50
next:
	cmp r1, r0
	bne dec
	b end

dec:  
	sub r0, r0, #2
	b next
end:
	mov r7, #1
	swi 0
