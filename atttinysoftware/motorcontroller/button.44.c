// main.c
//
// A simple blinky program for ATtiny85
// Connect red LED at pin 2 (PB3)
//
// electronut.in

#include <avr/io.h>
#include <util/delay.h>
#include <math.h>

#define LOW 0
#define HIGH 1

#define INPUT(port,pin) DDR ## port &= ~(1<<pin)
#define OUTPUT(port,pin) DDR ## port |= (1<<pin)
#define CLEAR(port,pin) PORT ## port &= ~(1<<pin)
#define SET(port,pin) PORT ## port |= (1<<pin)
#define TOGGLE(port,pin) PORT ## port ^= (1<<pin)
#define READ(port,pin) (PIN ## port & (1<<pin))

int main (void)
{
    // set PB3 to be output

//    OUTPUT(D, 3); // port D, pin 3 as output
//    SET(D, 3); // set port D pin 3 to HIGH
//    CLEAR(D, 3); // set it to LOW
//
//    INPUT(B, 5);
//    if (READ(B, 5) == HIGH)
   
    OUTPUT(A,0);
    OUTPUT(A,1);
    //PORTA = 0xFF;
    while (1) {
        
      
		SET(A,1);
        CLEAR(A,0);
        _delay_ms(2000);
        SET(A,0);
        CLEAR(A,1);
        _delay_ms(2000);
	}
    

return 1;
}
