;
; zwei_ton_piebser.asm
;
; Created: 03.05.2024 11:36:33
; Author : Notebook
;

; Schreiben Sie ein Programm mit dem Sie nacheinander 2 Töne mit einem Piepser ausgeben.
; Lesen Sie die Töne aus den Programmspeicher aus.
; Lassen Sie zwischen beiden eine kurze Pause.
; Verwenden Sie die Funktionen der Timer für die Erzeugung der Töne und die Steuerung der zeitlichen Abläufe.

.def work = R16

.equ piepser = 6
.equ count = 31250-1

; IV:
.org 0x0000
rjmp start

.org 0x0016
rjmp ISR_Timer1_OCMA


reset_Z:
	ldi ZL, LOW(daten*2)
	ldi ZH, HIGH(daten*2)

ISR_Timer1_OCMA:
	in work, TCCR0B
	sbrc work, CS02
		rjmp aus
	lpm work, Z+
	cpi work, 0
	breq reset_Z
	out OCR0A, work
	in work, TCCR0B
	sbr work, 1<<CS02
	out TCCR0B, work
reti

aus:
	cbr work, 1<<CS02
	out TCCR0B, work
reti

start:

ldi ZL, LOW(daten*2)
ldi ZH, HIGH(daten*2)

; Timer0 Konfig:
; OC0A -> automatisches Toggeln
; CTC- Mode
ldi work, 1<<COM0A0 | 1<<WGM01
out TCCR0A, work

; Timer 1 Konf
ldi work, HIGH(count)
sts OCR1AH, work
ldi work, LOW(count)
sts OCR1AL, work

ldi work, 1<<OCIE1A
sts TIMSK1, work

ldi work, 1<<WGM12 | 1<<CS12
sts TCCR1B, work

sei

; PIN Konfig
sbi DDRD, piepser

; Prescaler 256


; Replace with your application code
main:
	
    rjmp main


daten:
.db 70, 200, 0, 0
