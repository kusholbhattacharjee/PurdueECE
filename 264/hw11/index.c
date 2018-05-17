/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */

// index.c

#include <stdlib.h>
#include <stdio.h>
#include "index.h"
#include <string.h>

IndexBSTNode* create_node(char* word);
StringListNode* add_filename(char* filename);
char* _strdup(const char* s);
bool word_repeat(IndexBSTNode* root, char* word);
void put_better(IndexBSTNode** root,char* word,char* filename,bool inBST);
bool file_repeat(StringListNode* filenames,char* filename);
//int free_node(IndexBSTNode* root);
//void free_files(StringListNode* head);

char* _strdup(const char* s) {  // helper function;  okay to use anywhere in this assignment
	return strcpy(malloc(sizeof(*s) * (strlen(s) + 1)), s);
}

Index create_index(){
	Index i = {.root = NULL};
	return i;
}


bool word_repeat(IndexBSTNode* root,char* word){
	bool final = false;
	if(root!=NULL){
		if(strcmp(word,root->word)<0){
			return word_repeat(root->left,word);
		}
		else if(strcmp(word,root->word)>0){	
			return word_repeat(root->right,word);
		}
		else{
			final = true;
		}
	}
	return final;
}

bool file_repeat(StringListNode* filenames,char* filename){
	bool final = false;
	StringListNode* p = filenames;

	while(p != NULL){
		if(strcmp(filename,p->filename)==0){
			final = true;
			return final;
		}
		p = p->next;
	}
	return final;
}

StringListNode* add_filename(char* filename){
	StringListNode* insert = malloc(sizeof(*insert));
	insert->filename = _strdup(filename);
	insert->next = NULL;
	return insert;
}

IndexBSTNode* create_node(char* word){
	IndexBSTNode* new = malloc(sizeof(*new));
	new->word = _strdup(word);
	new->left = NULL;
	new->right = NULL;
	new->filenames = NULL;
	return new;
}

void put_better(IndexBSTNode** root,char* word,char* filename, bool inBST){
	if(*root == NULL){
		if(inBST == false){
			*root = create_node(word);
		}
	}
	else if(strcmp(word,(*root)->word) > 0){
		put_better(&(*root)->right,word,filename,inBST);
	}
	else{
		put_better(&(*root)->left,word,filename,inBST);
	}

}

void put(Index* index, char* word, char* filename){
	bool inBST = word_repeat(index->root,word);
	put_better(&(index->root), word, filename, inBST);
	IndexBSTNode* root = index->root;

	while(root!=NULL && strcmp(word,root->word)!=0){
		if(strcmp(word,root->word)<0){
			root = root->left;
		}
		else{
			root = root->right;
		}
	}

	if(root->filenames==NULL){
		root->filenames = add_filename(filename);
	}
	else if(file_repeat(root->filenames,filename)==false){
		StringListNode* p = root->filenames;

		while(p->next!=NULL){
			p = p->next;
		}
		p->next = add_filename(filename);
	}
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
	IndexBSTNode* root = index->root;
	StringListNode* p;

	while(root != NULL && strcmp(word,root->word)!=0){
		if(strcmp(word,root->word)>0){
			root = root->right;
		}
		else{
			root = root->left;
		}
	}

	p = root->filenames;
	*count = 0;
	while(p != NULL){
		p = p->next;
		*count++;
	}

	char** files = malloc((*count)*sizeof(*files));
	int i = 0;	
	p = root->filenames;
	while(p!=NULL && files!=NULL){
		*(files+i)= p->filename;
		p = p->next;
		i++;
	}
	return files;
}


void free_files(StringListNode* p){
	StringListNode* q;
	while(p!=NULL){
		q = p;
		p = p->next;
		free(q->filename);
		free(q);
	}
	free(p);
}

void free_better(IndexBSTNode* root){
	if(root==NULL){
		return;
	}
	free_better(root->right);
	free_better(root->left);
	
	free_files(root->filenames);
	free(root->word);
	free(root);
}

void free_index(Index* index){
	free_better(index->root);
	return;
}
