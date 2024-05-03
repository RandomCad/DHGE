.include "m328pdef.inc"

; der Timer 0 soll am OC0A Pin eine Frequenz fon 440 Hz erzeugen
; ATmega328P wird verwendet auf einem Arduino uno board
; OC0A -> Pin PD6 -> Arduino: Pin 6

; Timer config
; 16_000_000Hz : 880 Hz = 18_181,818181818...
; 18_181,8 : 256 = 71,022727.. -> Prescaler wird 256 werden
; Benötigen CMP-Mode vergleich ist 71.
; in TCCR0A muss WGM01 gesetzt werden -> für CMP-Mode

.def work = R16

; Set the togel pin of the timer as output
sbi DDRD, 6

; TCCR0A muss noch COMOA0 gesetzt werden, damit der pin immer getogelt wird.
ldi work, 1 << WGM01 | 1 << COM0A0 ; setze CMP-Mode
out TCCR0A, work ;

; Set compare value
ldi work, 70
out OCR0A, work

; set prescaler and start Timer
ldi work, 1 << CS02
out TCCR0B, work ; Set the prescaler and start the Timer



endOfFile:
  rjmp endOfFile;
