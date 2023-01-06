// by DanielTronic Labs 
// danieltronic808@gmail.com
// 05/01/2023

#include <DN22D08.h>
#include <TimerOne.h>
int latchPin = A3;            //connect latchPin 595
int clockPin = A4;           //connect clockPin 595
int dataPin = A5;            // connect dataPin 595
int OE_595 = A2;            // connect  OE 595

int k1 = 12; //button1
int k2 = 10; //button2
int k3 = 8;  //button3
int k4 = A0; //button4

DN22D08 dn;// instantiate DN22D08 object

void display_mult(void)
{
   dn.Init();
}

void setup()
{
  dn.begin(latchPin, clockPin, dataPin, OE_595); //
  Timer1.initialize(5000);
  Timer1.attachInterrupt(display_mult); // multiplexed display

  pinMode(k1, INPUT_PULLUP);
  pinMode(k2, INPUT_PULLUP);
  pinMode(k3, INPUT_PULLUP);
  pinMode(k4, INPUT_PULLUP);
}

void loop() {
  noInterrupts();
  interrupts();

  if (digitalRead(k1) == 0) {
    dn.relay(1, HIGH);      // relay 1 ON
    dn.setvalue(1);//print display 7 segments
  }
  else{
    dn.relay(1, LOW);       // relay 1 OFF
  }

  if (digitalRead(k2) == 0) {
    dn.relay(2, HIGH);      // relay 2 ON
    dn.setvalue(2);//print display 7 segments
  }
  else{
    dn.relay(2, LOW);      // relay 2 OFF
  }

  if (digitalRead(k3) == 0) {
    dn.relay(3, HIGH);      // relay 3 ON
    dn.setvalue(3);//print display 7 segments
  }
  else{
    dn.relay(3, LOW);      // relay 3 OFF
  }

  if (digitalRead(k4) == 0) {
    dn.relay(4, HIGH);      // relay 4 ON
    dn.setvalue(4);//print display 7 segments
  }
  else{
    dn.relay(4, LOW);       // relay 2 OFF
  }

}


