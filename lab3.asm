start:
		LDI R16, 0xFF
		OUT DDRB, R16; port B are outputs (LED)
		LDS R16, 0x0A
		LDS R17, 0x06
		ADD R17, R16
		.EQU N, 0x0100	
		STS N, R17

l1:
		LDI R16, 0b00100001
		OUT PORTB, R16
		CALL DELAY
		LDI R16, 0b00000000
		OUT PORTB, R16
		CALL DELAY
		DEC R17
		BRNE RET
		LDS R16, 10
		CALL DELAY
		DEC R16
		BRNE fiveseconds

		; subtract the number B from A, and back up to SRAM 0x0100
		LDS R16, 0x0A
		LDS R17, 0x06
		SUB R16, R17
		.EQU M, 0x0100	
		STS M, R16
l2:
		LDI R16, 0b00100001
		OUT PORTB, R16
		CALL DELAY
		CALL DELAY
		LDI R16, 0b00000000
		OUT PORTB, R16
		CALL DELAY
		CALL DELAY
		DEC R17
		BRNE fiveseconds
JMP: JMP HERE; end the program

			
fivesecons:
		LDI R16, 10; turns led on
        CALL DELAY
        DEC R16
		BRNE RET		 
DELAY:
       LDI R21, 20; 21 for 1/2 second loop 
Loop1:
       LDI R22, 202
Loop2:
       LDI R23, 250
Loop3:
       NOP
       NOP
       DEC R23
       BRNE Loop3
       DEC R22
       BRNE Loop2
       DEC R21
       BRNE Loop1
       RET
