/*
* Led_Matrix.c
*
* Created: 9/11/2016 11:54:18 AM
* Author : Kasper
*/

#define F_CPU 16000000UL

#define BIT(x) (0x01<<(x))
#define bit_set(p, m) ((p)|=(m))
#define bit_clr(p, m) ((p)&=~(m))

#define r1 BIT(2)
#define g1 BIT(3)
#define b1 BIT(4)
#define r2 BIT(5)
#define g2 BIT(6)
#define b2 BIT(7)
#define color PORTD

#define clk BIT(0)
#define lat BIT(1)
#define oe BIT(2)
#define sync PORTB

#define a BIT(0)
#define b BIT(1)
#define c BIT(2)
#define d BIT(3)
#define e BIT(4)
#define latch PORTC

#define matrix_size 8

#include <stdio.h>
#include <avr/io.h>
#include <util/delay.h>

char matrix_red[matrix_size * matrix_size];
char matrix_green[matrix_size * matrix_size];
char matrix_blue[matrix_size * matrix_size];


char matrix_red[matrix_size * matrix_size] = {
	0, 1, 0, 1, 0, 1, 0, 1,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0
};

char matrix_blue[matrix_size * matrix_size] = {
	0, 0, 0, 0, 0, 0, 0, 0,
	1, 0, 1, 0, 1, 0, 1, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0
};

char matrix_green[matrix_size * matrix_size] = {
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 1, 0, 1, 0, 1, 0, 1,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0
};

void draw(int);
void row(int);
void draw_screen(void);

int main(void)
{
	DDRC = 0xFF;
	DDRB = 0xFF;
	DDRD = 0xFF;

	sync = 0x00;
	color = 0x00;
	latch = 0x00;


	while (1)
	{
		/*
		for(int i = 0; i < 32; i++){
		row(i);
		bit_set(sync, lat);
		bit_clr(sync, lat);
		}
		


		//sync |= 1 << lat;
		//sync &= ~(1 << lat);
		*/
		draw_screen();
	}

	return 0;
}

void row(int row)
{
	for (int i = 0; i < 5; i++)
	{
		if (row & (1 << i))
		{
			latch |= (1 << i);
		}
		else{
			latch &= ~(1 << i);
		}
	}

	//bit_set(sync, oe);
	//bit_clr(sync, oe);
	
	draw(row);
}

void draw(int row)
{
	bit_set(sync, oe);
	bit_clr(sync, oe);
	for (int i = row*matrix_size; i < (row*matrix_size  + matrix_size); i++)
	{
		if (matrix_red[i])
		{
			bit_set(color, r1);
			//color |= 1 << r1;
		}
		else{
			bit_clr(color, r1);
		}

		if (matrix_green[i])
		{
			bit_set(color, g1);
			//color |= 1 << g1;
		}
		else{
			bit_clr(color, g1);
		}

		if (matrix_blue[i])
		{
			bit_set(color, b1);
			//color |= 1 << b1;
		}
		else{
			bit_clr(color, b1);
		}
		
		if (matrix_red[i+32])
		{
			bit_set(color, r2);
			//color |= 1 << r2;
		}
		else{
			bit_clr(color, r2);
		}
		
		if (matrix_green[i+32])
		{
			bit_set(color, g2);
			//color |= 1 << r2;
		}
		else{
			bit_clr(color, g2);
		}
		
		if (matrix_blue[i+32])
		{
			bit_set(color, b2);
			//color |= 1 << r2;
		}
		else{
			bit_clr(color, b2);
		}
		
		for(int i = 0; i < (64/matrix_size); i++){

			bit_set(sync, clk);
			bit_clr(sync, clk);
			//sync |= 1 << clk;
			//sync &= ~(1 << clk);
		}

	}
}

void draw_screen(void){
	int bit_count;
	for (int i = 0; i < 32; i++)
	{
		for (int ii = 0; ii < 5; ii++)
		{
			if (i & (1 << ii))
			{
				latch |= (1 << ii);
			}
			else{
				latch &= ~(1 << ii);
			}

			
			switch (i)
			{
				case (64/matrix_size):
				bit_count = 1;
				break;
				
				case (64/matrix_size)*2:
				bit_count = 2;
				break;
				
				case (64/matrix_size)*3:
				bit_count = 3;
				break;
				
				default :
				bit_count = 0;
				break;
			}
			
			draw(bit_count);
		}
		
		bit_set(sync, lat);
		bit_clr(sync, lat);
	}
}