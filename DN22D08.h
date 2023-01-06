/*
||
|| @file DN22D08.h
|| @version 1.0
|| @author DanielTronic Labs
|| @contact danieltronic808@gmail.com
||
|| @description
||   This library provides a simple interface to use 
||   a PLC IO RS485 DN22D08 controls the output relays and 
||   multiplexes the 7-segment display to show numerical values.
*/
#ifndef DN22D08_h
#define DN22D08_h
 
#include "Arduino.h"
 
class DN22D08
{
  public:
    DN22D08();
    void begin(int latchPin,int clockPin,int dataPin,int oe_595);
    void Init();
    void setvalue(int value);
    void relay(int value,boolean state);
  private:
    int _pin;
    int _latchPin = 0;            //connect 595 ’ pin 12
    int _clockPin = 0;           //connect 595 ’s pin11
    int _oe_595 = 0;           //connect 595 ’s pin11
    int _dataPin = 0;            // connect 595 ’s pin 14

    int _DISP_SEG1[10] = {16, 16, 24, 24, 24, 8, 8, 16, 24, 24};
    int _DISP_SEG2[10] = {218, 128, 26, 152, 192, 216, 218, 144, 218, 208};
    int _DISP_MUL1[4] = {38, 36, 34, 6};
    int _DISP_MUL2[4] = {0, 4, 4, 4};
    int _data[4] = {0, 0, 0, 0};
    int _RELAY[8] = {0, 0, 0, 0, 0, 0, 0, 0};
    int _option=0;
    int _aux=0;
    int _relay=0;
};
 
#endif
