.global _start
_start:
	mov r1, #9 
	mov r2, #9
	tst r1, r2
	beq _are_equal
	mov r0, #12
	b end

_are_equal:
	mov r0, #69

end:
	mov r7, #1
	swi 0
