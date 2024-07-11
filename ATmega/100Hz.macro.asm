.include "m328pdef.inc"

.def work = R16
.def toggleMask = R17

.equ pipser = 0 ; pipser muss an P0 liegen

; start Macro
.Macro togglePin
  in work, @0
  ldi toggleMask, 1 << @1
  eor work, toggleMask
  out @0, work
.endmacro

; Konfig
sbi DDRB, pipser

start:
  ldi work, 5 ; for calling 
  push work
  rcall wait_X_MS
  pop work
  togglePin PORTB, pipser
  rjmp start

; Funktion data
.equ cnt = 4000
.def cntL = R24
.def cntH = R25
.def innerCnt = R18

wait_X_MS: ; X liegt auf dem stack
  in ZL, SPL
  in ZH, SPH
  adiw ZL, 3
  ld innerCnt, Z

  outerLoop:
    ; init the counter
    ldi cntL, LOW(cnt)
    ldi cntH, HIGH(cnt)

    innerLoop:
      sbiw cntL, 1 ; count down by 1 of the word
      brne innerLoop
  
    dec innerCnt
    brne outerLoop
  ret
  
EOF:
  rjmp EOF
