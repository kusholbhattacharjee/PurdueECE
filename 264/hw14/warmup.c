#include <pthread.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>


struct Data{
	int max;
	int min;
	int* a;
};


char* _strdup(const char* s) {  // helper function;  okay to use anywhere in this assignment
	return strcpy(malloc(sizeof(*s) * (strlen(s) + 1)), s);
}

/* TODO:  Create a worker function to go with zero_array(..) */
void* worker(void* arg){
	struct Data* data = (struct Data *)arg;
	int* a = data->a;
	int max = data->max;
	int min = data->min;

	int i = min;
	while(i<max){
		a[i]=0;
		i++;
	}
	return NULL;
}

bool zero_array(int* array, int size, int num_threads, char** a_error) {
	/* Given an array, set every element to 0 using multiple threads.
	 *
	 * - If successful, return true and do not modify error at all.
	 *
	 * - In case of any failure, return false and, if a_error != NULL,
	 *   set *a_error to the address of an error message on the heap.
	 *   The caller will be responsible for freeing it.
	 */
	pthread_t* second = malloc(sizeof(pthread_t)*num_threads);
	
	int rtv;
	
	struct Data arr;
	arr.a = array;
	arr.min = 0;
	arr.max = size%num_threads;
	if (arr.max != 0)
		arr.max = (size/num_threads)+1;
	else
		arr.max = (size/num_threads);

	for (int i = 0;i<num_threads;i++){
		rtv = pthread_create(&second[i],NULL,worker,(void *)&arr);	
		pthread_join(second[i],NULL);
		arr.min = arr.max;
		arr.max += 4;	
		if (arr.max > size){
			arr.max = size;
		}
	}
	

	if(rtv!=0){
		if(*a_error==NULL){
			char* message = "Error message on the heap";
			*a_error = _strdup(message);
			return false;
		}
	}
	/*
	for (int j = 0;j<num_threads;j++){
		rtv = pthread_join(second[j],NULL);	
	}*/

	if(rtv!=0){
		if(*a_error==NULL){	
			char* message = "Error message on the heap";
			*a_error = _strdup(message);
			return false;
		}
	}
	
	return true; 
}

int main(int argc, char *argv[]) {
	int array[16] = {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2};
	int size = sizeof(array)/sizeof(*array);
	for(int i=0; i<size; i++) {
		assert(array[i] == 2);
	}

	/*
	worker((void *)&array);
	for(int i=0;i<size;i++){
		assert(array[i]==0);
	}
	return EXIT_SUCCESS;
	*/

	char* error = NULL;
	if( zero_array(array, sizeof(array)/sizeof(*array), 4, &error) ) {
		for(int i=0; i<size; i++) {
			assert(array[i] == 0);
		}
		return EXIT_SUCCESS;
	}
	else {
		fprintf(stderr, "%s\n", error);
		free(error);
		return EXIT_FAILURE;
	}
	
}

