#include<pic.h>
__CONFIG(0x3F72);
#define _XTAL_FREQ 4000000
void main()

{
int i=0; 
int A[5]={0x3F, 0x06, 0x5b,0x4F,0x66};
TRISC=0x00;
for(i=0; i<=4; i++)
{
 PORTC= A[i];
 __delay_ms(10);

 PORTC= 0x00; 
 __delay_ms(10);
}
int B[5]={0x6D,0x7D,0x07,0x7F,0x67};
TRISD= 0x00;
for(i=0; i<=4; i++)
{
 PORTD= B[i];
 __delay_ms(10);
 PORTD= 0x00;
 __delay_ms(10);
}
}