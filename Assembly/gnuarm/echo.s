.global _start
	_start:

		MOV R7, #3 @ Syscall read from keyboard
		MOV R0,  #0 @ Input stream keyboard
		MOV R2, #10 @ Read 10 characters
		LDR R1, =message @ Put string in message
		SWI 0
		
	_write:
		MOV R7, #4 @ Syscall to output to screen
		MOV R0, #1 @ Output to monitor
		MOV R2, #5	@ # of characters to write
		LDR R1, =message @ Print string in message
		SWI 0
		
	end:
		MOV R7, #1
		SWI 0
		
.data
	message:
		.ascii " "
