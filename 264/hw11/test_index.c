/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */

#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include "index.h"

void print_list(StringListNode* filenames)
{ 
	StringListNode* curr; 
	fprintf(stdout, "Files containing word:\n"); 
	for(curr = filenames; curr != NULL; curr = curr -> next)
	{	
		fprintf(stdout, "%s\n", curr -> filename); 
	}
}

void print_tree(IndexBSTNode* root)
{ 
	if(root != NULL)
	{ 
		print_tree(root -> left); 
		fprintf(stdout, "%s\n", root -> word); 
		print_list(root -> filenames); 
		print_tree(root -> right); 
	}
}

int main(int argc, char* argv[])
{ 
	Index index = create_index(); 
	put(&index, "Lebron", "one"); 
	fprintf(stdout, "index.root -> word: %s\n", index.root -> word);
	fprintf(stdout, "index.root -> filenames -> filename: %s\n", index.root -> filenames -> filename);  

	put(&index, "Lebron", "two"); 	
	put(&index, "Lebron", "three"); 
	
	put(&index, "Lebron", "three");
	put(&index, "Steph", "one"); 
	put(&index, "Durant", "one"); 
	put(&index, "Durant", "two"); 
	print_tree(index.root); 	
	
	int numFiles = 3;
	int i; 
	char** files = get(&index, &numFiles, "Lebron");  

	fprintf(stdout, "\nFiles gotten from get function:\n");
	for(i = 0; i < 3; i++)
		fprintf(stdout, "-%s\n", *(files + i)); 

	free(files);

	fprintf(stdout, "\n"); 
	print_tree(index.root); 
	free_index(&index); 
	
	return(0); 
}
