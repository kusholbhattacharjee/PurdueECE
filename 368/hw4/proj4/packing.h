#include <stdio.h> //needed for printf
#include <stdlib.h> //needed for EXIT_SUCCESS

typedef struct Node {
	int label;
	int num;
	double width;
	double height;
	double xcoord;
	double ycoord;
	struct Node *left;
	struct Node *right;
} Node;
