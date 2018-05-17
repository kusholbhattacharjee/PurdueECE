/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

struct Node {
	int value;
	struct Node *next;
	struct Node *prev;
	/* TODO: add attributes 'next', 'prev', and 'value' (int):  (=3 lines of code) */
};

void append(int value, struct Node** a_head, struct Node** a_tail) {
	/* TODO (>=11 lines of code) */
	
	struct Node* insert = malloc(sizeof( *insert));
	insert->value = value;
	insert->next = NULL;
	insert->prev = NULL;

	if (*a_head == NULL){
		*a_head = insert;
		*a_tail = insert;
		return;
	}
	
	struct Node* position = *a_head;
	while (position->next != NULL){
		position = position->next;
	}
	position->next = insert;
	*a_tail = insert;
	assert(*a_head != NULL);            // This helps you catch bugs in your code.
	assert(*a_tail != NULL);            // "    "     "   "     "    "  "    "
	assert((*a_head) -> prev == NULL);  // "    "     "   "     "    "  "    "
	assert((*a_tail) -> next == NULL);  // "    "     "   "     "    "  "    "
	return;
}

void delete(struct Node* victim, struct Node** a_head, struct Node** a_tail) {
	/* TODO (>=13 lines of code) */
	struct Node * p = *a_head;
	if (p==NULL){
		return;
	}

	if (p == victim){
		(*a_head) = p->next;
		free(p);
		return;
	}
	
	struct Node *q = p->next;

	while(q!=NULL && q!=victim){
		p = p->next;
		q = q->next;
	}
	if(q!=NULL){
		p->next = q->next;
		free(q);
	}
	//*a_tail = (*a_tail)->prev;
	return;
	
}

void empty_list(struct Node** a_head, struct Node** a_tail) {
	/*while(*a_head!=NULL){
		struct Node *p = (*a_head); 
		delete(p ,a_head,a_tail);
	}
	a_tail = NULL;*/
	/* TODO (>=3 lines of code) */
	while (*a_head != NULL){
		struct Node *p  = (*a_head);
		*a_head = (*a_head)->next;
		free(p);
	}
	*a_tail = NULL;

	assert(*a_head == NULL);  // This helps you catch bugs in your code.
	assert(*a_tail == NULL);  // "    "     "   "     "    "  "    "
}

void print_list(struct Node* head) {  /* do not modify print_list(..) */
	if(head == NULL) {
		printf("EMPTY\n");
	}
	else {
		for(struct Node* curr = head; curr != NULL; curr = curr -> next) {
			printf("%d", curr -> value);
		}
		printf("\n");
	}
}

int main(int argc, char *argv[]) {    /* do not modify main(..) */
	struct Node* head = NULL;
	struct Node* tail = NULL;
	append(7, &head, &tail);
	assert(head == tail);
	print_list(head);  // Output:  "7"
	append(6, &head, &tail);
	append(8, &head, &tail);
	print_list(head);  // Output:  "768"
	append(3, &head, &tail);
	append(3, &head, &tail);
	append(6, &head, &tail);
	print_list(head);  // Output:  "768336"
	delete(tail, &head, &tail);
	print_list(head);  // Output:  "76833"
	delete(head, &head, &tail);
	print_list(head);  // Output:  "6833"
	delete(head -> next, &head, &tail);
	print_list(head);  // Output:  "633"
	append(9, &head, &tail);
	print_list(head);  // Output:  "6339" */
	empty_list(&head, &tail);
	print_list(head);  // Output:  "EMPTY"
	
	return EXIT_SUCCESS;
}
