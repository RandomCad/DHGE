.include "m328pdef.inc"

.def work = R16
.def char = R17
.equ Taster = 0 ; taster auf B0

cbi DDRB, Taster
sbi PORTB, Taster ; activate Pull up

ldi work, 0
sts UBRR0H, work
ldi work, 3
sts UBRR0L, work
; Enable receiver and transmitter
ldi work, (1<<RXEN0)|(1<<TXEN0)
sts UCSR0B,work
; Set frame format: 8data, 2stop bit
ldi work, (1<<USBS0)|(3<<UCSZ00)
sts UCSR0C,work

start:
  sbic PIND, Taster
    rjmp start

  ldi ZL, LOW(SerialData)
  ldi ZH, HIGH(SerialData)

  ;ned the 0 test logic and the correspondig call to USART_Transmit


USART_Transmit:
  ; Wait for empty transmit buffer
  lds work , UCSR0A
  sbrs work ,UDRE0
  rjmp USART_Transmit
  ; Put data (r16) into buffer, sends the data
  sts UDR0,char
ret

EOF:
  rjmp EOF;

SerialData:
.db "Button Pressed" , 10 ,13, 0
