#include<pic.h>
__CONFIG(0x3F72);
#define _XTAL_FREQ 4000000
#define LED RD0
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
while(1)
{
if(RCREG=='1')
{
LED=1;
}
else if(RCREG=='0')
{
LED=0;
}
}
}