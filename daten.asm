.include "m328pdef.inc"

start:
  ldi ZL, LOW(daten * 2)
  ldi ZH, HIGH(daten * 2)
  loop:
    lpm R16, Z+ ;lade den ersten wert von daten in R16 un erhöhe direkt auch Z
    cpi R16, 0
    brne loop
  rjmp start

daten:
.db "Hallo!",0

EOF:
  rjmp EOF
