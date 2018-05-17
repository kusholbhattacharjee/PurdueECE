#include <stdio.h>
#include "packing.h"

void findMinArea(Node* root, Node* subtree, double* minW, double* minH);
Node* createBST(Node* NodeArr,int* index);  //send in last index
void getNextBox(Node* curr);
Node* Load_From_File(char* Filename,int* size);
void setCoord(Node* curr);

int main(int argc, char ** argv){
	int size = 0;
	//Node* arr = Load_From_File("r6_po.txt",&size);
	Node* arr = Load_From_File(argv[1],&size);
	FILE* fp = fopen(argv[2],"w");
	/* Prints out the file in an array
	int i = 0;
	while (i<15){
		printf("%c %le %le\n",arr->label,arr->width,arr->height);
		i++;
		arr++;
	}*/
	int index = size-1;
	Node* root = createBST(arr,&index);
	/*
	printf("Root: %c\n",root->label);
	printf("Root->right: %c\n",root->right->label);
	printf("Root->left: %c\n",root->left->label);
	printf("Root->right->right: %c\n",root->right->right->label);
	printf("Root->left->right: %c\n",root->left->right->label);
	*/
	getNextBox(root);
	setCoord(root);
	int i = 0;
	int min_box = 0;
	int m = 0;
//	printf("%d",num_boxes);
	printf("Width: %le\n",arr[size-1].width);
	printf("Height: %le\n",arr[size-1].height);
	while (i<size){
		if (arr[i].label == -1){
		fprintf(fp,"%d %le %le %le %le\n",arr[i].num,arr[i].width,arr[i].height,arr[i].xcoord,arr[i].ycoord);
			if (min_box < arr[i].num - '0'){
				min_box = arr[i].num - '0';
				m = i;
			}	
		}
		i++;
	}
	printf("X-coordinate: %le\n",arr[m].xcoord);		
	printf("Y-coordinate: %le\n",arr[m].ycoord);	
	
	double W = arr[size-1].width;
	double H = arr[size-1].height;
	findMinArea(root,root->right,&W,&H);
	findMinArea(root,root->left,&W,&H);
	printf("Best Width: %le\n",W);
	printf("Best Height: %le",H);
	return 0;
}
