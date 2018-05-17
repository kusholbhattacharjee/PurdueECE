#ifndef _MTAT_H_
#define _MTAT_H_
#include "bmp.h"

// Do not modify the declaration of binarize.
BMPImage* binarize(BMPImage* image, int radius, int num_threads, char** a_error);

// OK to add your own declarations BELOW here
void _determineColor(BMPImage* copy,BMPImage* image, int padding, int row_size, int x, int y,int radius,int pixel);
#endif /* mtat.h */
