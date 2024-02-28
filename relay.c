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
TRISC=0x00;
TRISD=0x00;
TRISB=0x00;
initial();
int a=0000,b,c,d,e,f,g;
while(a<=9999)
{
b=a/10;
c=a%10;
d=b/10;
e=b%10;
f=d/10;
g=d%10;
command(0x80);
data(f+0x30);
data(g+0x30);
data(e+0x30);
data(c+0x30);
a++;
__delay_ms(1);
if(a>=2000&&a<=2300)
{
PORTB=0x01;
}
else if(a>=7000&&a<=8000)
{
PORTB=0x01;
}
else
{
PORTB=0x00;
}
}
}
