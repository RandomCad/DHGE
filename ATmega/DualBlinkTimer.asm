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

.def work = R16
.def toggleMask = R17
.def status = R15

.equ LED1 = 0
.equ LED2 = 1
.equ count = 31250

.org 0x0000
rjmp start

.org 0x0020
rjmp ISR_T0OVF

ISR_T0OVF:
    in status, SREG
	sbiw R24, 1
	brne return
	in work, PORTB
	eor work, toggleMask
	out PORTB, work
	ldi R24, low(count)
	ldi R25, high(count)
	return:
	out SREG, status
RETI


;konfig
start:
ldi work, 255
out DDRB, work
sbi PORTB, LED1

ldi toggleMask, 0b00000011  //1<<LED1 | 1<<LED2

ldi R24, low(count)
ldi R25, high(count)

;timer-Konfig
ldi work, 1<<TOIE0
sts TIMSK0, work

ldi work, 1<<CS00
out TCCR0B, work

sei

main:
  rjmp main