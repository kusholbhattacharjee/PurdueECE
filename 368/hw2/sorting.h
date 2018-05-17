#include <stdio.h> //needed for printf
#include <stdlib.h> //needed for EXIT_SUCCESS


typedef struct Node {
	long value;
	struct Node *next;
} Node;

typedef struct Gap {
	int value;
	struct Gap *next;
} Gap;

Node *Load_From_File(char *Filename);
int Save_To_File(char *Filename, Node *list);
Node *Shell_Sort(Node *list);



