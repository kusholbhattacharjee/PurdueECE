#include "river.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
	int R = 0;
	int C = 0;

/*
int main(int argc, char * argv[]){
	int i,j;
	int N,M;
	Node ** arr = readFile(argv[1],&N,&M);
	
	for (i=0;i<((N-1));i++){
		for (j=0;j<(M);j++){
			printf("(%d) (%d) (%d) ",arr[i][j].topleft,arr[i][j].up,arr[i][j].topright);
		}
		printf("\n");
		for (j=0;j<(M);j++){
			printf("(%d)  %d  (%d) ",arr[i][j].left,arr[i][j].val,arr[i][j].right);
			//printf("%d ",arr[i][j].val);
		}
		printf("\n");
		for (j=0;j<(M);j++){
			printf("(%d) (%d) (%d) ",arr[i][j].bottomleft,arr[i][j].down,arr[i][j].bottomright);
		}
		printf("\n");
	}
	int min_path = 1000;
	Node* root = NULL;
	min_path = dikstra(arr, N, M, 0, 0, root);
	//min_path = minLength(arr,(M-1),0,0);
	printf("%d\n",min_path);

	for (i=0;i<((N-1));i++){
		free(arr[i]);
	}
	free(arr);
	return 0;
}*/
	readFile(argv[1],&R,&C);
	int final = BIG_D(R,C);
	printf("%d\n",final);
	free(turns);
	free(nodes);
	return 0;
}
