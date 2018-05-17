#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "mintf.h"

/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
   
void print_integer(int n, int radix, char* prefix){
    int output_reversed[32] = { 0 }; //chose 32 length bc longest int
    int rem = 0;
    int i = 0;
    char ch;
	unsigned int n_abs;
	
	//gets the absolute value of n if n is negative
    if (n < 0){
		n_abs = n * -1;
        fputc('-',stdout); //print out the negative sign to the screen before anything else
    }
	else{
		n_abs = n;
	}
	
	//print out prefix one character at a time
	while (*prefix !='\0'){
		fputc(*prefix,stdout);
		prefix++;
	}
	if (n_abs==0){
		fputc('0',stdout);
	}
	
	//take the mod, add that to the array of digits, and then divide n by the base
    while (n_abs > 0){
        rem = n_abs % radix;
        output_reversed[i] = rem;
        n_abs = n_abs/radix;
        i++;
    }
	
	//print out the digits from the array backwards to get the correct answer
    i = i-1;
    while (i >= 0){
        if (output_reversed[i] > 9){
            fputc(output_reversed[i] - 10 + 'a',stdout); //convert int greater than 9 to ascii letters
        }
        else{
            ch = output_reversed[i] + '0'; //convert int to character
            fputc(ch,stdout); 
        }
        i--;
    }
    return;
}


void mintf(const char *format , ...){
	char *i;
	va_list args;
	va_start(args,format); //start adding new arguments to the list args
	
	for (i = format; *i != '\0'; i++){
		if (*i == '%'){ //if there is a percent, go through all the checks with the next character
			i++;
			int x = 0;
			char *s = "";

			if (*i == 'd'){ //prints an integer
				x = va_arg(args,int);
				print_integer(x,10,"");
			}
			else if (*i == 'x'){ //prints an integer in hexadecimal format
				x = va_arg(args,int);
				print_integer(x,16,"0x");
			}
			else if (*i == 'b'){ //prints an integer in binary
				x = va_arg(args,int);
				print_integer(x,2,"0b");
			}
			else if (*i == '$'){ //prints a double in dollar/cent  notation
				double money = va_arg(args,double);
				if (money < 0){
					fputc('-',stdout);
					fputc('$',stdout);
					money = -money;
				}
				else{
					fputc('$',stdout);
				}
				int dollars = (int)money;
				double cents = money-dollars;
				cents = cents*100;
				cents = (int)cents;
				print_integer(money,10,"");
				fputc('.',stdout);
				if (cents<10){
					fputc(0+'0',stdout);
				}
				print_integer(cents,10,"");
			}
			else if (*i == 's'){ //prints a string by going through the loop of characters
				s = va_arg(args,char *);
				for (int count = 0; s[count] != '\0'; count++){
					fputc(s[count],stdout);
				}
			}
			else if (*i == 'c'){ //prints a character
			 	x = va_arg(args,int);
				fputc(x,stdout);
			}
			else if (*i == '%'){ //prints a percent if there is "%%" in the string
			 	fputc('%',stdout);
			}
			else{ //if all else fails then just print the original percent
				fputc('%',stdout);
				i--;
			}
		}
		else{ //if no percent just print character in string
			fputc(*i,stdout);
		}

	}
	va_end(args); //end adding arguments to the array args 
	return;
}




