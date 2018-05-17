/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "bmp.h"

BMPImage* read_bmp(FILE* fp, char** error){
	
	if(fp==NULL){
		if(*error==NULL){
		char* message = "read_bmp() function failed because success=false.\n";
		*error = malloc(sizeof(**error)*(strlen(message)+1));
		strcpy(*error,message);
	}

		return NULL;
	}

	BMPImage* image = NULL;
	BMPHeader header;
	int success = 0;

	success = fread(&header,sizeof(header),1,fp);

	if(success==0){
		if(*error==NULL){
			char* message = "read_bmp() function failed because success=false.\n";
			*error = malloc(sizeof(**error)*(strlen(message)+1));
			strcpy(*error,message);
		}
		return image;
	}
	
	if(check_bmp_header(&header,fp)==true){
		image = malloc(sizeof(*image));
		unsigned char* myData = malloc(header.image_size_bytes);
		success = fread(myData,sizeof(*myData),header.image_size_bytes,fp);
				
		if(success==0){
			if(*error==NULL){
				char* message = "read_bmp() function failed because success=false.\n";
				*error = malloc(sizeof(**error)*(strlen(message)+1));
				strcpy(*error,message);
			}
			return image;
		}
		
		image->data = myData;
		image->header = header;
	}

	else{
		if(*error==NULL){
			char* message = "read_bmp() function failed because check_bmp_header returned 0.\n";
			*error = malloc(sizeof(**error)*(strlen(message)+1));
			strcpy(*error,message);
		}
		return image;
	}
	fseek(fp,0,SEEK_SET);
	return image;
}

int _padding(int rowsize){
	int i=0;
	int padding=0;
	rowsize *= 3;
	while( (i*4) < rowsize){
		i++;
	}
	padding = (i*4) - rowsize;
	return padding;
}

bool check_bmp_header(BMPHeader* bmp_header, FILE* fp){

	int padding = _padding(bmp_header->width_px); 
	int area = (bmp_header->width_px) * 3;
	area += padding;
	area *= bmp_header->height_px;
	int current = ftell(fp);
	fseek(fp,0,SEEK_END);
	int end = ftell(fp);
	fseek(fp,current,SEEK_SET);

	if(bmp_header->type != 0x4d42)
		return false;
	else if (bmp_header->offset != BMP_HEADER_SIZE)
		return false;
	else if (bmp_header->dib_header_size != DIB_HEADER_SIZE)
		return false;
	else if (bmp_header->num_colors!=0)
		return false;
	else if (bmp_header->num_planes !=1)
		return false;
	else if (bmp_header->important_colors!=0)
		return false;
	else if (bmp_header->bits_per_pixel != 16 && bmp_header->bits_per_pixel != 24) 
		return false;
	else if (area != bmp_header->image_size_bytes)
		return false;
	else if ((area + BMP_HEADER_SIZE) != bmp_header->size)
		return false;
	else if(bmp_header->compression!=0)
		return false;
	else if(end != bmp_header->size)
		return false;
	else
		return true;
}

bool write_bmp(FILE* fp, BMPImage* image, char** error){
	int success;
	success = fwrite(&(image->header),BMP_HEADER_SIZE,1,fp);
	
	
	if(fp==NULL){
		if(*error==NULL){
		char* message = "read_bmp() function failed because success=false.\n";
		*error = malloc(sizeof(**error)*(strlen(message)+1));
		strcpy(*error,message);
		return false;
		}
	}


	if(success==0){
		if(*error==NULL){
			char* message = "write_bmp() function failed because success=false.\n";
			*error = malloc(sizeof(**error)*(strlen(message)+1));
			strcpy(*error,message);
		}
		return false;
	}


	success = fwrite(image->data,sizeof(*(image->data)),(image->header).image_size_bytes,fp);
	
	if(success==0){
		if(*error==NULL){
			char* message = "write_bmp() function failed because success=false.\n";
			*error = malloc(sizeof(**error)*(strlen(message)+1));
			strcpy(*error,message);
		}
		return false;
	}
	
	return true;
}

void free_bmp(BMPImage* image){
	if(image!=NULL){
		if(image->data!=NULL){
			free(image->data);
			free(image);
			return;
		}
	}
}

BMPImage* crop_bmp(BMPImage* image, int x, int y, int w, int h, char** error){
	
	BMPImage* cropped_pic = malloc(sizeof(*cropped_pic));
	BMPHeader cropped_header = image->header;
	int padding = 0;
	int old_padding = _padding(image->header.width_px);
	
	if(y + h > image -> header.height_px || y < 0)
	{
		if(*error == NULL)
		{ 
			char* message = "Image could not be cropped. Invalid bounds for height of new image.\n"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return NULL; 
	}
	
	// Make sure the width is within the bounds of the image
	if(x + w > image -> header.width_px || x < 0)
	{ 
		if(*error == NULL)
		{ 
			char* message = "Image could not be cropped. Invalid bounds for width of new image.\n"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return NULL;
	}

	cropped_header.width_px = w;
	cropped_header.height_px = h;

	padding = _padding(cropped_header.width_px);
	cropped_header.image_size_bytes = ((cropped_header.width_px*3)+padding)*(cropped_header.height_px);
	cropped_header.size = cropped_header.image_size_bytes + BMP_HEADER_SIZE;

	int y_counter = (image->header.height_px -(y+h));
	int x_counter = x*3;
	int i = 0;
	
	unsigned char* cropped_data = malloc(cropped_header.image_size_bytes);
	while(y_counter < image->header.height_px-y){
		x_counter = x*3;
		while(x_counter < (w+x)*3){
			cropped_data[i] = image->data[x_counter + y_counter*(old_padding + (image->header.width_px * 3))];
			i++;
			x_counter++;
		}
		int p=0;
		while(p<(padding)){
			cropped_data[i]=0x00;
			p++;
			i++;
		}
		y_counter++;
	}
	
	//cropped_pic = (BMPImage *)malloc(cropped_header.size);
	cropped_pic->header = cropped_header;
	//strcpy((char*)(cropped_pic->data),(char*)( cropped_data));
	(cropped_pic->data) = (cropped_data);
	//free(cropped_data);
	return cropped_pic;
	
	return image;
}




