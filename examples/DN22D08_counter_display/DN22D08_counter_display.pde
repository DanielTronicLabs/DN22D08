//by DanielTronic Labs 05/01/2023
#include <DN22D08.h>
#include <TimerOne.h>
int latchPin = A3;            //connect latchPin 595
int clockPin = A4;           //connect clockPin 595
int dataPin = A5;            // connect dataPin 595
int OE_595 = A2;            // connect  OE 595

int k1 = 12; //button1 reset counter


unsigned long time1 = 0;
unsigned long counter = 0;

DN22D08 dn;// instantiate DN22D08 object


void display_mult(void)
{
  dn.Init();

  time1++;
  if (time1 > 200) { //past 1 second
    time1 = 0;
    counter++;
    if (counter > 9999) {
      counter = 0;
    }
  }
}

void setup()
{

  dn.begin(latchPin, clockPin, dataPin, OE_595); //
  Timer1.initialize(5000);
  Timer1.attachInterrupt(display_mult); // multiplexed display

  pinMode(k1, INPUT_PULLUP);// reset counter

}

void loop() {
  noInterrupts();
  interrupts();

  if (digitalRead(k1) == 0) {// button reset counter
    counter = 0;
  }

  dn.setvalue(counter);//print display 7 segments

}

