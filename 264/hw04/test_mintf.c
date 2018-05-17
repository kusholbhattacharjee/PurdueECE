#include <stdio.h>
#include <stdlib.h>
#include "mintf.h"

int main(int argc, char* argv[]){
	
	mintf("The number %d is %c %s. ",5,'v',"cool");
	mintf("The binary version is %b and hex %x",5,10);
	mintf(". I have %$ and %% %z % loool",-5.04);
	mintf("/ Then he gets %$\nlolol",83.136);
	return EXIT_SUCCESS;

}
