#include "river.h"
#include <stdio.h>

Node** readFile(char* filename, int *N, int *M){

	int i,j;
	FILE* infile = fopen(filename,"r");	
	fscanf(infile,"%d %d\n",N,M);	
	//printf("%d " ,*N);
	//printf("%d\n" ,*M);
	int R = *N-1;
	int C = *M;
	
	//MAKE GRAPH FROM FILE
	Node **arr = (Node **)malloc( R * sizeof(Node *) );
	for (i=0; i<R; i++){
		arr[i] = (Node *)malloc( C * sizeof(Node) );
		for (j=0; j<C; j++){
			//set val
			fscanf(infile,"%1d",&arr[i][j].val);
			if (j == 0)
				arr[i][j].distance = (arr[i][j].val==1) ? 0:1;
			else
				arr[i][j].distance = 1000;
			//printf("%d ",arr[i][j].val);
			arr[i][j].visited = 0;
			arr[i][j].x = i;
			arr[i][j].y = j;
			arr[i][j].next = NULL;
		}
	}
	for (i=0; i<R; i++){
		for (j=0; j<C; j++){
			//set right 
			if ( j == C-1 )
				arr[i][j].right = 1;
			else
				arr[i][j].right = (arr[i][j+1].val == 1) ? 1 : 2; 

			//set left
			if (j==0)
				arr[i][j].left = -1;
			else
				arr[i][j].left = (arr[i][j-1].val == 1) ? 1 : 2;

			//set down
			if (j==0)
				arr[i][j].down = 0;
			if (i == R-1)
				arr[i][j].down = -1;
			if (j!=0 && i!= (R-1))
				arr[i][j].down = (arr[i+1][j].val == 1) ? 0 : 2;
			
			//set up
			if (i == 0)
				arr[i][j].up = -1;
			else
				arr[i][j].up = (arr[i-1][j].val == 1) ? 0 : 2;

			//set Diagonals
			if (i==0){ //if top row
				arr[i][j].topleft = -1;
				arr[i][j].topright = -1;
			}
			if (j==0){ //if left column
				arr[i][j].topleft = -1;
				arr[i][j].bottomleft = -1;
			}
			if (i==(R-1)){ //if bottom row
				arr[i][j].bottomleft = -1;
				arr[i][j].bottomright = -1;
			}
			if (j==(C-1)){ //if right column
				arr[i][j].topright = -1;
				arr[i][j].bottomright = -1;
			}
			if(i!=0 && j!=0)
				arr[i][j].topleft = (arr[i-1][j-1].val==1) ? 1 : 2;
			if(i!=0 && j!=(C-1))
				arr[i][j].topright = (arr[i-1][j+1].val==1) ? 1 : 2;
			if(i!=(R-1) && j!=0)
				arr[i][j].bottomleft = (arr[i+1][j-1].val==1) ? 1 : 2;
			if(i!=(R-1) && j!=(C-1))
				arr[i][j].bottomright = (arr[i+1][j+1].val==1) ? 1 : 2;
		}
	}	
	//printf("\n");
	fclose(infile);	
	return arr;
}

Node* delHeap(Node** arr, int x, int y, Node* root){
	Node* temp = root;
	if (root==NULL)
		return root;
	else if (root->x == x && root->y == y)
		root = root->next;	
	else{
		while(temp->next != NULL && temp->next->x != x && temp->next->y != y){
			temp = temp->next;
		}
		if (temp->next != NULL){
			temp->next = temp->next->next;
		}
	}
	return root;
}

