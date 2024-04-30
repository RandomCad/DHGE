.include "m328pdef.inc"
;
; Toggle Pin mit Interrupt
;
; Created: 26.04.2024 14:41:09
; Author : A.Grimm
;

; MC mit 16MHz -> 4ms entprellen
; Taster an PD2 -> lowaktiv
; LED PD7 -> highaktiv

.def work = R16
.def toggleMask = R17

.equ LED = 7
.equ Taster = 2
.equ entprellCount = 16000

;Interruptverktortabelle
.org 0x0000			//Reset
rjmp start
nop
rjmp togglePin      // wird interrupted

start:
;Initialisierung
sbi DDRD, LED		//Pin als Ausgang festsetzen
LDI toggleMask, 1<<LED
;cbi DDRB, Taster
sbi PORTD, Taster	//internen Pull-Up-Widerstand aktivieren

;StackPointer initialisiern
LDI work, HIGH(RAMEND)
OUT SPH, work
LDI work, LOW(RAMEND)
OUT SPL, work

;Interrupt-konfiguragtion
sbi EIMSK, INT0
LDI work, 1<<ISC01
STS EICRA, work

SEI 
main:
	
    rjmp main

togglePin:
  IN R15, SREG
  RCALL entprellen
  SBIC PINB, Taster
	RET
  IN  work, PORTD
  EOR work, toggleMask
  OUT PORTD, work
  OUT SREG, R15
  RETI

entprellen:
	LDI R25, HIGH(entprellCount)
	LDI R24, LOW(entprellCount)
	sechZehnBitLoop:
	  SBIW R24, 1
	  BRNE sechZehnBitLoop
RET

