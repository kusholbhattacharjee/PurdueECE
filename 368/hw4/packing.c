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

void setCoord(Node* curr){	
	if (curr->label == -1) //if a box then ignore
		return;
	
	if (curr->label == 'H'){
		
		curr->left->xcoord = curr->xcoord;
		curr->left->ycoord = curr->ycoord + curr->right->height;

		curr->right->xcoord = curr->xcoord;
		curr->right->ycoord = curr->ycoord;

		setCoord(curr->left);
		setCoord(curr->right);
	}
	
	else{	

		curr->left->xcoord = curr->xcoord;
		curr->left->ycoord = curr->ycoord;

		curr->right->xcoord = curr->xcoord + curr->left->width;
		curr->right->ycoord = curr->ycoord;

		setCoord(curr->left);
		setCoord(curr->right);
	}
	return;
}

void getNextBox(Node* curr){
	if (curr->label == -1) //if a box then ignore
		return;
	
	if (curr->label == 'H'){
		getNextBox(curr->right);
		getNextBox(curr->left);

		curr->height = curr->right->height + curr->left->height;
		if (curr->right->width > curr->left->width)
			curr->width = curr->right->width;
		else
			curr->width = curr->left->width;
	}
	
	else{	
		getNextBox(curr->left);
		getNextBox(curr->right);

		curr->width = curr->right->width + curr->left->width;
		if (curr->right->height > curr->left->height)
			curr->height = curr->right->height;
		else
			curr->height = curr->left->height;
	}
	return;
}

/*
void rerootRR(Node* root,Node* r){
	root->right = r->left;
	r->right = root;
}

void rerootRL(Node* root,Node* r){
	root->right = r->right;
	r->right = root;
}

void rerootLL(Node* root,Node* l){
	root->left = l->right;
	l->left = root;
}

void rerootLR(Node* root,Node* l){
	root->left = l->left;
	l->left = root;
}
*/

void findMinArea(Node* root, Node* subtree, double* minW, double* minH){
	
	double area = 0.0;
	double minArea = (*minW) * (*minH);

	if (subtree->left == NULL || subtree->right==NULL){
		return;
	}

	else if (subtree == root->right){

		//RIGHT LEFT
		root->right = subtree->right;
		subtree->right = root;
		getNextBox(subtree);
		area = subtree->height * subtree->width;

		if ( area < minArea ){
			//printf("%le %le\n",subtree->height,subtree->width);
			*minW = subtree->width;
			*minH = subtree->height;
			minArea = (*minW) * (*minH);
		}
		else if ( area == minArea  && subtree->width < (*minW) ){
			//printf("%le %le\n",subtree->height,subtree->width);
			*minW = subtree->width;
			*minH = subtree->height;
		}

		findMinArea(subtree,subtree->left,minW,minH);

		subtree->right = root->right;
		root->right = subtree;

		//RIGHT RIGHT
		root->right = subtree->left;
		subtree->left = root;
		getNextBox(subtree);
		area = subtree->height * subtree->width;

		if ( area < minArea ){
			//printf("%le %le\n",subtree->height,subtree->width);
			*minW = subtree->width;
			*minH = subtree->height;
			minArea = (*minW) * (*minH);
		}
		else if ( area == minArea  && subtree->width < (*minW) ){
			//printf("%le %le\n",subtree->height,subtree->width);
			*minW = subtree->width;
			*minH = subtree->height;
		}

		findMinArea(subtree,subtree->right,minW,minH);

		subtree->left = root->right;
		root->right = subtree;

	}
	else if( subtree == root->left ){
		//LEFT RIGHT
		root->left = subtree->left;
		subtree->left = root;
		getNextBox(subtree);
		area = subtree->height * subtree->width;

		if ( area < minArea ){
			//printf("%le %le\n",subtree->height,subtree->width);
			*minW = subtree->width;
			*minH = subtree->height;
			minArea = (*minW) * (*minH);
		}
		else if ( area == minArea  && subtree->width < (*minW) ){
			//printf("%le %le\n",subtree->height,subtree->width);
			*minW = subtree->width;
			*minH = subtree->height;
		}

		findMinArea(subtree,subtree->right,minW,minH);

		subtree->left = root->left;
		root->left = subtree;
		
		//LEFT LEFT
		root->left = subtree->right;
		subtree->right = root;
		getNextBox(subtree);
		area = subtree->height * subtree->width;

		if ( area < minArea ){
			//printf("%le %le\n",subtree->height,subtree->width);
			*minW = subtree->width;
			*minH = subtree->height;
			minArea = area;
		}
		else if ( area == minArea  && subtree->width < (*minW) ){
			//printf("%le %le\n",subtree->height,subtree->width);
			*minW = subtree->width;
			*minH = subtree->height;
		}

		findMinArea(subtree,subtree->left,minW,minH);

		subtree->right = root->left;
		root->left = subtree;
	}
	return;
}





