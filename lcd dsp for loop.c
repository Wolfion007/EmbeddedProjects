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
initial();
while(1)
{
char a[]={" ECE DEPARTMENT "};
command(0x80);
for(int i=0;i<=15;i++)
{
data(a[i]);
}
char b[]={"   PANIMALAR   "};
command(0xC0);
for(int j=0;j<=14;j++)
{
data(b[j]);
}
__delay_ms(1000);
}
