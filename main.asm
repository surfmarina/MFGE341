start:
	   inc r16
	   LDI R16, 0xFF
       OUT DDRB, R16
	   LDI R17, 0x0F ; 1111 in binary= 15 in decimal. Max number on LED clock
	   LDI R20, 0x00 ; starting number, will be updates each iteration and pushed to LED's
MAIN:
		CALL BLINK ; 1 second
		CALL BLINK ; 1 second
		JMP  MAIN
		



BLINK: ; entire blink routine takes 1 second
		LDI R16, 0b0100000
        OUT PORTB, R16
        CALL DELAY
        LDI R16, 0b00000000
        OUT PORTB, R16
        CALL DELAY
        RET

DELAY: ; delays for 0.5 seconds
       LDI R21, 35
Loop1:
       LDI R22, 200
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