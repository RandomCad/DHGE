;
; Timer0OverFlow1Hz.asm
;
; Created: 30.04.2024 13:55:00
; Author : dozent
;

; PB0 -> LED highaktiv
; PB1 -> LED highaktiv
; 16 MHz CPU-Takt
; 16 000 000 / 2 / 256 -> 31250 -> Interrupts vor Umschalten
.include "m328pdef.inc"

.def work = R16
.def toggleMask = R17
.def status = R15
.def cnt = R18

.equ LED1 = 0
.equ LED2 = 1
.equ count = 125

.org 0x0000
rjmp start

.org 0x001c
rjmp ISR_T0CMP

ISR_T0CMP:
    in status, SREG
    dec cnt
    brne return
	in work, PORTB
	eor work, toggleMask
	out PORTB, work
	ldi cnt, count
	return:
	out SREG, status
RETI


;konfig
start:
ldi work, 255
out DDRB, work
sbi PORTB, LED1

ldi toggleMask, 0b00000011  ;1<<LED1 | 1<<LED2

ldi R24, low(count)
ldi R25, high(count)

;timer-Konfig
ldi work, 1<< OCIE0A
sts TIMSK0, work

ldi work, 1 << WGM01
out TCCR0A, work

ldi work, 249
out OCR0A, work

ldi work, 1 << CS02
out TCCR0B, work

sei

main:
  rjmp main
