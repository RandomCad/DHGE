.include "m328pdef.inc"

.def work = R16

setup:
  LDI work, 0x07
  OUT DDRB, work

  SBI PORTD, 4

  ;Konfig TImer0.
  LDI work, 1 << WGM01
  OUT TCCR0A, work

  LDI work, 1 << CS01 | 1 << CS01
  OUT TCCR0B, work

  LDI work, 7
  OUT OCR0A, work

loop:
  IN work, TCNT0
  OUT PORTD, work

EOF:
  rjmp EOF;
