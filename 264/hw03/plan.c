#include <stdlib.h>
#include "mintf.h"

int main(int argc,char *argv[]) {

	// Test 00: empty test
	// Expect: ""
	
	// Test 01: empty string
	mintf("");
	// Expect: ""
	
	// Test 02: %x print_integer hexadecimal
	mintf("%x",10);
	// Expect: "0xa"
	
	// Test 03: test capability to take multiple inputs
	mintf("%x %x",10,11);
	//Expect: "0xa 0xb"
	
	// Test 03: %d integer printing
	mintf("%x %d",10,3);
	//Expect: "0xa 3"
	
	// Test 04: %s string printing
	mintf("%x %d %s",10,3,"lol");
	//Expect: "0xa 3 lol"

	// Test 05: %c character printing
	mintf("%x %d %s %c", 10, 3, "lol", "Y");
	//Expect: "0xa 3 lol Y"
	
	// Test 06: %b binary print_integer
	mintf("%x %d %s %c %b",10,3,"lol","Y",12);
	//Expect: "0xa 3 lol Y 0b1100"
	
	// Test 07: %$ dollar version
	mintf("%x %d %s %c %b %$",10,3,"lol","Y",12,35.86);
	//Expect: "0xa 3 lol Y 0b1100 $35.86"
	
	// Test 08: %% percent sign 
	mintf("%x %d %s %c %b %$ %%hi",10,3,"lol","Y",12,35.86);
	//Expect: "0xa 3 lol Y 0b1100 $35.86 %hi"
	
	// Test 09: \n new line character
	mintf("%x %d %s %c %b %$ %%hi \n",10,3,"lol","Y",12,35.86);
	//Expect: "0xa 3 lol Y 0b1100 $35.86 %hi "
	//        ""
	
	return EXIT_SUCCESS;
}
