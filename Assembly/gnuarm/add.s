.global _start

_start:
	mov r1, #0x02
	mov r2, #0x02
	cmp r2, r1
	beq other
	bgt another
	mov r0, #0xff
	b end
other:
	mov r0, #0x05
	b end

another:
	mov r0, #0x11
	b end
end:
	mov r7, #1
	swi 0

