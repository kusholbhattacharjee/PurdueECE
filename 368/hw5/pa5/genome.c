#include <stdio.h> //needed for printf
#include <string.h>
#include <stdlib.h> //needed for EXIT_SUCCESS
#include "genome.h"

int get_next(int** graph,int row,int n);
int max_length(int** graph, int node,int n);

int max_length(int** graph, int node,int n){
	int length = 1;
	int temp = 0;
	int i = 0;
	for (i = 0; i < n; i++){
		if (graph[node-1][i] == 1){
			temp = 1 + max_length(graph,i+1,n);
			if (temp > length)
				length = temp;
		}
	}
	return length;
}

//int get_seq(int** graph,int* lcs,int row,int n){
//	int i;
//	for (i=0;i++;i
//	return;
//}

int *Longest_conserved_gene_sequence(char *filename, int *size_of_seq){
	
	//READ FILE AND MAKE ARRAYS (arr[i][j])
	int m,n,i,j;
	FILE* infile = fopen(filename,"rb");	
	fread(&n,sizeof(int),1,infile); 
	fread(&m,sizeof(int),1,infile);	
	int **arr = (int **)malloc(m * sizeof(int *));
	//printf("%d " ,n);
	//printf("%d\n" ,m);
	for (i=0;i<m;i++){
		arr[i] = (int *)malloc(n * sizeof(int));
		for (j=0;j<n;j++){
			fread(&arr[i][j],sizeof(int),1,infile);
			//printf("%d ",arr[i][j]);
		}
		//printf("\n");
	}
	fclose(infile);	

	
	//CREATE GRAPH
	int ** graph = (int**)malloc(n * sizeof(int*));
	for (i=0;i<n;i++){
		graph[i] = (int*)malloc(n* sizeof(int));
	}
	
	//int* graph[n] = (int(*)[n]) malloc(n*n* sizeof(int*));
	//memset(graph, 0, sizeof(int)*n*n);
	//printf("\n");
	for (i=0;i<n;i++){		
		for (j=0;j<n;j++){
			graph[i][j] = 0;
			//printf("%d ",graph[i][j]);
		}
		//printf("\n");
	}
	
	//GO THROUGH AND SET 1s for first genome
	int a=0;
	int* A;
	A = arr[a]; 
	for (i=0;i<n;i++){
		for (j=i+1;j<n;j++){
			if (graph[ A[i]-1 ][ A[j]-1 ] == 0){
				graph[ A[i]-1 ][ A[j]-1 ] = 1;
			}
		}
	}
	/*	
	printf("\n");
	for (i=0;i<n;i++){		
		for (j=0;j<n;j++){
			printf("%d ",graph[i][j]);
		}
		printf("\n");
	}
	*/
	
	//GO THROUGH REST OF GENOMES AND SET 0s
	for (a=1;a<m;a++){		//go through each sequence
		A = arr[a]; 
		for (i=n-1;i>=0;i--){		//each number
			for (j=i-1;j>=0;j--){
				if (graph[ A[i]-1 ][ A[j]-1 ] == 1){
					graph[ A[i]-1 ][ A[j]-1 ] = 0;
				}
			}
		}
	}
	
/*	
	printf("\n");
	for (i=0;i<n;i++){		
		for (j=0;j<n;j++){
			printf("%d ",graph[i][j]);
		}
		printf("\n");
	}
*/	
	int maxLength = 0;
	int start = 0;
	int temp = 0;
	for (i=1;i<=n;i++){
		temp = max_length(graph,i,n);
		if (maxLength < temp){
			maxLength = temp;
			start = i;
		}
	}
	*size_of_seq = maxLength;
	//printf("Length: %d\n",maxLength);
	//printf("\nStart: %d",start);
	
	int* lcs = malloc(sizeof(int)*maxLength);
	lcs[0] = start;
	for (i=1;i<maxLength;i++){
		start = get_next(graph,start,n);
		lcs[i] = start;
	}

	//printf("\n");
	//for (i=0;i < maxLength;i++){
		//printf("%d ",lcs[i]);
	//}

	return lcs;
}

int get_next(int** graph,int row,int n){
	int i = 0;
	int r = 0;
	int max = 0;
	int temp = 0;
	for (i=1;i<=n;i++){
		if (graph[row-1][i-1] == 1){
			temp = max_length(graph,i,n);
			if (temp > max){
				max = temp ;
				r = i;
			}
		}
	}
	return r;
}

