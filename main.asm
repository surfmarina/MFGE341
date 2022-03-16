start:
    inc r16
    LDI R16, 0xFF
		OUT DDRB, R16; port B are outputs (LED)
	LDI R16, 0x00
		OUT DDRD, R16; port D are inputs (PUSHBUTTON)

	; blink once (on 1 sec, off 1 sec)
	LDI R16, 0b00100001
        OUT PORTB, R16
        CALL DELAY
        LDI R16, 0b00000000
        OUT PORTB, R16
        CALL DELAY

AGAIN:; continuously reads the pushbutton and will only move onto blink when PIND.2 reads as HIGH
	CBI PIND, 2; clear
	CALL DELAY; this is necessary to give pin a chance to read a second button press
	SBIS PIND, 2
	JMP AGAIN
	CALL BLINK
			
BLINK:
		LDI R16, 0b00100001; turns led on
        OUT PORTB, R16
        CALL DELAY
        LDI R16, 0b00000000; turns led off
        OUT PORTB, R16
		CALL DELAY
		SBIS PIND, 2
		JMP BLINK
		JMP AGAIN

			 
DELAY:
       LDI R21, 40
Loop1:
       LDI R22, 200
Loop2:
       LDI R23, 248
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
