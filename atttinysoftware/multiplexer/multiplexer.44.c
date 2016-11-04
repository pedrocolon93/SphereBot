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
   DDRA = 0b00001111;
   while (1) {

      // flash# 1:
      // set PB3 high
       char inputread = READ(B,5)*pow(2,1)+READ(B,4)*pow(2,0);
       switch (inputread){
           case 0b00:
               PORTA = 0b00000001;
               ;
           case 0b01:
               PORTA = 0b00000010;
               ;
           case 0b10:
               PORTA = 0b00000100;
               ;
           case 0b11:
               PORTA = 0b00001000;
               ;
           default:
               PORTA = 0b00000000;
               ;
       }

      _delay_ms(20);

   }

   return 1;
}