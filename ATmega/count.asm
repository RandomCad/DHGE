.include "m328pdef.inc"
    .def    ledr = r16  ; define LED
    .def    loop1 = r24 
    .def    loopH = r25 ; define both parts of a 16 bit number
    SBI     DDRD, 7     ; set 7 bit -> pin 7 from port D set as output
    CBI     DDRB, 4     ; Clear the 4 bit -> pin 12 is input
    ldi     ledr, 0x80   ; Set LED to on
start:
    SBIC    PINB, 4     ; Scip next instrucktion if bit in PINB not set   
    rjmp    but

    ldi     loop1, LOW(0xffff)
    ldi     loopH, HIGH(0xffff) ; set the counter
loop:
    sbiw    loop1,0x01
    brne    loop

    SBIC    PORTD, 7     ; Scip next if bit in PIND not set
    rjmp    but

    SBI     PORTD, 7
    rjmp    start		; jump back to start

but:
    CBI     PORTD, 7    ; set 7 bit -> LED is set on
    rjmp    start
