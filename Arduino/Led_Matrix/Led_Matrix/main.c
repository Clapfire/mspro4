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


void updates_screen(void);
int array_position(int, int);
void set_latches(int);
void r1(int);
void g1(int);
void b1(int);
void r2(int);
void g2(int);
void b2(int);

char matrix_red[matrix_size*matrix_size];
char matrix_green[matrix_size*matrix_size];
char matrix_blue[matrix_size*matrix_size];

int main(void) {
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

	while(1) {
        updates_screen();
	}

	return 0;
}

void updates_screen(void)
{
    //clock enable and latch are missing
    for(int r = 0; r < 32; r++){
        set_latches(r);

        for(int c = 0; c < 64/matrix_size; c++)
        {
            r1(matrix_red  (array_position(r/matrix_size                 , c)));
            g1(matrix_green(array_position(r/matrix_size                 , c)));
            b1(matrix_blue (array_position(r/matrix_size                 , c)));
            r2(matrix_red  (array_position(r/matrix_size + 32/matrix_size, c)));
            g2(matrix_green(array_position(r/matrix_size + 32/matrix_size, c)));
            b2(matrix_blue (array_position(r/matrix_size + 32/matrix_size, c)));
        }
    }
}

int array_position(int r, int c)
{
    return r*8 + c;
}

void set_latches(int row)
{
    for (int i = 0; i < 5; i++)
	{
		if(row & (1 << i)){
			latch |= (1 << i);
		}
	}
}

void r1(int x)
{
    color ^= (-(unsigned long)x ^ color) & (1UL << r1);
}

void g1(int x)
{
    color ^= (-(unsigned long)x ^ color) & (1UL << g1);
}

void b1(int x)
{
    color ^= (-(unsigned long)x ^ color) & (1UL << b1);
}

void r2(int x)
{
    color ^= (-(unsigned long)x ^ color) & (1UL << r2);
}

void g2(int x)
{
    color ^= (-(unsigned long)x ^ color) & (1UL << g2);
}

void b2(int x)
{
    color ^= (-(unsigned long)x ^ color) & (1UL << b2);
}





void row(int row){
	for (int i = 0; i < 5; i++)
	{
		if(row & (1 << i)){
			latch |= (1 << i);
		}
	}

	sync |= 1 << oe;
	sync &= ~(1 << oe);

	for(int i = 0; i < 8; i++){
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


	}
}
