.include "m328pdef.inc"

; programm that should echo the value that is inputed in the usart

.def work = R16
.def char = R17

.equ charCR = 13 
.equ charLF = 10

setup:
  ; usart
  ; Budrate sie 9600 Baud/s
  ; BRR0 = 103
  LDI work, 1
  STS UBRR0L, work ; set the 

  LDI work, 1 << RXEN0 | 1 << TXEN0 ; configure that we onte to send and recieve data
  STS UCSR0B, work

  LDI work, 1 << UPM01 | 1 << UCSZ01 | 1 << UCSZ00
  STS UCSR0C, work
  
loop:
  waytForData:
    LDS work, UCSR0A
    sbrs work, RXC0 ; if next is jumped than ther is new data
      rjmp waytForData
    ; if data was recived echo that data
    LDS char, UDR0 ; read the data that was sent to use
    wayForSend:
      LDS work, UCSR0A
      sbrs work, UDRE0 ; if next is jumped than ther is no data to be setn -> data is already sent
        rjmp waytForData
      ; if data was recived echo that data
      STS UDR0, char;
      CPI char, charCR
      BRNE loop;
      LDI char, charLF
      rjmp wayForSend
  

EOF:
  rjmp EOF
