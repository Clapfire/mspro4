/*
* Led_Matrix.c
*
* Created: 9/11/2016 11:54:18 AM
* Author : Kasper
*/

#define F_CPU 16000000UL

#define r1 2
#define g1 3
#define b1 4
#define r2 5
#define g2 6
#define b2 7
#define color PORTD

#define clk 0
#define lat 1
#define oe 2
#define sync PORTB

#define a 0
#define b 1
#define c 2
#define d 3
#define e 4
#define latch PORTC

#define matrix_size 8

#include <stdio.h>
#include <avr/io.h>
#include <util/delay.h>

char matrix_red[matrix_size * matrix_size];
char matrix_green[matrix_size * matrix_size];
char matrix_blue[matrix_size * matrix_size];

int main(void)
{
	DDRC = 0xFF;
	DDRB = 0xFF;
	DDRD = 0xFF;

	sync = 0x00;
	color = 0x00;
	latch = 0x00;

	matrix_red[
	 	 	    0, 0, 0, 0, 0, 0, 0, 0,
			    0, 0, 0, 0, 0, 0, 0, 0,
			    0, 0, 1, 1, 1, 1, 0, 0,
			    0, 0, 1, 1, 1, 1, 0, 0,
			    0, 0, 1, 1, 1, 1, 0, 0,
			    0, 0, 1, 1, 1, 1, 0, 0,
			    0, 0, 0, 0, 0, 0, 0, 0,
			    0, 0, 0, 0, 0, 0, 0, 0
			   ];

	matrix_blue[
			    0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 1, 1, 1, 1, 0, 0,
				0, 0, 1, 1, 1, 1, 0, 0,
				0, 0, 1, 1, 1, 1, 0, 0,
				0, 0, 1, 1, 1, 1, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0
				];

	matrix_green[
			    0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 1, 1, 1, 1, 0, 0,
				0, 0, 1, 1, 1, 1, 0, 0,
				0, 0, 1, 1, 1, 1, 0, 0,
				0, 0, 1, 1, 1, 1, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0
				];

	while (1)
	{
		for(int i = 0; i < 32; i++){
			row(i);
		}
		
		sync |= 1 << lat;
		sync &= ~(1 << lat);
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
	}

	sync |= 1 << oe;
	sync &= ~(1 << oe);

	draw(row);
}

void draw(int row)
{
	for (int i = row; i < (row  + matrix_size); i++)
	{
		if (matrix_red[i])
		{
			color |= 1 << r1;
		}

		if (matrix_green[i])
		{
			color |= 1 << g1;
		}

		if (matrix_blue[i])
		{
			color |= 1 << b1;
		}

		if (matrix_red[i+32])
		{
			color |= 1 << r2;
		}

		if (matrix_green[i+32])
		{
			color |= 1 << r2;
		}

		if (matrix_blue[i+32])
		{
			color |= 1 << r2;
		}

		for(int i = 0; i < (64/matrix_size); i++){
			sync |= 1 << clk;
			sync &= ~(1 << clk);
		}
	}
}