.include "m328pdef.inc"
;
; HalloWelt.asm
; Programm schreibt Hallo Welt! auf serielle Schnittstelle
; Created: 24.05.2024 09:14:52
; Author : A.Grimm
;

.def work = R16
.def char = R17

.equ LED = 0

; USART asyncron 250k Baudrate -> MC-Takt / 16 / Zielbaudrate - 1 = 3
; 1-Stopp-Bit, 8 Daten-Bit, gerade Parität
ldi work, 0
sts UBRR0H, work
ldi work, 3
sts UBRR0L, work		;für die Baudrate

ldi work, 1<<TXEN0 | 1<<RXEN0
sts UCSR0B, work		;Senden und Empfangen aktiviert

ldi work, 1<<UPM01 | 1<<UCSZ00 | 1<<UCSZ01
sts UCSR0C, work

sbi DDRB, LED

; Replace with your application code
start:
  ldi ZL, LOW(daten*2)
	ldi ZH, HIGH(daten*2)
  
  rcall write

	weiter:
		empfangen:
		lds work, UCSR0A
	    sbrs work, RXC0
			rjmp empfangen

		lds char, UDR0
		cpi char, 101
		breq einschalten
		cpi char, 97
		breq ausschalten

    rjmp weiter

einschalten:
	sbi PORTB, LED
  ldi ZL, LOW(LEDOnData*2)
	ldi ZH, HIGH(LEDOnData*2)
  rcall write
	rjmp weiter

ausschalten:
	cbi PORTB, LED
  ldi ZL, LOW(LEDOfData*2)
	ldi ZH, HIGH(LEDOfData*2)
  rcall write
	rjmp weiter

write:
	lpm char, Z+
	cpi char, 0
	breq cont
	  
	check:
	  lds work, UCSR0A
	  sbrs work, UDRE0
	    rjmp check

	sts UDR0, char
	rjmp write
  cont:
  ret

daten:
.db "Hallo Welt!", 10, 13, 0

LEDOnData:
.db "LED On", 10, 13, 0, 0

LEDOfData:
.db "LED Of", 10, 13, 0, 0
