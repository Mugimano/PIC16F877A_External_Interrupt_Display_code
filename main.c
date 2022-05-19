#include<pic.h>
#define _XTAL_FREQ 2000000
int i,num;
#define RS RB1
#define EN RB2

//LCD declaration

void lcd_init();  
void command(unsigned char);
void lcd_data(unsigned char);
void lcd_send(const char *word);
void lcd_show();

// ISR_Function Declaration

void interrupt isr() 
{
for(i=0; i<7;i++)
{
lcd_show();
PORTC = PORTC << 1;
__delay_ms(1000);
INTF = 0;
}
//__delay_ms(1000);
command(0x01);
}

// Main_Function

void main()
{
int i;
TRISB = 0xF9;
PORTB = 0x00;
TRISC = 0xC0;
PORTC = 0x00;
TRISD = 0x00;
PORTD = 0x00;
INTCON = 0b11010000;

INTF = 0;        //reset the external interrupt flag
INTEDG = 1;      //interrupt on the rising edge
INTE = 1;        //enable the external interrupt
GIE = 1;         //set the Global Interrupt Enable
lcd_init();
//num = interrupt _isr;
while(2)
{ 
interrupt _isr(); // ISR function call     
PORTC = 0x01;
__delay_ms(1000);
}
} 
 
// LCD_Funcion_Defenition

void lcd_init()
{
 command(0x01);
 command(0x06);
 command(0x0C);    
 command(0x38);
}

void command(unsigned char com)
{
 PORTD = com;
 RS = 0;
 EN = 1;
 __delay_ms(10);
 EN = 0;
}

void lcd_data(unsigned char rec)
{
 PORTD = rec;
 RS = 1;
 EN = 1;
 __delay_ms(10);
 EN = 0;
}
 
void lcd_send(const char *word)
{
while(*word)
{
lcd_data(*word++);
__delay_ms(10);
}
}

//ISR_LCD_Display_Function

void lcd_show()
{
if (INTF == 1){
 
command(0x85);
lcd_send("WARNING");

command(0xC1);
lcd_send("INTERRUPT OCCUR");
}
}