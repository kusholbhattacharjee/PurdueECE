#include <stdio.h> //needed for printf
#include <stdlib.h> //needed for EXIT_SUCCESS
#include "sorting.h"
#include <time.h>


int main(int argc,char  ** argv) {

	clock_t start,end; 	//IO_time
	clock_t s,e; 		//sorting_time
	start = clock();

	if(argc<2){
		return EXIT_FAILURE;
	}

	Node* load = Load_From_File(argv[1]);
	Node* sort = load;
	s = clock();
	sort = Shell_Sort(load);
	e = clock();
	Save_To_File(argv[2],sort);
	
	while(sort!=NULL){
		load = sort;
		sort = sort->next;
		free(load);
	}
	end = clock();
	double IO_time = (double)((end-start)/CLOCKS_PER_SEC);
	double sorting_time = (double)((e-s)/CLOCKS_PER_SEC);
	printf("\nI/O time: %le",IO_time);
	printf("\nSorting time: %le\n",sorting_time);	

	return EXIT_SUCCESS; 
}


