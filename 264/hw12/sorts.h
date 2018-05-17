#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

typedef struct _ListNode{
	int value;
	struct _ListNode* next;
}ListNode;

typedef struct _List{
	ListNode* head;
	ListNode* tail;
	int size;
}List; 




typedef struct _BSTNode{
	int value;
	struct _BSTNode* left;
	struct _BSTNode* right;
}BSTNode;




typedef struct{
	BSTNode* root;
	int size;
}BST;



 List create_list(const int* array,int size);
 BST create_bst(const int* array, int size);
void _addNode( BSTNode** node,int value_);
void tree_sort_array(int* array,size_t size);
void _order( BSTNode* root,int* array,int* i);
void _empty_tree( BSTNode* root);
void empty_bst( BST* bst);
void quick_sort_array(int* array, size_t size);
int cmpfunc(const void* a, const void* b);
void empty_list(List* list);
void merge_sort_array(int* array, size_t size);
void merge_sort_list(List* list);
