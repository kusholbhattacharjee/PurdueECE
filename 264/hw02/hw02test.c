#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include "hw02.h"

int main(int argc, char* argv[]) {

	print_integer(347238, 8, ":");
	printf("\n");

	print_integer(-456,36,"bXo");
	printf("\n");

	print_integer(INT_MAX,2,"");

	printf("\n");

	print_integer(0,11,"$");
	printf("\n");

	print_integer(INT_MIN,2,"...");
	printf("\n");

	return EXIT_SUCCESS;
}
