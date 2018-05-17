#include <stdio.h> //needed for printf
#include <stdlib.h> //needed for EXIT_SUCCESS
#include "packing.h"

Node* createBST(Node* NodeArr,int* index){  //send in last index
	if (NodeArr==NULL){
		return NULL;
	}
	Node* newNode = &(NodeArr[*index]);
	if(newNode->label == 'H' || newNode->label == 'V'){
		*index = *index-1;
		newNode->right = createBST(NodeArr,index);
		newNode->left = createBST(NodeArr,index);
	}
	else{
		*index = *index-1;
		newNode->right = NULL;
		newNode->left = NULL;
	}		
	return newNode;
}


Node* Load_From_File(char* Filename,int* size){
	FILE* test = fopen(Filename,"r");
	int lines = 0;
	int ch;
	int c;
	double w;
	double h;
	char la;
	//Find number of lines 
	do{
		ch = fgetc(test);
	  	if(ch == '\n')
			lines++;
	}while (ch!=EOF);
	fclose(test);

	FILE* fp  = fopen(Filename,"r");
	
	Node* arr = malloc(sizeof(Node)*lines);
	int i = 0;
	while (i<lines){
		Node* newNode = malloc(sizeof(Node));
		newNode->xcoord = 0.0;
		newNode->ycoord = 0.0;
		if(fscanf(fp,"%d(%le,%le)\n",&c,&w,&h)==3){
			//printf("\nBox: %c (%le,%le)",c,w,h);
			newNode->num = c;
			newNode->label = -1;
			newNode->width = w;
			newNode->height = h;
		}
		else{
			//newNode->label = c;
			newNode->num = -1;
			//printf("\nLetter: %c",c);
			fscanf(fp,"%c\n",&la);
			newNode->label = la;
			newNode->height = 0.0;
			newNode->width = 0.0;
		}
		arr[i] = *newNode;
		free(newNode);
		i++;
	}
	fclose(fp);
	*size = lines;
	return arr;
}

void createBox(Node* root,double* x,double* y,char r,int i,double* temp){ //pass in block needed to be made
	//printf("\n%c %le %le %c %d %f",root->label,*x,*y,r,i,*temp);
	Node* node = root;
	if (node->label == -1){ //end num on one side 
		if (i==0){
			if (r=='H'){
				if (*temp == 0.0){
					root->xcoord = 0.0;
					root->ycoord = *y;
				}
				else{
					root->ycoord = *temp;
					root->xcoord = *x;
					*temp = 0.0;
				}
				*y = *y + root->height; 
			}
			else if (r=='V'){
				//root->xcoord = *x + root->width;
				if (*temp == 0.0){
					root->ycoord = 0.0;
					root->xcoord = *x;
				}
				else{
					root->ycoord = *y;
					root->xcoord = *temp;
					*temp = 0.0;
				}
				*x = *x + root->width;
			}
			else {
				root->xcoord = 0.0;
				root->ycoord = 0.0;
				*x = root->width;
				*y = root->height;
			}
		}
		if (i==1){
			if (r=='H'){
				root->xcoord = 0.0;
				root->ycoord = *y;
				*temp = root->xcoord + root->width; 
			}
			else if (r=='V'){
				root->xcoord = *x;
				//root->xcoord = *x + root->width;
				root->ycoord = 0.0;
				*temp = root->ycoord + root->height;
			}
			else {
				root->xcoord = 0.0;
				root->ycoord = 0.0;
				*x = root->width;
				*y = root->height;
			}
		}
			
	}
	else { //both created boxes
		if (node->label=='H'){
			//both left and right are coordinated wau

			node->xcoord = node->right->xcoord;
			node->ycoord = node->right->ycoord;

			if (node->right->width > node->left->width)
				node->width = node->right->width;
			else
				node->width = node->left->width;
			node->height = node->left->height + node->right->height;

			*x = node->width;
			*y = node->height;
		}
		else{ 
			//both left and right are coordinated wau
			node->ycoord = node->left->ycoord;
			node->xcoord = node->left->xcoord;
			if (node->right->height > node->left->height)
				node->height = node->right->height;
			else
				node->height = node->left->height;
			node->width = node->left->width + node->right->width;

			*x = node->width;
			*y = node->height;
		}
	}
	//printf("\n%c %le %le %c",root->label,*x,*y,r);
}

void oneCase(Node* node,Node* r){
	if (r->label=='H'){
		node->xcoord = r->right->xcoord;
		node->ycoord = r->right->ycoord + r->right->height;
	}
	else{
		node->ycoord = r->left->ycoord;
		node->xcoord = r->left->xcoord + r->left->width;
	}
}

void getNextBox(Node* root,double* x, double* y,char Power,double* temp){
	Node* curr = root;
	int diff = 0;
	if (curr->label != Power){
		diff = 1;
	}
	if (curr->label == 'H'){
		if (curr->right->label == -1){ //if the right!=H/V
			createBox(curr->right,x,y,Power,diff,temp);
		}
		else{ 
			getNextBox(curr->right,x,y,Power,temp);
		}
		
		if (curr->left->label == -1){ //if the left!=H/V
			if (curr->right->label=='H' || curr->right->label=='V')
				oneCase(curr->left,curr);
			else
				createBox(curr->left,x,y,root->label,0,temp);
		}	
		else{ 
			getNextBox(curr->left,x,y,root->label,temp);
		}
		createBox(curr,x,y,root->label,0,temp);
	}
	else if (curr->label == 'V'){
		if (curr->left->label == -1){ //if the left !=H/V
			createBox(curr->left,x,y,Power,diff,temp);
		}
		else{
			getNextBox(curr->left,x,y,Power,temp);
		}
		if (curr->right->label == -1){ //if the right!=H/V
			if (curr->left->label=='H' || curr->left->label=='V')
				oneCase(curr->right,curr);
			else
				createBox(curr->right,x,y,root->label,0,temp);
		}
		else{ 
			getNextBox(curr->right,x,y,root->label,temp);
		}
		createBox(curr,x,y,root->label,0,temp);
	}
	return;
}

//void printPostOrder(Node* root){
	

//}
