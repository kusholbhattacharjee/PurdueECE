#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef struct node{
	int topright;
	int topleft;
	int bottomright;
	int bottomleft;
	int left;
	int right;
	int up;
	int down;
	int val;
	int visited;
	int distance;
	int x;
	int y;
	struct node* next;
} Node;

/*
typedef struct minHeap{
	int size;
	Node *elem;
} minHeap;
*/
