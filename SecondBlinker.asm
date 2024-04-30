.include "m328pdef.inc"

.def outer = R17
.equ LED = 7  ; LED is on pin 7
.def work = R16
.def toggelMask = R18
.def innerH = R25
.def innerL = R24
.equ innerCnt = 39995
.equ outerCnt = 100


sbi DDRD, LED
ldi toggelMask, 0x80

start:
  ldi outer, outerCnt
  outerLoop:
    ldi innerH, HIGH(innerCnt)
    ldi innerL, LOW(innerCnt)
      innerLoop:
        sbiw innerL, 1
        brne innerLoop
    dec outer
    brne outerLoop
  in work, PORTD
  eor work, toggelMask
  out PORTD, work
  rjmp start

togleOn:

