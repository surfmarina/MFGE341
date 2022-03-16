start:
    inc r16
    LDI R16, 0xFF
    OUT DDRB, R16; makes all of port B outputs (LED's)
	OUT DDRD, R16; makes all of port D outputs (secondary LED's for 4-bit binary tally)
	LDI R17, 0b00000000; initial outputs for PORT D: all LED's off

MAIN:
	OUT PORTD, R17
	CALL BLINK; two calls = 2 seconds (blinks on primary LED)
	CALL BLINK

	; add 1 to tally every iteration
	LDI R16, 0x01
	ADD R17, R16

	LDI R20, 0b00011111
	SUB R20, R17; if these equal zero, restart entire thing and call start
	BRNE MAIN
	; else, we've reached the end of our counter. Restart the entire program
	JMP start

BLINK: ; takes one second
       LDI R16, 0b00100000
       OUT PORTB, R16
       CALL DELAY
       LDI R16, 0b00000000
       OUT PORTB, R16
       CALL DELAY
       RET
 
DELAY: ; takes 0.5 seconds
       LDI R21, 29
Loop1:
       LDI R22, 180
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
