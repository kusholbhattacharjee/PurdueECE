/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "bmp.h"


int get_padding(int sizeRow, int bits);

bool write_bmp(FILE* fp, BMPImage* image, char** error)
{
	int numWritten = 0; 

	// Writes the header into the file
	numWritten = fwrite(&(image -> header), BMP_HEADER_SIZE, 1, fp); 

	if(numWritten == 0)
	{
		if(*error == NULL)
		{ 
			char* message = "The file was unable to be written in function write_bmp.\n"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return(false); 
	}

	// Writes the rest of the data into the file
	numWritten = fwrite(image -> data, sizeof(*(image -> data)), image -> header.image_size_bytes, fp); 

	if(numWritten == 0)
	{
		if(*error == NULL)
		{ 
			char* message = "The file was unable to be written in function write_bmp.\n"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return(false); 
	}

	return(true); 
}

/*BMPImage* crop_bmp(BMPImage* image, int x, int y, int w, int h, char** error)
{
	BMPImage* croppedImage = NULL; 
	BMPHeader croppedHeader; 
	int paddingBytes = 0; 
	int croppedImageSize = 0; 

	// Make sure the height is within the bounds of the image
	if(y + h >= image -> header.height_px || y < 0)
	{
		if(*error == NULL)
		{ 
			char* message = "Image could not be cropped. Invalid bounds for height of new image.\n"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return(croppedImage); 
	}
	
	// Make sure the width is within the bounds of the image
	if(x + w >= image -> header.width_px || x < 0)
	{ 
		if(*error == NULL)
		{ 
			char* message = "Image could not be cropped. Invalid bounds for width of new image.\n"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return(croppedImage);
	}

	// Setting proper header for cropped image 
	croppedHeader = image -> header; 
	croppedHeader.width_px = w; 
	croppedHeader.height_px = h; 

	paddingBytes = get_padding(croppedHeader.width_px, croppedHeader.bits_per_pixel); 
	croppedImageSize = ((croppedHeader.width_px * 3) + paddingBytes) * (croppedHeader.height_px); 
	croppedHeader.image_size_bytes = croppedImageSize; 
	croppedHeader.size = croppedImageSize + BMP_HEADER_SIZE;


	// "Move upwards" until it reaches desired bottom of cropped image 
	int yPlace = ((image -> header.height_px - (y + h)) * image -> header.width_px) * 3;  
	int currByte = 0; 

	while(currByte < yPlace)
		currByte++;

	// "Move left" until reaches left of cropped image
	int xPlace = x * 3; 
	while(currByte < xPlace)
		currByte++;

	int heightBound = ((image -> header.height_px - y) * (image -> header.width_px)) * 3; 	
	int widthBound = (x + w) * 3; 
	
	unsigned char* croppedData = malloc(croppedHeader.image_size_bytes); 
	while(yPlace > ((image -> header.height_px - y) * 3))
	{
		xPlace = x * 3; 
		while(xPlace < ((x + w) * 3))
		{ 
			croppedData[newPlace] = image -> data[xPlace + yPlace]; 
			xPlace++; 
			newPlace++; 
		}
		
		yPlace--; 
	}
		

	croppedImage = malloc(croppedHeader.size); 
	croppedImage -> header = croppedHeader; 
	croppedImage -> data = croppedData;

	return(croppedImage); 

}*/

BMPImage* read_bmp(FILE* fp, char** error)
{ 
	BMPImage* newImage = NULL;  
	BMPHeader newHeader; 
	int isRead = 0; 

	isRead = fread(&newHeader, sizeof(newHeader), 1, fp);

	if(isRead == 0)
	{
		if(*error == NULL)
		{ 
			char* message = "The file was unable to be read in function read_bmp.\n"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return(newImage); 
	}

	if(check_bmp_header(&newHeader, fp) == true)
	{ 
		newImage = malloc(sizeof(*newImage)); 
		unsigned char* newData = malloc(newHeader.image_size_bytes); 
		fread(newData, sizeof(*newData), newHeader.image_size_bytes, fp);  

		if(isRead == 0)
		{
			if(*error == NULL)
			{ 
				char* message = "The file was unable to be read in function read_bmp.\n"; 
				*error = malloc((strlen(message) + 1) * sizeof(**error)); 
				strcpy(*error, message); 
			}

			return(newImage); 
		}

		newImage -> header = newHeader; 
		newImage -> data = newData; 
	}

	else 
	{
		if(*error == NULL)
		{ 
			char* message = "This is not a valid BMP file.\n"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return(newImage); 
	}
	
	fseek(fp, 0, SEEK_SET); 
	return(newImage); 
}

void free_bmp(BMPImage* image)
{
	free(image -> data); 
	free(image); 
}

bool check_bmp_header(BMPHeader* bmp_header, FILE* fp)
{
	bool valid = true; 

	if(bmp_header -> type != 0x4d42)
		valid = false; 
	
	if(bmp_header -> offset != BMP_HEADER_SIZE)
		valid = false;

	if(bmp_header -> dib_header_size != DIB_HEADER_SIZE)
		valid = false; 

	if(bmp_header -> num_colors != 0 || bmp_header -> important_colors != 0)
		valid = false; 
	
	if(bmp_header -> bits_per_pixel != 16 && bmp_header -> bits_per_pixel != 24)
		valid = false;

	
	int paddingBytes = get_padding(bmp_header -> width_px, bmp_header -> bits_per_pixel); 
	int testSize = ((bmp_header -> width_px * 3) + paddingBytes) * (bmp_header -> height_px); 

	if(testSize != bmp_header -> image_size_bytes)
		valid = false; 
	
	if((testSize + BMP_HEADER_SIZE) != bmp_header -> size)
		valid = false; 


	return(valid); 
}

int get_padding(int sizeRow, int bits)
{
	int x = 0; 
	int padding = 0; 
	int sizeRowBytes = sizeRow * 3; 

	while(4 * x < sizeRowBytes)
		x++; 
	
	padding = 4 * x - sizeRowBytes; 

	return(padding); }
	
		
