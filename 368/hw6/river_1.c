#include "river.h"
#include <stdio.h>

int** readFile(char* filename, int *N, int *M){

	int i,j;
	FILE* infile = fopen(filename,"r");	
	fscanf(infile,"%d %d\n",N,M);	
	printf("%d " ,*N);
	printf("%d\n" ,*M);
	
	int **arr = (int **)malloc(((*N)-1) * sizeof(int *));
	for (i=0;i<((*N)-1);i++){
		arr[i] = (int *)malloc(*M * sizeof(int));
		for (j=0;j<(*M);j++){
			fscanf(infile,"%1d",&arr[i][j]);
			//printf("%d ",arr[i][j]);
		}
		//printf("\n");
	}
	
	fclose(infile);	
	return arr;
}


int** crossRiver(int** arr, int N, int M){
	int i;
	int min_turns = INT_MAX;

	for (i=0; i < (N-1); i++){
		if (arr[i][0] == 0){
			continue;
		}
		get_turns(arr,N,M,i,0,0);
	}
}


int main(int argc, char * argv[]){
	int i,j;
	int N,M;
	int** arr = readFile(argv[1],&N,&M);
	
	for (i=0;i<((N)-1);i++){
		for (j=0;j<(M);j++){
			printf("%d ",arr[i][j]);
		}
		printf("\n");
	}

	return 0;
}
