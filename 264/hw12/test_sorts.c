#include <stdio.h>
#include <stdlib.h>
#include "sorts.h"

int main(int argc, char* argv[]){

	int list[7] = {1,5,3,6,3,2,1};
	 List a = create_list(list,7);
	quick_sort_array(list,7);

	for(int i = 0; i<7; i++){
		printf("%d ",list[i]);
	}
	
	int list2[7] = {1,5,3,6,3,2,1};
	 BST b = create_bst(list2,7);
	tree_sort_array(list2,7);
	printf("\n%d\n",b.root->value);
	for(int i = 0; i<7; i++){
		printf("%d ",list2[i]);
	}
	
	empty_list(&a);
	empty_bst(&b);
	
	return 0;











}
