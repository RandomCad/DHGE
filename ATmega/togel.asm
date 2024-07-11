.include "m328pdef.inc"

    .def  work = r16  ; define LED
    .def  togleMask = r17  ; Wenn 1 wurde der Taster im Letzten zykluss betätigt. Wenn 0 wurde er nicht betätigt.
    .def  tast = r18;
    SBI   DDRD, 7     ; set 7 bit -> pin 7 from port D set as output
    CBI   DDRB, 4     ; Clear the 4 bit -> pin 12 is input
    SBI   PORTB, 4     ; Clear the 4 bit -> pin 12 is input
    ldi   work, 0x80   ; Set LED to on
    ldi togleMask, 0x80
start:
  SBIS PINB, 4
    RCALL togglePin ;
  rjmp start

togglePin:
; entprellen
  LDI R25, HIGH(16000)
  LDI R24, LOW(16000)
  entprellen:
    SBIW R24, 1
    BRNE entprellen
  SBIC PINB, 4;
    ret;
  IN work, PORTD
  EOR work, togleMask;
  out PORTD, work
stuck:
  SBIS PINB, 4;
    rjmp stuck;
  ret
