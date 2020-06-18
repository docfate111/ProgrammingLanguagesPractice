.global _start

_start:
	mov r1, #5 @ 0101
	mov r2, #9 @ 1001
	and r0, r1, r2
	b end



end:
	mov r7, #1
	swi 0
