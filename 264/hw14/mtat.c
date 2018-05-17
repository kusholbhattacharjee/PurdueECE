/*vim:set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "bmp.h"
#include "mtat.h"
/*
struct Line{
	BMPImage* image;
	BMPImage* copy;
	int padding;
	int x;
	int y;
	int radius;
	int pixel;
	int end;
	int start;
};*/


char* _strdup(const char* s) {  // helper function;  okay to use anywhere in this assignment
	return strcpy(malloc(sizeof(*s) * (strlen(s) + 1)), s);
}

BMPImage* binarize(BMPImage* image,int radius,int num_threads, char** error){
	
	BMPImage* copy = malloc(sizeof(*copy));
	copy->header = image->header;
	copy->data = malloc(copy->header.image_size_bytes);
	/*
	if(image==NULL || radius==0 || num_threads<=0){
		char* message = "ERROR";
		*error = _strdup(message);
		return NULL;
	}*/

	for(int i = 0; i<(image->header.image_size_bytes);i++){
		copy->data[i] = image->data[i];
	}
	
	int p = 0;
	for(int x = 0;x<copy->header.width_px;x++){
		for(int y = 0;y<copy->header.height_px;y++){
			int row_size = (copy->header.width_px)*3;
			if(row_size%4!=0)
				p = 4-(row_size%4);
			int pixel = 3*x + y*(row_size+p);
			_determineColor(copy,image,p,row_size,x,y,radius,pixel);
		}

	}
	return copy;
}

	/*
	int size = (image->header.image_size_bytes)/3;

	struct Line lines;
	pthread_t* second = malloc(sizeof(pthread_t)*num_threads);
	lines.start = 0;
	lines.end = size%num_threads;
	if(lines.end != 0)
		lines.end = (size/num_threads)+1;
	else
		lines.end = (size/num_threads);

	lines.end *=3;

	int line_size = lines.end;

	for(int i = 0;i<num_threads;i++){
		pthread_create(&second[i],NULL,worker,(void *)&lines);
		pthread_join(second[i],NULL);
		lines.start = lines.end;
		lines.end += line_size;
		if(lines.end > lines.size){
			lines.max = size;
		}
	}
	*/

void _determineColor(BMPImage* copy,BMPImage* image, int padding, int row_size, int x, int y,int radius,int pixel){
	int s = 0;
	int intensity = 0;
	int total_pixels = 0;
	for(int i = x-radius; i<= x+radius; i++){
		for(int j = y-radius; j<=y+radius; j++){
			s = (3*i)+(j*(row_size + padding));
			if(!(i<0 || i >= (image->header.width_px) || j<0 || j>=(image->header.height_px))){
				intensity += (image->data[s])+(image->data[s+1])+(image->data[s+2]);
				total_pixels++;
			}
		}
	}

	int sum = ((image->data[pixel])+(image->data[pixel+1])+(image->data[pixel+2]))*total_pixels;

	if(sum>intensity){
		copy->data[pixel]=255;
		copy->data[pixel+1]=255;
		copy->data[pixel+2]=255;
	}
	else{
		copy->data[pixel]=0;
		copy->data[pixel+1]=0;
		copy->data[pixel+2]=0;
	}
	return;
}

