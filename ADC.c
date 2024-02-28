#include<pic.h>
__CONFIG(0x3F72);
#define _XTAL_FREQ 4000000
#define RS RC0
#define RW RC1
#define EN RC2
void command(unsigned char y)
{
PORTD=y;
RS=0;
RW=0;
EN=1;
__delay_ms(1);
EN=0;
}
void data(unsigned char z)
{
PORTD=z;
RS=1;
RW=0;
EN=1;
__delay_ms(1);
EN=0;
}
void initial()
{
command(0x38);
command(0x01);
command(0x06);
command(0x0C);
}
void main()
{
ADCON0=0x01;
ADCON1=0xC0;
TRISC=0x00;
TRISD=0x00;
initial();
int temp,b,c,d,e,f,g;
while(1)
{
CHS2=0;CHS1=0;CHS0=0;
__delay_ms(500);
ADCON0=ADCON0|0x04;
__delay_ms(500);
temp=ADRESH<<8;
temp=temp+ADRESL;
temp=temp*.48;
b=temp/10;
c=temp%10;
d=b/10;
e=b%10;
f=d/10;
g=d%10;
command(0x80);
data(f+0x30);
data(g+0x30);
data(e+0x30);
data(c+0x30);
__delay_ms(100);
}
}