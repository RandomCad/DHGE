.include "m328pdef.inc"

.def work = R16

.equ LED = 6
.equ dunkleTaster = 2
.equ hellTaster = 3
.equ stepi = 1

.org 0x00
rjmp setup
rjmp 0x0000

.org 0x02
rjmp ISR_BUTTON_DOWN
rjmp 0x02
.org 0x04
rjmp ISR_BUTTON_UP
rjmp 0x04

ISR_BUTTON_UP:
  IN work, OCR0A
  SUBI work, stepi
  BRCC RET_ISR_BUTTON
    LDI work, 0
  RET_ISR_BUTTON:
    OUT OCR0A, work
    reti

ISR_BUTTON_DOWN:
  IN work, OCR0A
  ADD work, R17
  BRCC RET_ISR_BUTTON
    LDI work, 255
    rjmp RET_ISR_BUTTON

setup:
  LDI R17, stepi
  
  ;setup of the LED
  LDI work, 1 << LED
  OUT DDRD, work

  ;setup of the buttons thy are low active
  LDI work, 1 << dunkleTaster | 1 << hellTaster
  OUT PORTD, work

  ;button as external interupt setup
  LDI work, 1 << ISC01 | 1 << ISC11
  STS EICRA, work 

  LDI work, 1 << INT0 | 1 << INT1
  OUT EIMSK, work
  
  ;timer configuration
  ; using timer0
  LDI work, 1 << COM0A1 | 1 << WGM01 | 1 << WGM00 ; set fast PWM configuration
  OUT TCCR0A, work

  LDI work, 255
  OUT OCR0A, work

  ; prescaler config which arent neede
  LDI work, 1 << CS00
  OUT TCCR0B, work

  SEI



EOF:
  rjmp EOF
