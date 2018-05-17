#include <stdio.h> //needed for printf
#include <string.h>
#include <stdlib.h> //needed for EXIT_SUCCESS
#include "genome.h"

int main(int argc, char ** argv){
	/*if (argc != 80){
		printf("You need an input file dumbass.");
	}*/

	//int i;
	int size_of_seq;
	
	//int* lcs = Longest_conserved_gene_sequence(argv[1],&size_of_seq);
	Longest_conserved_gene_sequence(argv[1],&size_of_seq);
	
	printf("Length: %d\n",size_of_seq);

	//for (i=0;i<size_of_seq;i++){
	//	printf("%d ",lcs[i]);
	//}

	return 0;
	
}
