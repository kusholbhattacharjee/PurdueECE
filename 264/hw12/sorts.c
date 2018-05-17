#include "sorts.h"
#include <stdlib.h>
#include <stdio.h>


int cmpfunc(const void* a, const void* b){
	return (*(int*)a - *(int*)b);
}

void quick_sort_array(int* array,size_t size){
	qsort(array,(int)size,sizeof(int),cmpfunc);
	return;
}

void _empty_tree( BSTNode* root){
	if(root==NULL){
		return;
	}
	_empty_tree(root->left);
	_empty_tree(root->right);
	free(root);
	return;
}

void empty_bst( BST* bst){
	_empty_tree(bst->root);
	return;
}

void empty_list( List* list){
	 ListNode* p = list->head;
	 ListNode* q;
	while(p!=NULL){
		q = p;
		p = p->next;
		free(q);
	}
	list->head = NULL;
	list->tail = NULL;
}

void _order( BSTNode* root,int* array,int* i){
	if (root!=NULL){
		_order(root->left,array,i);
		array[*i] = root->value;
		(*i)++;
		_order(root->right,array,i);
	}
	return;
}
void tree_sort_array(int* array,size_t size){
	
	 BST orderup = create_bst(array,size);
	int point = 0;
	int* i = &point;
	_order(orderup.root,array,i);
	empty_bst(&orderup);
	return;
}

 List create_list(const int* array,int size){
	
	List list;
	list.head = NULL;
	list.tail = NULL;
	list.size = size;

	if(size==0){
		return list;
	}
	
	for(int i = 0; i<size; i++){
		ListNode* insert = malloc(sizeof(*insert));
		insert->value = array[i];
		insert->next = NULL;
		if(list.head==NULL){
			list.head = insert;
			list.tail = list.head;
		}
		else{
			list.tail->next = insert;
			list.tail = insert;
		}
	}

	return list;
}

void _addNode( BSTNode** node, int value){
	if(*node == NULL){
		*node = malloc(sizeof( BSTNode));
		(*node)->left = NULL;
		(*node)->right = NULL;
		(*node)->value = value;
	}
	else if(value > (*node)->value){
		_addNode((&(*node)->right),value);
	}
	
	else{
		_addNode((&(*node)->left),value);
	}
	return;
}

 BST create_bst(const int* array, int size){
	 BST bst;
	bst.root = NULL;
	bst.size = size;

	if(size==0){
		return bst;
	}
	
	for(int i = 0; i<size; i++){
		_addNode(&(bst.root), array[i]);
	}
	
	return bst;
}

	
void _divideup(  ListNode* head,  ListNode** front,  ListNode** back) {
	 ListNode* p;
	 ListNode* q;

	if( head == NULL || head->next == NULL) {
		*front = head;
		*back = NULL;
	}
	else {

		p = head;
		q = head->next;

		while( q != NULL ) {
			q = q->next;
			if (q != NULL) { 
				p = p->next;
				q = q->next;
			}
		}

		*front = head;
		*back = p->next;
		p->next = NULL;
	}
}

 ListNode* _sortPiece( ListNode* x,  ListNode* y) {
	 ListNode* done = NULL;

	if( x == NULL) {
		return(y);
	}
	else if(y == NULL) {
		return(x);
	}

	if ((x->value) <= (y->value)) {
		done = x;
		done->next = _sortPiece(x->next, y);
	}
	else {
		done = y;
		done->next = _sortPiece(x, y->next);
	}
	return done;
}


void merge_sort_array(int* array, size_t size) {
	List new = create_list(array, size);
	merge_sort_list(&new);
	ListNode* p= new.head;
	int i = 0;
	while (p!=NULL) {
		array[i] = p->value;
		i++;
		p = p->next;
	}
	empty_list(&new);
}


void _merge( ListNode** p) {
	 ListNode* front;
	 ListNode* back;
	 ListNode* head = *p;

	if (head == NULL || head->next == NULL) {
		return;
	}

	_divideup(head, &front, &back);

	_merge(&front);
	_merge(&back);

	*p = _sortPiece(front, back);

}

void merge_sort_list( List* list){
	_merge(&(list)->head);
}


