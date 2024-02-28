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
TRISD=0x00;
PORTD=0x00;
TRISC=0x80;
PORTC=0x00;
TXSTA=0x24;
RCSTA=0x90;
BRGH=1;
SPBRG=25;
command(0x01);
while(1)
{
if(RCREG=='2')
{
command(0x01);
char a[]={"saran"};
command(0x80);
for(int i=0;i<=4;i++)
{
data(a[i]);
}
__delay_ms(1000);
}
else if(RCREG=='0')
{
command(0x01);
char a[]={"rithi"};
command(0x80);
for(int j=0;j<=4;j++)
{
data(a[j]);
}
__delay_ms(1000);
}
else if(RCREG=='6')
{
command(0x01);
char a[]={"muru"};
command(0x80);
for(int k=0;k<=3;k++)
{
data(a[k]);
}
__delay_ms(1000);
}
else if(RCREG=='4')
{
command(0x01);
char a[]={"santo"};
command(0x80);
for(int l=0;l<=4;l++)
{
data(a[l]);
}
__delay_ms(1000);
}
//__delay_ms(100);
}
}