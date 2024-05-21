.include "m328pdef.inc"

.equ LED = 3; Led to blink is to be psiitioned on the 3 Pin -> DDRD should be used.
;The LED should blink at a frequenzy of 1Hz
; The esiast wy to impliment this is with a togle mask
.def work = R16
.def togleMask = R17

; 16MHz / 2 = 8 MHz -> all 8_000_000 Tackte muss umgeschalten werden
; 2_000_000 Tackte pro flip.
;16 bit = 65536
SBI DDRD, LED
LDI R17, 1 << LED


start:
  ;684 sould be X
  LDI work, HIGH(684)
  MOV XH, work
  LDI work, LOW(684)
  MOV XL, work
  loop: ;does 255 * 6 + 4 Cycles
    SBIW XH:XL,1 ; 2 Cycles
    ; Z is set if the howl is 0x0000
    ; Elongat cycle
    ldi work, 244
    innerLoop: ; does 255 *6 - 1 Cycles 
      nop
      nop
      nop
      SUBI work, 1 
      BRBC 1,innerLoop ; Branch if Zero Flag cleared ; 2 Cycles in the loop
    BRBC 1,loop ; Branch if Zero Flag cleared ; 2 Cycles in the loop
  IN work, PORTD
  EOR work, togleMask
  OUT PORTD, work
rjmp start;


EOF:
  rjmp EOF ; Infinit loop at EOF 
