.include "m328pdef.inc"

; Pin 0 am Arduino -> PD0

.equ LED = 0 
.def work = R16

.org 0x0000
  rjmp start;
  nop;


start:
  sbi DDRD, LED ; set pin D 0 to 1 in the DDRD reg. -> makes PIN D 0 an output
  cbi DDRD, 2
  sbi PORTD, 2;

  ldi work, 0xff
  out DDRB, work

  ;interupt config
  ldi work, 1 << ISC01 ; configure interupt of ISC01
  sts EICRA, work
  ldi work, 1 << INT0
  sts EIMSK, work


EOF:
  rjmp EOF;
