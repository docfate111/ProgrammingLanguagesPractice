.data
.balign 4
fifteen:
	.word 0
.balign 4
thirty:
	.word 0

.text
.global _start
	
_start:
	ldr r1, addr_fifteen @ move address to r1
	mov r3, #15
	str r3, [r1] @ store 15(value in r3) into memory held in r1
	ldr r2, addr_thirty @ move address to r2
	mov r3, #30
	str r3, [r2]
	
	ldr r1, addr_fifteen
	ldr r1, [r1]
	ldr r2, addr_thirty
	ldr r2, [r2]
	add r0, r1, r2
	
end:
	mov r7, #1
	swi 0

addr_fifteen: .word fifteen
addr_thirty: .word thirty

