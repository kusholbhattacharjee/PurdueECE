/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */

// index.c
//
// To compile:
// 	gcc -o index indexer.c index.c
// To run:
// 	./index <word> <filename>[, <filename>[, ...]]

#include <stdlib.h>
#include <stdio.h>
#include "index.h"
#include <string.h>


char* _strdup(const char* s) {  // helper function;  okay to use anywhere in this assignment
	return strcpy(malloc(sizeof(*s) * (strlen(s) + 1)), s);
}

Index create_index(){
	Index i = {.root = NULL};
	return i;
}

void add_filename(StringListNode* filenames,char* filename){
	StringListNode* p = filenames;
	if(filename == NULL){
		return;
	}
	
	while(p!=NULL){
		if(strcmp(p->filename,filename)==0){
			return;
		}
		p = p->next;
	}
	p->next = NULL;
	p->filename = _strdup(filename);
	
	return;
}

/*
void put_better(IndexBSTNode* root, char* word, char* filename){
	if(true){
		printf("%s",word);
		IndexBSTNode* temp = malloc(sizeof(*temp));
		temp->left = NULL;
		temp->right = NULL;
		temp->word = _strdup(word);

		StringListNode* temp2 = malloc(sizeof(*temp2));
		temp2->next = NULL;
		temp2->filename = _strdup(filename);
		temp->filenames = temp2;
		root = temp;
		printf("%s",root->word);
		return;
	}
	else{
		if(strcmp(root->word,word)==0){
			add_filename(root->filenames,filename);
			return;
		}
		else if(strcmp(root->word,word)>0){
			put_better(root->left,word,filename);
		}
		else{	
			put_better(root->right,word,filename);
		}
	}
}*/

//PUT THE NODE IN THE BST
void put(Index* index, char* word, char* filename){
	//put_better(index->root, word, filename);
	
	if(index->root==NULL){
		printf("%s",word);
		IndexBSTNode* temp = malloc(sizeof(*temp));
		temp->left = NULL;
		temp->right = NULL;
		temp->word = _strdup(word);

		StringListNode* temp2 = malloc(sizeof(*temp2));
		temp2->next = NULL;
		temp2->filename = _strdup(filename);
		temp->filenames = temp2;
		index->root = temp;
		//printf("%s",root->word);
		return;
	}
	else{
		if(strcmp(index->root->word,word)==0){
			add_filename(index->root->filenames,filename);
			return;
		}
		else if(strcmp(index->root->word,word)>0){
			Index* copy = index;
			copy->root = index->root->left;
			put(copy,word,filename);
		}
		else{		
			Index* copy = index;
			copy->root = index->root->right;
			put(copy,word,filename);
		}
	}
	return;
}


IndexBSTNode* find_root(IndexBSTNode* root, char* word){
	if (root!=NULL){
		if(strcmp(root->word,word)==0){
			return root;
		}
		else if(strcmp(root->word,word)>0){
			find_root(root->left,word);
		}
		else{
			find_root(root->right,word);
		}
	}
	return NULL;
}

char** get(Index* index, int* count, char* word){

	IndexBSTNode* node = find_root(index->root,word);
	
	if (node == NULL){
		return NULL;
	}

	//find number of filenames
	StringListNode* p = node->filenames;
	*count = 0;
	while(p != NULL){
		p = p->next;
		*count++;
	}

	//malloc all the strings
	char** files = malloc(*count * sizeof(char*));
	StringListNode* q = node->filenames;
	for (int i = 0;i<(*count);i++){
		files[i] = _strdup(q->filename);
		q = q->next;
	}

	return files;
}

void _free_better(IndexBSTNode* r){
	
	if (r==NULL){
		return;
	}
	else{
		free(r->word);
	}

	_free_better(r->right);
	_free_better(r->left);
	free(r);
}

void free_index(Index* index){
	_free_better(index->root);
}




