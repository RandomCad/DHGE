.include "m328pdef.inc"

.org 0x0000
rjmp setup ; start the main programm
reti

.org 0x0016 ; interupt vector for COMPA on timer 0
rjmp TIMER1_COMPA
reti



.equ LED = 3; Led to blink is to be psiitioned on the 3 Pin -> DDRD should be used.
;The LED should blink at a frequenzy of 1Hz
; The esiast wy to impliment this is with a togle mask
.def work = R16
.def togleMask = R17


TIMER1_COMPA:
  in work, PORTD;
  EOR work, togleMask
  out PORTD, work
reti; return to normal code execution

setup:
  ; TCCR1A isn't needed
  ldi work, 1 << WGM12 | 1 << CS10 | 1 << CS12 ; acifate ctc
  sts TCCR1B, work

  ; Fill the compare value
  ldi work, HIGH(15625/2)
  sts OCR1AH, work
  ldi work, LOW(15625/2)
  sts OCR1AL, work

  ldi work, 1 << OCIE1A
  sts TIMSK1, work ; activate the inpterupts


  ; 16MHz / 2 = 8 MHz -> all 8_000_000 Tackte muss umgeschalten werden
  ; 2_000_000 Tackte pro flip.
  ;16 bit = 65536
  SBI DDRD, LED
  LDI togleMask, 1 << LED
  sei;

EOF:
  rjmp EOF ; Infinit loop at EOF 
