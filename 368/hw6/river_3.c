#include "river.h"
#include <stdio.h>

Node** readFile(char* filename, int *N, int *M){

	int i,j;
	FILE* infile = fopen(filename,"r");	
	fscanf(infile,"%d %d\n",N,M);	
	printf("%d " ,*N);
	printf("%d\n" ,*M);
	
	//MAKE GRAPH FROM FILE
	Node **arr = (Node **)malloc(*N * sizeof(Node *));
	for (i=0;i<((*N)-1);i++){
		arr[i] = (Node *)malloc(*M * sizeof(Node));
		for (j=0;j<(*M);j++){

			//set val
			fscanf(infile,"%1d",&arr[i][j].val);

			//set right
			if (j==*M-1 && i>0)
				arr[i][j].right = (arr[i-1][j].val == 1 || arr[i][j].val == 1) ? 1 : 2; 
			else if (i==0 && j==*M-1)
				arr[i][j].right = (arr[i][j].val == 1) ? 1 : 2;
			else if (i>0)
				arr[i][j].right = (arr[i-1][j].val == 1 || arr[i][j].val == 1) ? 1 : 2; 
			else
				arr[i][j].right = 2;

			//set left
			if (j==0)
				arr[i][j].left = -1;
			else 
				arr[i][j].left = arr[i][j].right;

			//set down
			arr[i][j].down = (arr[i][j].val == 1) ? 0 : 1;

			//set up
			arr[i][j].up = (i>0) ? arr[i-1][j].down : -1;
			//printf("%d ",arr[i][j].val);
			arr[i][j].distance = 1000;
			arr[i][j].visited = 0;
			arr[i][j].x = i;
			arr[i][j].y = j;
			arr[i][j].next = NULL;
		}
		//printf("\n");
	}
	
	int r = *N-1;
	//BOTTOM ROW
	arr[r] = (Node *)malloc(*M * sizeof(Node));
	for (j=0;j<(*M);j++){
		//set val
		arr[r][j].val = 0;

		//set right
		if (j==(*M-1) && r>0){
			arr[r][j].right = (arr[r-1][j].val == 1 || arr[r][j].val == 1) ? 1 : 2; 
		}
		else if (r==0 && j==*M-1){
			arr[r][j].right = (arr[r][j].val == 1) ? 1 : 2;
		}
		else if (r>0){
			arr[r][j].right = (arr[r-1][j].val == 1 || arr[r][j].val == 1) ? 1 : 2; 
		}
		else{
			arr[r][j].right = 2;
		}
		//set left
		arr[r][j].left = (j>0) ? arr[r][j].right : -1;

		//set down
		arr[r][j].down = -1;

		//set up
		arr[r][j].up = arr[r-1][j].down;

		arr[r][j].distance = 1000;
		arr[r][j].visited = 0;
		arr[r][j].x = r;
		arr[r][j].y = j;
		arr[r][j].next = NULL;
	}
	
	fclose(infile);	
	return arr;
}

void addHeap(Node** arr, int x, int y, Node* root){
	int d = arr[x][y].distance;
	if (arr[x][y].visited == 1){
		return;
	}

	if (root == NULL){
		root = &(arr[x][y]);
		root->next = NULL;
		return;
	}
	
	if (d < root->distance){
		Node* temp = root;
		root = &(arr[x][y]);
		root->next = temp;
	}
	else if (d > root->distance && d < root->next->distance){
		arr[x][y].next = root->next;
		root->next = &(arr[x][y]);
	}
	else{
		addHeap(arr,x,y,root->next);
	}
	return;
}

Node* delHeap(Node* root){
	//Node* temp = root;
	root = root->next;
	//free(temp);
	return root;
}

int dikstra(Node** arr, int R, int C, int x, int y, Node* root){
	//check that goal node is not being used
	//make the home node BLACK
	//everything else is infinity
	//using distance from A to A and add that to the edge weights of all around nodes
	//update each surrounding node with the distance if less than current value
	//then go to the lowest distance value Node and repeat Diskra
	arr[x][y].visited = 1;

	if (y == (C-1)){ 
		return arr[x][y].distance + arr[x][y].right;
	}
	
	//check right
	if ( (arr[x][y].distance + arr[x][y].right) < arr[x][y+1].distance ){
		arr[x][y+1].distance = arr[x][y].distance + arr[x][y].right;
		addHeap(arr,x,y+1,root);
	}

	//check left
	if (y!=0){
		if ((arr[x][y].distance + arr[x][y].left) < arr[x][y-1].distance){
			arr[x][y-1].distance = arr[x][y].distance + arr[x][y].left;
			addHeap(arr,x,y-1,root);
		}
	}

	//check down
	if (x!=(R-1)){
		if ( (arr[x][y].distance + arr[x][y].down) < arr[x+1][y].distance ){
			arr[x][x+1].distance = arr[x][y].distance + arr[x][y].down;
			addHeap(arr,x+1,y,root);
		}
	}
	
	//check up
	if (x!=0){
		if ( (arr[x][y].distance + arr[x][y].up) < arr[x-1][y].distance ){
			arr[x-1][y].distance = arr[x][y].distance + arr[x][y].up;
			addHeap(arr,x-1,y,root);
		}
	}
	
	int a = root->x;
	int b = root->y;
	root = delHeap(root);
	//get the next smallest distance node and do dikstra recursively
	if (root == NULL){
		return 1;
	}
	return dikstra(arr, R, C, a, b, root); 

}

int main(int argc, char * argv[]){
	int i,j;
	int N,M;
	Node ** arr = readFile(argv[1],&N,&M);
	
	for (i=0;i<((N));i++){
		for (j=0;j<(M);j++){
			printf("%d (%d) ",arr[i][j].val,arr[i][j].right);
			//printf("%d ",arr[i][j].val);
		}
		printf("\n");
	}

	//Node* root = NULL;
	
	/*minHeap hp;
	hp.size = 0;
	hp.elem = NULL;*/
	int path = 0;
	
	int min_path = 1000;
	for (i=0; i<N; i++){
		//path = dikstra(arr, N, M, i, 0, root);
		path = 1;
		printf("%d\n",path);
		min_path = (path < min_path) ? path : min_path;
	}
	printf("%d\n",min_path);
	
	return 0;
}
