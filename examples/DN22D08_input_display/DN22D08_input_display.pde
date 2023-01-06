#include <DN22D08.h>
#include <TimerOne.h>
int latchPin = A3;            //connect latchPin 595
int clockPin = A4;           //connect clockPin 595
int dataPin = A5;            // connect dataPin 595
int OE_595 = A2;            // connect  OE 595

int IN1 = 2; // input1
int IN2 = 3; // input2
int IN3 = 4; // input3
int IN4 = 5; // input4
int IN5 = 6; // input5
int IN6 = 7; // input6
int IN7 = 9; // input7
int IN8 = 11; // input8

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

  pinMode(IN1, INPUT_PULLUP);
  pinMode(IN2, INPUT_PULLUP);
  pinMode(IN3, INPUT_PULLUP);
  pinMode(IN4, INPUT_PULLUP);
  pinMode(IN5, INPUT_PULLUP);
  pinMode(IN6, INPUT_PULLUP);
  pinMode(IN7, INPUT_PULLUP);
  pinMode(IN8, INPUT_PULLUP);
}

void loop() {
  noInterrupts();
  interrupts();

  if (digitalRead(IN1) == 0) {
    dn.relay(1, HIGH);      // relay 1 ON
    dn.setvalue(1);//print display 7 segments
  }
  else {
    dn.relay(1, LOW);       // relay 1 OFF
  }

  if (digitalRead(IN2) == 0) {
    dn.relay(2, HIGH);      // relay 2 ON
    dn.setvalue(2);//print display 7 segments
  }
  else {
    dn.relay(2, LOW);       // relay 2 OFF
  }

  if (digitalRead(IN3) == 0) {
    dn.relay(3, HIGH);      // relay 3 ON
    dn.setvalue(3);//print display 7 segments
  }
  else {
    dn.relay(3, LOW);       // relay 3 OFF
  }

  if (digitalRead(IN4) == 0) {
    dn.relay(4, HIGH);      // relay 4 ON
    dn.setvalue(4);//print display 7 segments
  }
  else {
    dn.relay(4, LOW);       // relay 4 OFF
  }

  if (digitalRead(IN5) == 0) {
    dn.relay(5, HIGH);      // relay 5 ON
    dn.setvalue(5);//print display 7 segments
  }
  else {
    dn.relay(5, LOW);       // relay 5 OFF
  }

  if (digitalRead(IN6) == 0) {
    dn.relay(6, HIGH);      // relay 6 ON
    dn.setvalue(6);//print display 7 segments
  }
  else {
    dn.relay(6, LOW);       // relay 6 OFF
  }

  if (digitalRead(IN7) == 0) {
    dn.relay(7, HIGH);      // relay 7 ON
    dn.setvalue(7);//print display 7 segments
  }
  else {
    dn.relay(7, LOW);       // relay 7 OFF
  }

  if (digitalRead(IN8) == 0) {
    dn.relay(8, HIGH);      // relay 8 ON
    dn.setvalue(8);//print display 7 segments
  }
  else {
    dn.relay(8, LOW);       // relay 8 OFF
  }

}




