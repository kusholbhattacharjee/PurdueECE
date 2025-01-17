/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include "hw02.h"
   
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
