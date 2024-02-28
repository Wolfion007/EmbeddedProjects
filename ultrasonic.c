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
int temp,distance;
TRISB=0x01;PORTB=0x00;
TRISD=0x00;PORTD=0x00;
TRISC=0x00;PORTC=0x00;
initial();
T1CON=0x00;
while(1)
{
TMR1H=0x00;
TMR1L=0x00;
RB1=1;
__delay_ms(0.01);
RB1=0;
while(RB0==0);
TMR1ON=1;
while(RB0==1);
TMR1ON=0;
temp=((TMR1H<<8)|TMR1L);
distance=(temp*0.017);
int a,b,c,d,e,f;
a=distance/10;
b=distance%10;
c=a/10;
d=a%10;
e=c/10;
f=c%10;
command(0x80);
data(e+0x30);
data(f+0x30);
data(d+0x30);
data(b+0x30);
__delay_ms(500);
}
}