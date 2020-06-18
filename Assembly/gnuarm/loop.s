.global _start

_start:
	mov r1, #9
	mov r0, #0
next:
	teq r1, r0
	beq end
	b inc

inc:  
	add r0, r0, #1
	b next
end:
	mov r7, #1
	swi 0
