#include <stdio.h> //needed for printf
#include <stdlib.h> //needed for EXIT_SUCCESS
#include "sorting.h"


int main(int argc,char  ** argv) {
	//argv[1] = input.b
	//argv[2] = seq.t
	//argv[3] = output.b
	
	if(argc<3){
		return EXIT_FAILURE;
	}

	printf("Working");

	double comps = 0.0;
	double moves = 0.0;
	int size = 0;
	int longs_read;

	int longs_stored;
	int seq_len;
	
	FILE *infile = fopen(argv[1],"rb");
	fseek(infile,0,SEEK_END);
	size = ftell(infile);
	printf("Size from ftell%d\n",size);
	long* array = Load_From_File(argv[1],&size);
	printf("size after Loading %d\n",size);
	longs_read = size;
	printf("longs_read: %d\n",longs_read);
	
	int i=0;
	for(i=0;i<size;i++){
		printf("%ld ",array[i]);
	}
	printf("\n");
	Shell_Insertion_Sort(array,size,&comps,&moves); //insertion sort
	for(i=0;i<size;i++){
		printf("%ld ",array[i]);
	}
	printf("\n");
 	
	
	seq_len = Print_Seq(argv[2],size); //prints sequence of gap to second argument

	longs_stored = Save_To_File(argv[3],array,size);
	
	printf("Number of long integers read: %d\n",longs_read);
	printf("Number of long integers stored: %d\n",longs_stored);
	printf("Length of sequence: %d\n",seq_len);
	printf("Number of comparisons: %le\n",comps);
	printf("Number of moves: %le\n",moves);
	printf("%d",size);
	//printf("I/O time: %le");
	//printf("Sorting time: %le");
	
	return EXIT_SUCCESS; 
}
