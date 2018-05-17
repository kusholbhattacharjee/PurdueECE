/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "bmp.h"

int main (int argc, char* argv[]){

	
	// Stage 1: Reading the header of the train
	FILE* fp = fopen("purduetrain.bmp", "r"); 
	char* error = NULL; 
	BMPImage* train = read_bmp(fp, &error); 
	fclose(fp);
	
	
	fp = fopen("new_train.bmp", "w"); 
	write_bmp(fp,train,&error); 


	// Stage 2: Check the BMP header of the image excluding the size of the file
	bool isValid = check_bmp_header(&(train -> header), fp); 
	fprintf(stdout, "\nHeader of train image valid == %d\n", isValid); 
	fprintf(stdout, "Value of bits_per_pixel == %d\n", train -> header.bits_per_pixel); 
	
	//stage 3: crop the train
	FILE* fp1 = fopen("crop_train.bmp","w");
	BMPImage* cropped_train = crop_bmp(train,0,0,390,364,&error);
	write_bmp(fp1,cropped_train,&error);
	free_bmp(cropped_train);
	fclose(fp1);

	//Stage 4: free the train
	free_bmp(train);
	fclose(fp);
	
	
	//Stage 5: read airplane
	fp = fopen("airplane.bmp", "r"); 
	error = NULL; 
	BMPImage* plane = read_bmp(fp, &error); 
	fclose(fp);
	
	//Stage 6: write plane to new plane
	fp = fopen("new_plane.bmp", "w"); 
	write_bmp(fp,plane,&error); 


	// Stage 7: Check the BMP header of the image excluding the size of the file
	isValid = check_bmp_header(&(plane -> header), fp); 
	fprintf(stdout, "\nHeader of train image valid == %d\n", isValid); 
	fprintf(stdout, "Value of bits_per_pixel == %d\n", plane -> header.bits_per_pixel); 
	

	//Stage 8: Crop the plane
	fp1 = fopen("crop_plane.bmp","w");
	BMPImage* cropped_plane = crop_bmp(plane,5,5,390,364,&error);
	write_bmp(fp1,cropped_plane,&error);
	fclose(fp1);

	//Stage 9: free the plane
	free_bmp(cropped_plane);
	free_bmp(plane);
	fclose(fp);

	//Stage 10: read car
	fp = fopen("car.bmp", "r"); 
	error = NULL; 
	BMPImage* car = read_bmp(fp, &error); 
	fclose(fp);
	
	//Stage 11: write car
	fp = fopen("new_car.bmp", "w"); 
	write_bmp(fp,car,&error); 


	// Stage 12: Check the BMP header of the image excluding the size of the file
	isValid = check_bmp_header(&(car -> header), fp); 
	fprintf(stdout, "\nHeader of train image valid == %d\n", isValid); 
	fprintf(stdout, "Value of bits_per_pixel == %d\n", car -> header.bits_per_pixel); 

	
	free_bmp(car);
	fclose(fp);
	
	return EXIT_SUCCESS; 
}
