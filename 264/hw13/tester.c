/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "bmp.h"

int main (int argc, char* argv[])
{

	// Stage00: Skeleton of code created
	
	// Stage01: Reading the header of an image
	FILE* fp = fopen("purduetrain.bmp", "r"); 
	char* error = NULL; 
	BMPImage* train = read_bmp(fp, &error); 
	fclose(fp);

	fp = fopen("trainheader.txt", "w"); 
	fwrite(&(train -> header), sizeof(train -> header), 1, fp); 


	// Stage02: Check the BMP header of the image excluding the size of the file
	bool isValid = check_bmp_header(&(train -> header), fp); 
	fprintf(stdout, "\nHeader of train image valid == %d\n", isValid); 
	fprintf(stdout, "Value of bits_per_pixel == %d\n", train -> header.bits_per_pixel); 
	fclose(fp);


	// Stage03: Reading in the rest of the data in read_bmp (assuming size is valid)
	fp = fopen("traindata.txt", "w"); 
	fwrite(train -> data, sizeof(*(train -> data)), train -> header.image_size_bytes, fp);
	fclose(fp);

	// Stage03: free_bmp implemented 
	free_bmp(train); 

	// Stage04: write_bmp implemented
	fp = fopen("green_earth.bmp", "r");
	BMPImage* gEarth = read_bmp(fp, &error); 
	fclose(fp); 

	fp = fopen("green_earth_copy.bmp", "w"); 
	write_bmp(fp, gEarth, &error); 
	fclose(fp); 
	free_bmp(gEarth); 
	
	// Stage05: Add error statements to read_bmp
	fp = fopen("bad_file.bmp", "r"); 
	BMPImage* errorImage = read_bmp(fp, &error);
	
	// Checks for fread failure
	if(errorImage == NULL)
	{ 
		fprintf(stderr, error); 
		free(error); 
	}

	fclose(fp);

	// Stage 06: Implement checking for size in check_bmp_header
	
	// Checks for invalid .bmp file error
	char* error2 = NULL; 
	fp = fopen("corrupt_green_earthh.bmp", "r"); 
	errorImage = read_bmp(fp, &error2); 

	if(errorImage == NULL)
	{ 
		fprintf(stderr, error2); 
		free(error2); 
	}

	fclose(fp);

	// Stage07: Check for correct bounds in crop_bmp
	char* error3 = NULL; 
	fp = fopen("car.bmp", "r"); 
	BMPImage* car = read_bmp(fp, &error3);  

	if(car == NULL)
	{ 
		fprintf(stderr, error3); 
		free(error3); 
	}
	
	fclose(fp); 
	fprintf(stdout, "Width of car image  == %d\n", car -> header.width_px); 
	fprintf(stdout, "Height of car image == %d\n", car -> header.height_px); 

	/*BMPImage* croppedCar = crop_bmp(car, 12, 400, 150, 60, &error3); 

	if(croppedCar == NULL)
	{ 
		fprintf(stderr, error3); 
		free(error3); 
	}

	char* error4 = NULL; 
	croppedCar = crop_bmp(car, 460, 50, 20, 130, &error4); 

	if(croppedCar == NULL)
	{ 
		fprintf(stderr, error4); 
		free(error4); 
	}

	// Stage08: Edit the BMPHeader for the cropped image
	char* error5 = NULL; 
	croppedCar = crop_bmp(car, 100, 40, 10, 10, &error5); 

	if(croppedCar == NULL)
	{ 
		fprintf(stderr, error5); 
		free(error5); 
	}
	
	// Stage09: Begin to crop image
	fprintf(stdout, "Pixel1 in car data: \n");
	int x; 

	for(x = 0; x  < 3; x++)
		fprintf(stdout, "%x", car -> data[x]);  

	fp = fopen("croppedData.txt", "w"); 
	fwrite(croppedCar -> data, sizeof(*(croppedCar -> data)), croppedCar -> header.image_size_bytes, fp);

	free_bmp(car); 
	free_bmp(croppedCar); */
	return(0); 
}
