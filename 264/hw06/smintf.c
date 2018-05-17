/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>
#include "smintf.h"

int _size(char* str){
	int i = 0;
	for (i = 0; str[i] != '\0'; i++ ){}
	return i;
}


char* _base(int n, int radix, char* prefix){
	int num[32] = {0};
	int rem = 0;
	int pos = 0;
	int i = 0;
	unsigned int n_abs;
	char* out = malloc(36); //32 int + 2 prefix + 1 negative + 1 '\0'

	if (n<0){
		n_abs = -n;
		out[pos] = '-';
		pos++;
	}
	else{
		n_abs = n;
	}
	while (*prefix != '\0'){
		out[pos] = *prefix;
		prefix++;
		pos++;
	}
	if (n_abs==0){
		out[pos] = '0';
		pos++;
	}
	
	while (n_abs>0){
		rem = n_abs % radix;
		num[i]=rem;
		n_abs = n_abs/radix;
		i++;
	}

	i = i-1;
	while (i>=0){
		if (num[i]>9){
			out[pos] = num[i]-10+'a';
		}
		else{
			out[pos] = num[i]+'0';
		}
		i--;
		pos++;
	}
	return out;
}
//printf(" %d %c %s ",5,'r',"hehllo");

char* smintf(const char *format, ...){
	int mem = 1;
	va_list args;
	va_start(args,format);
	char *i;
	int length;

	for (i = format; *i != '\0'; i++){
		if (*i == '%'){ //if there is a percent, go through all the checks with the next character
			i++;
			int x = 0;
			char *s = NULL;

			if (*i == 'd'){ //prints an integer
				x = va_arg(args,int);
				s = _base(x,10,"");
				length = _size(s);
				mem += length;
			}
			else if (*i == 'x'){ //prints an integer in hexadecimal format
				x = va_arg(args,int);
				s = _base(x,16,"0x");
				length = _size(s);
				mem += length;
			}
			else if (*i == 'b'){ //prints an integer in binary
				x = va_arg(args,int);
				s = _base(x,2,"0b");
				length = _size(s);
				mem += length;
			}
			else if (*i == '$'){ //prints a double in dollar/cent  notation
				double money = va_arg(args,double);
				if(money<0){
					mem+=7;
				}
				else{
					mem += 6;
				}
			}
			else if (*i == 's'){ //prints a string by going through the loop of characters
				s = va_arg(args,char *);
				for (int count = 0; s[count] != '\0'; count++){
					mem++;
				}
			}
			else if (*i == 'c'){ //prints a character
			 	x = va_arg(args,int);
				mem++;
			}
			else if (*i == '%'){ //prints a percent if there is "%%" in the string
			 	mem++;
			}
			else{ //if all else fails then just print the original percent
				mem++;
				i--;
			}
		}
		else{ //if no percent just print character in string
			mem++;
		}

	}
	
	char *final = malloc(mem);
	int pos=0;
	va_list arg;
	va_start(arg,format);

	for (i = format; *i != '\0'; i++){
		if (*i == '%'){ //if there is a percent, go through all the checks with the next character
			i++;
			int a = 0;
			char *b = "";

			if (*i == 'd'){ //prints an integer
				a = va_arg(arg,int);
				b = _base(a,10,"");
				for(a = 0; b[a]!='\0';a++){
					final[pos] = b[a];
					pos++;
				}
			}
			else if (*i == 'x'){ //prints an integer in hexadecimal format
				a = va_arg(arg,int);
				b = _base(a,16,"0x");
				for(a = 0; b[a]!='\0';a++){
					final[pos] = b[a];
					pos++;
				}
			}
			else if (*i == 'b'){ //prints an integer in binary
				a = va_arg(arg,int);
				b = _base(a,2,"0b");
				for(a = 0; b[a]!='\0';a++){
					final[pos] = b[a];
					pos++;
				}
			}
			else if (*i == '$'){ //prints a double in dollar/cent  notation
				double money = va_arg(arg,double);
				if (money<0){
					final[pos] = '-';
					pos++;
					money = -money;
				}
				final[pos] = '$';
				pos++;
				int dollars = (int)money;
				double cents = money-dollars;
				cents = 100*cents;
				cents = (int)cents;
				b = _base(dollars,10,"");
				for(a = 0; b[a]!='\0';a++){
					final[pos] = b[a];
					pos++;
				}
				final[pos] = '.';
				pos++;
				if(cents<10){
					final[pos] = 0+'0';
					pos++;
				}
				b = _base(cents,10,"");
				for(a = 0; b[a]!='\0';a++){
					final[pos] = b[a];
					pos++;
				}

			}
			else if (*i == 's'){ //prints a string by going through the loop of characters
				b = va_arg(arg,char *);
				for (a = 0; b[a] != '\0'; a++){
					final[pos] = b[a];
					pos++;
				}
			}
			else if (*i == 'c'){ //prints a character
			 	a = va_arg(arg,int);
				final[pos] = a;
				pos++;
			}
			else if (*i == '%'){ //prints a percent if there is "%%" in the string
			 	final[pos] = '%';
				pos++;
			}
			else{ //if all else fails then just print the original percent
				final[pos] = '%';
				i--;
				pos++;
			}
		}
		else{ //if no percent just print character in string
			final[pos] = *i;
			pos++;
		}

	}

	va_end(args);
	return final;
}
