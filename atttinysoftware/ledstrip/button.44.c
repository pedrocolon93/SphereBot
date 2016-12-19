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
    	OUTPUT(A,0);
	OUTPUT(A,1);
	OUTPUT(A,2);
	OUTPUT(A,3);

    	PORTA = 0x00;
	while (1) {
		_delay_ms(50);        
		SET(A,0);
		_delay_ms(1000);
		CLEAR(A,0);
		_delay_ms(50);        
		SET(A,1);
		_delay_ms(1000);
		CLEAR(A,1);
		_delay_ms(50);        
		SET(A,2);
		_delay_ms(1000);
		CLEAR(A,2);
		_delay_ms(50);        
		SET(A,3);
		_delay_ms(1000);
		CLEAR(A,3);
	}
	return 1;
}
