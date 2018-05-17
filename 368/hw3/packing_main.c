#include <stdio.h>
#include "packing.h"

Node* createBST(Node* NodeArr,int* index);  //send in last index
void getNextBox(Node* root,double* x, double* y,char Power,double* temp);
Node* Load_From_File(char* Filename,int* size);
void oneCase(Node* node,Node* r);

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
	double temp = 0.0;
	double x = 0.0;
	double y = 0.0;
	char c = ' ';
	getNextBox(root,&x,&y,c,&temp);
	int i = 0;
	int min_box = 0;
	int m = 0;
//	printf("%d",num_boxes);
	printf("Width: %le\n",arr[size-1].width);
	printf("Height: %le\n",arr[size-1].height);
	while (i<size){
		if (arr[i].label != 'H' && arr[i].label != 'V'){
			fprintf(fp,"%c %le %le %le %le\n",arr[i].label,arr[i].width,arr[i].height,arr[i].xcoord,arr[i].ycoord);
			if (min_box < arr[i].label - '0'){
				min_box = arr[i].label - '0';
				m = i;
			}
		}
		i++;
	}
	printf("X-coordinate: %le\n",arr[m].xcoord);		
	printf("Y-coordinate: %le",arr[m].ycoord);		
	return 0;
}
