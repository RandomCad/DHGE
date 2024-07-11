.include "m328pdef.inc"

;es sollen interupts verwendet werden:
.org 0x0000
rjmp start

.org 0x001c
rjmp ISR_Timer0_OCM

;define pin to togleMask
.equ toglePinDef = 1

ISR_Timer0_OCM:
  in R15, SREG ; save the statusregister
  ldi togleMask, 1 << toglePinDef ; set wich pin whil be changed
  rcall toglePin
  out SREG, R15  ; reset statusregister
  reti; reset i bit for interupts and return

; defines of pins
.def work = R16
.def togleMask = R17

;Konfig
start:
  sbi DDRB, toglePinDef ; set pin B0 as output

  ; TCCR0A muss noch COMOA0 gesetzt werden, damit der pin immer getogelt wird.
  ldi work, 1 << WGM01 ; setze CMP-Mode
  out TCCR0A, work ;

  ; Set compare value
  ldi work, 70
  out OCR0A, work

  ; activate interup
  ldi work, 1 << OCIE0A
  sts TIMSK0, work

  ; set prescaler and start Timer
  ldi work, 1 << CS02
  out TCCR0B, work ; Set the prescaler and start the Timer
  
  ; set i to realy acitvate interupts
  sei

  ; Timer config
  main:
    rjmp main
toglePin:
  in work, PORTB
  eor work, togleMask
  out PORTB, work
  ret 

endOfFile:
  rjmp endOfFile;
