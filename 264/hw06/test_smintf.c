#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include "smintf.h"

int main(int argc, char* argv[]){

	//char* s = base(-20,2,"0x");
	//printf("%s\n",s);
    char* awe = smintf("Hello %s %c a %b %x. It is %d and gets %% %$ %f ","LOLOLOLOL",'I',10,-12,9,45.046);
	printf("%s",awe);
	free(awe);
	
	char* k = smintf("Hello %c ",'o');
	printf("%s",k);
	free(k);
	
	char* l = smintf("Hello %x ",-78);
	printf("%s",l);
	free(l);

	char* m= smintf("Hello %$ ",56.89);
	printf("%s",m);
	free(m);

	char* n = smintf("Hello %b ",5);
	printf("%s",n);
	free(n);

	char* o = smintf("Hello %s ","This took me 13 hours!");
	printf("%s",o);
	free(o);
	
	return EXIT_SUCCESS;
	
}
