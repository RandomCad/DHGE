.include "m328pdef.inc"

; USART asyncrone 250k Baudrate
;

.def work = R16

USART_SETUP:
  ldi work, 0
  sts UBRR0H, work
  ldi work, 3
  sts UBRR0L, work

EOF:
  rjmp EOF;