Node* addHeap(Node** arr, int x, int y, Node* root){
	if (arr[x][y].visited == 1)
		return root; 
	Node* insert = &(arr[x][y]);
	insert->next = NULL;
	int d = arr[x][y].distance;

	if (root == NULL){ //if linked list is empty 
		root = insert;
		return root;
	}
	else if (root->next == NULL){ //if last element
		if (d < root->distance){ //insert before
			insert->next = root;
			root = insert;
		}
		else{ //insert last
			root->next = insert;
		}
	}
	else if (d >= root->distance && d <= root->next->distance){
		insert->next = root->next;
		root->next = insert;
	}
	else{
		addHeap(arr,x,y,root->next);
	}
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
	if (arr[x][y].right != -1){
		if ( (arr[x][y].distance + arr[x][y].right) < arr[x][y+1].distance ){
			arr[x][y+1].distance = arr[x][y].distance + arr[x][y].right;
			root = delHeap(arr,x,y+1,root);
			root = addHeap(arr,x,y+1,root);
		}
	}
	//check left
	if (arr[x][y].left != -1){
		if (y!=0){
			if ((arr[x][y].distance + arr[x][y].left) < arr[x][y-1].distance){
				arr[x][y-1].distance = arr[x][y].distance + arr[x][y].left;
				root = delHeap(arr,x,y-1,root);
				root = addHeap(arr,x,y-1,root);
			}
		}
	}

	//check down
	if (arr[x][y].down != -1){
		if (x!=(R-1)){
			if ( (arr[x][y].distance + arr[x][y].down) < arr[x+1][y].distance ){
				arr[x][y+1].distance = arr[x][y].distance + arr[x][y].down;
				root = delHeap(arr,x+1,y,root);
				root = addHeap(arr,x+1,y,root);
			}
		}
	}
	
	//check up
	if (arr[x][y].up != -1){
		if (x!=0){
			if ( (arr[x][y].distance + arr[x][y].up) < arr[x-1][y].distance ){
				arr[x-1][y].distance = arr[x][y].distance + arr[x][y].up;
				root = delHeap(arr,x-1,y,root);
				root = addHeap(arr,x-1,y,root);
			}
		}
	}
	
	//check topright
	if (arr[x][y].topright != -1){
		if (x!=0 && y!=(C-1)){
			if ( (arr[x][y].distance + arr[x][y].topright) < arr[x-1][y+1].distance ){
				arr[x-1][y+1].distance = arr[x][y].distance + arr[x][y].topright;
				root = delHeap(arr,x-1,y+1,root);
				root = addHeap(arr,x-1,y+1,root);
			}
		}
	}
	
	//check topleft
	if (arr[x][y].topleft != -1){
		if (x!=0 && y!=0){
			if ( (arr[x][y].distance + arr[x][y].topleft) < arr[x-1][y-1].distance ){
				arr[x-1][y-1].distance = arr[x][y].distance + arr[x][y].topleft;
				root = delHeap(arr,x-1,y-1,root);
				root = addHeap(arr,x-1,y-1,root);
			}
		}
	}
	
	//checkbottomright
	if (arr[x][y].bottomright != -1){
		if (x!=(R-1) && y!=(C-1)){
			if ((arr[x][y].distance + arr[x][y].bottomright) < arr[x+1][y+1].distance ){
				arr[x+1][y+1].distance = arr[x][y].distance + arr[x][y].bottomright;
				root = delHeap(arr,x+1,y+1,root);
				root = addHeap(arr,x+1,y+1,root);
			}
		}
	}

	//checkbottomleft
	if (arr[x][y].bottomleft != -1){
		if (x!=(R-1) && y!=0){
			if ( (arr[x][y].distance + arr[x][y].bottomleft) < arr[x+1][y-1].distance ){
				arr[x+1][y-1].distance = arr[x][y].distance + arr[x][y].bottomleft;
				root = delHeap(arr,x+1,y-1,root);
				root = addHeap(arr,x+1,y-1,root);
			}
		}
	}

	if (root == NULL){
		return -1;
	}
	int a = root->x;
	int b = root->y;
	//get the next smallest distance node and do dikstra recursively
	return dikstra(arr, R, C, a, b, root->next); 
}
/*
int minLength(Node** arr,int c,int x,int y){
	if (y==c)
		return 1;
	int min = 0;
	int i;
	//up
	if (arr[x][y].up != -1)
		min = arr[x][y].up + minLength(arr,c,x-1,y);
	
	if (y!=0){
	//down
	if (arr[x][y].down != -1){
		i = arr[x][y].down + minLength(arr,c,x+1,y);
		min = (i < min) ? i : min;
	}}

	//left
	if (arr[x][y].left != -1){
		i = arr[x][y].left + minLength(arr,c,x,y-1);
		min = (i < min) ? i : min;
	}
	//right
	if (arr[x][y].right != -1){
		i = arr[x][y].right + minLength(arr,c,x,y+1);
		min = (i < min) ? i : min;
	}
	//topleft
	if (arr[x][y].topleft != -1){
		i = arr[x][y].topleft + minLength(arr,c,x-1,y-1);
		min = (i < min) ? i : min;
	}
	//topright
	if (arr[x][y].topright != -1){
		i = arr[x][y].topright + minLength(arr,c,x-1,y+1);
		min = (i < min) ? i : min;
	}

	//bottomleft
	if (arr[x][y].bottomleft != -1){
		i = arr[x][y].bottomleft + minLength(arr,c,x+1,y-1);
		min = (i < min) ? i : min;
	}

	//bottomright
	if (arr[x][y].bottomright != -1){
		i = arr[x][y].bottomright + minLength(arr,c,x+1,y+1);
		min = (i < min) ? i : min;
	}
	return min;
}
*/
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

	/*for (i=0;i<((N-1));i++){
		free(arr[i]);
	}
	free(arr);*/
	return 0;
}
