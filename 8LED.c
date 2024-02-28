#include<pic.h>
__CONFIG(0X3F72);
void main()
{
TRISD= 0x00;
PORTD= 0x55;
}