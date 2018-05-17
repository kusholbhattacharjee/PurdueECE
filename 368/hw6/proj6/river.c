#include <stdio.h>
#include <string.h>
#include "river.h"
#include <limits.h>

int minFinder(int* N, int R, int C){
	int i;
	int min_index = 0;
	int min_value = INT_MAX;
	for (i=0; i<(R*C); i++){
		if (turns[i] <= min_value && N[i]==0){
			min_index = i;
			min_value = turns[i];
		}
	}
	return min_index;
}
/*Node* delHeap(Node** arr, int x, int y, Node* root){
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
}*/

int BIG_D(int R, int C){
	int d = -1;
	int i,pivot;
	int right,left,up,down;
	int topright,topleft,bottomright,bottomleft;
	int moves = 0;

	for (i=0; i<R; i++){
		turns[C*i] = (nodes[C*i]==0)?1:0;
	}
	
	int* river = malloc(R*C*sizeof(int));
	memset(river,0,R*C*sizeof(int));

	for (i=0;i<R*C;i++){
		pivot = minFinder(river,R,C);
		river[pivot]=1;

		right = pivot+1;
		left = pivot-1;
		up = pivot-C;
		down = pivot+C;
		topright = pivot-C+1;
		topleft = pivot-C-1;
		bottomright = pivot+C+1;
		bottomleft = pivot+C-1;

		if (pivot % C != 0){
			moves = (nodes[left]==0)? 2:1;
			turns[left] = (turns[pivot]+moves < turns[left])? turns[pivot]+moves:turns[left];
			if (topleft > 0){
				moves = (nodes[topleft]==0)? 2:1;
				turns[topleft] = (turns[pivot]+moves < turns[topleft]) ? turns[pivot]+moves:turns[topleft];
			}
			if (bottomleft<(R*C-1)){
				moves = (nodes[bottomleft]==0)? 2:1;
				turns[bottomleft] = (turns[pivot]+moves<turns[bottomleft])?turns[pivot]+moves:turns[bottomleft];
			}
		}	
		if (pivot%C == C-1){
			if (d==-1 || d>turns[pivot])
				d = turns[pivot];
		}
		else{
			moves = (nodes[right]==0)? 2:1;
			if (turns[pivot]+moves < turns[right])
				turns[right] = turns[pivot] + moves;
			if(topright > 0){
				moves = (nodes[topright]==0)?2:1;
				if (turns[topright]+moves <  turns[topright])
					turns[topright] = turns[pivot]+moves;
			}
			if (bottomright<(R*C-1)){
				moves = (nodes[bottomright]==0)?2:1;
				if (turns[bottomright] + moves < turns[bottomright])
					turns[bottomright] = turns[pivot]+moves;
			}
		}
		if (up > 0){
			moves = (nodes[up]==1)?0:2;
			if (turns[pivot] + moves < turns[up])
				turns[up] = turns[pivot]+moves;
		}
		if (down < R*C-1){
			moves = (nodes[down]==1)?0:2;
			if (turns[pivot] + moves < turns[down])
				turns[down] = turns[pivot]+moves;
		}
	}
	free(river);
	return d+1;
}
/*
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

	if (root == NULL){
		return -1;
	}
	int a = root->x;
	int b = root->y;
	//get the next smallest distance node and do dikstra recursively
	return dikstra(arr, R, C, a, b, root->next); 
}

*/

void readFile(char* file, int* R, int* C){
	FILE* infile = fopen(file,"r");
	
	fscanf(infile,"%d %d\n",R,C);
	
	int rows = *R;
	int columns = *C;

	turns = malloc((*R)*(*C)*sizeof(int));
	nodes = malloc((*R)*(*C)*sizeof(int));
	int i,j,val;
	for (i=0; i<rows; i++){
		for (j=0; j<columns; j++){
			turns[(columns*i) + j] = INT_MAX;
			fscanf(infile,"%1d",&val);
			nodes[(columns*i)+j] = val;
		}
		//fscanf(infile,'\n');
	}
	/*
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
	}*/	
	fclose(infile);
	return;
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

