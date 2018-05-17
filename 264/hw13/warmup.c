/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct { int x; int y; } Point;

char* read_file(char* path, char** error)
{
	FILE* fp;
	int size; 
	fp = fopen(path, "r"); 

	if(fp == NULL)
	{ 
		if(*error == NULL)
		{ 
			char* message = "The file was unable to be opened"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return ""; 
	}

	fseek(fp, 0, SEEK_END); // Moves the file pointer ot the end of the file
	size = ftell(fp);  // Returns the current position of the file pointer
	fseek(fp, 0, SEEK_SET);

	char* data = malloc(sizeof(*data) * (size + 1)); 

	fread(data, sizeof(*data), size, fp);
	*(data + size) = '\0'; 
	fclose(fp); 

	return(data); 
}

void write_file(const char* path, const char* contents, char** error)
{
	FILE* fp; 
	fp = fopen(path, "w"); 

	if(fp == NULL)
	{ 
		if(*error == NULL)
		{ 
			char* message = "The file was unable to be opened"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return; 
	}

	fwrite(contents, sizeof(*contents), strlen(contents), fp);
	fclose(fp);
}

void write_point(char* path, Point p, char** error)
{
	FILE* fp; 
	fp = fopen(path, "w"); 

	if(fp == NULL)
	{ 
		if(*error == NULL)
		{ 
			char* message = "The file was unable to be opened"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return; 
	}

	fwrite(&p, sizeof(p), 1, fp);
	fclose(fp); 
}

Point read_point(const char* path, char** error)
{ 
	FILE* fp; 
	fp = fopen(path, "r"); 
	Point pointer = {.x = -1, .y = -1}; 

	if(fp == NULL)
	{ 
		if(*error == NULL)
		{ 
			char* message = "The file was unable to be opened"; 
			*error = malloc((strlen(message) + 1) * sizeof(**error)); 
			strcpy(*error, message); 
		}

		return pointer; 
	}

	fread(&pointer, sizeof(pointer), 1, fp);
	fclose(fp);

	return(pointer); 
}
