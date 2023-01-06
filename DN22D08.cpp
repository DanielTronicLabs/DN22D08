#include "Arduino.h"
#include "DN22D08.h"
 
DN22D08::DN22D08()
{
 
}

void DN22D08::begin(int latchPin,int clockPin,int dataPin,int oe_595)
{
  _latchPin = latchPin;
  _clockPin = clockPin;
  _dataPin = dataPin;
  _oe_595=oe_595;
  pinMode(latchPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin, OUTPUT);
  pinMode(oe_595, OUTPUT);
  digitalWrite(oe_595, LOW);
  _relay=0;
}
 
void DN22D08::Init()
{
   for (int j = 0; j < 4; j++)
    {
      _option=_data[j];
      digitalWrite(_latchPin, LOW);
      shiftOut(_dataPin, _clockPin, MSBFIRST, _DISP_SEG1[ _option] + _DISP_MUL1[j]);
      shiftOut(_dataPin, _clockPin, MSBFIRST,  _DISP_SEG2[ _option] + _DISP_MUL2[j]);
      shiftOut(_dataPin, _clockPin, MSBFIRST, _relay);//relay
      digitalWrite(_latchPin, HIGH);
      delay(1);
    }
}

void DN22D08::setvalue(int value)
{
   _data[0]=value/1000;
   _aux=value%1000;
   _data[1]=_aux/100;
   _aux=value%100;
   _data[2]=_aux/10;
   _aux=value%10;
   _data[3]=_aux;

}

void DN22D08::relay(int value,boolean state)
{
   if(value>0){
     if(state==HIGH){
        _RELAY[value-1]=1;
     }
     else{
       _RELAY[value-1]=0;
     }
    _relay=_RELAY[0]*1 + _RELAY[1]*2 + _RELAY[2]*4 + _RELAY[3]*8 + _RELAY[4]*16 + _RELAY[5]*32 + _RELAY[6]*64 + _RELAY[7]*128;
   }
}
