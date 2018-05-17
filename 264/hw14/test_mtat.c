/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "bmp.h"
#include "mtat.h"

int main (int argc, char* argv[]){

	
	// Stage 1: Reading the header of the train
	FILE* fp = fopen("img1_6x6_color.bmp","r");
	
	char* error = NULL; 
	BMPImage* train = read_bmp(fp, &error); 
	fclose(fp);
	
	BMPImage* bwtrain = binarize(train,4,3,&error);	
	fp = fopen("new_train.bmp", "w"); 
	write_bmp(fp,bwtrain,&error); 

	//Stage 4: free the train
	free_bmp(train);
	fclose(fp);
	
	return EXIT_SUCCESS; 
}
