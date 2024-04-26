.include "m328pdef.inc"

    .def  work = r16  ; define LED
    .def  togleMask = r17  ; Wenn 1 wurde der Taster im Letzten zykluss betätigt. Wenn 0 wurde er nicht betätigt.
    .def  tast = r18;
    SBI   DDRD, 7     ; set 7 bit -> pin 7 from port D set as output
    CBI   DDRD, 1     ; Clear the 4 bit -> pin 12 is input
    SBI   PORTD, 1    ; PORTD 1 is input. set the Pulup

; Stack pointer inizialisierung
  LDI work, HIGH(RAMEND);
  OUT SPH, work
  LDI work, HIGH(RAMEND);
  OUT SPL, work

; interupt config
  sbi EIMSK, 0 ;enables the interupt 0
; EICRA ist neu hinzugekommen und liegt nicht im addressbereich der alten asm befehl. Deswegen muss hier ein Workaround verwendet werden.
  ldi work, 1 << ISC01 ; setze, dass auf die Fallende Flanke beachtet werden soll
  STS EICRA, work

  ldi   work, 0x80   ; Set LED to on
  ldi togleMask, 0x80

start:
  SBIS PIND, 1
    RCALL togglePin ;
  rjmp start

togglePin:
; entprellen
  LDI R25, HIGH(16000)
  LDI R24, LOW(16000)
  entprellen:
    SBIW R24, 1
    BRNE entprellen
  SBIC PINB, 1;
    ret;
  IN work, PORTD
  EOR work, togleMask;
  out PORTD, work
stuck:
  SBIS PIND, 1;
    rjmp stuck;
  ret
