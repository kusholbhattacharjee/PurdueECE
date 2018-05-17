#include <stdio.h> //needed for printf
#include <stdlib.h> //needed for EXIT_SUCCESS
#include "sorting.h"


int * getGapArray(int Size);
int power(int r,int e);

int power(int r,int e){
	if (e==0){
		return 1;
	}
	else if (e==1){
		return r;
	}
	else{
		return r*power(r,e-1);
	}
}


long *Load_From_File(char *Filename, int *Size){	//DONE OFFICIALLY
	int size = *Size/sizeof(long);
	*Size = size;
	FILE* infile = fopen(Filename,"rb");
	int i;
	long* ptr = malloc(size*sizeof(long));
	
	for (i=0;i<size;i++){
		fread(&ptr[i],sizeof(long),1,infile);
	}
	fclose(infile);
	return ptr;
}

int Save_To_File(char *Filename, long *Array, int Size){
	int size = Size;
	FILE* outfile = fopen(Filename,"wb");
	Size = size;
	int i;
	for (i=0;i<size;i++){
		fwrite(&Array[i],sizeof(long),1,outfile);
		//printf(" i:%d, size: %d\n",i,size); 
		//printf(" %ld",Array[i]);
	}
	fclose(outfile);
	free(Array);
	return size;

}

int Print_Seq(char *Filename, int Size){ //DONE (needs to be tested)
	if (Size < 2)
		return 0;

	int* g = getGapArray(Size);
	FILE* fp = fopen(Filename,"w");
	int i;
	for(i=0;i<sizeof(g);i++){
		fprintf(fp,"%d\n",*g);
	}
	return i;
}

void Shell_Selection_Sort(long *Array, int Size, double *N_Comp, double *N_Move){
	int* gap = getGapArray(Size);
	int k = sizeof(gap)-1;
	int i;
	long temp;
	int min_index;
	while (k>=0){
		int j;
		for(j=0;j<gap[k];j++){
			int x=j;
			while(x < (Size-gap[k])){
				i = x;
				min_index = i;
				while ((i+gap[k])<Size){
					i = i+gap[k];
					*N_Comp+=1;
					if (Array[i]<Array[min_index]){
						min_index = i;
					}
				}

				if (min_index != i){
					temp = Array[min_index];
					Array[min_index] = Array[x];
					Array[x] = temp;
					*N_Move += 3;
				}
				x = x+gap[k];
			}
		}
		k--;
	}
	free(gap);
	return;
}


void Shell_Insertion_Sort(long *Array, int Size, double *N_Comp, double *N_Move){
	int* gap = getGapArray(Size);
	int k = sizeof(gap)-1;
	int i;
	long temp;
	while (k>=0){
		int j;
		for(j=gap[k];j<Size;j++){
			temp = Array[j];
			*N_Move+=1;
			i = j;
			*N_Comp+=1;
			while (i>=gap[k] && Array[i-gap[k]]>temp){
				Array[i] = Array[i-gap[k]];
				i = i-gap[k];
				*N_Comp+=1;
				*N_Move+=1;
			}
			Array[i] = temp;
			*N_Move+=1;
		}
		k--;
	}
	free(gap);
	return;
}


int * getGapArray(int Size){
	int sum_powers=0;
	int ct=0;
	int num = 0;
	int exp21 = sum_powers;
	int exp3 = 0;
	while (num<Size){	
		exp21 = sum_powers;
		exp3 = 0;
		while (exp3 < sum_powers+1){
			num = power(2,exp21) * power(3,exp3);
			if (num>Size)
				break;
			ct++;
			exp21--;
			exp3++;
		}
		sum_powers++;
	}
	int* gap = malloc(sizeof(int)*ct);
	sum_powers=0;ct=0;num=0;exp21=0;exp3=0;
	while (num<Size){	
		exp21 = sum_powers;
		exp3 = 0;
		while (exp3 <= sum_powers){
			num = power(2,exp21)*power(3,exp3);
			if (num>Size)
				break;
			gap[ct]=num;
			ct++;
			exp21--;
			exp3++;
		}
		sum_powers++;
	}	
	return gap;
}

/*
int main(){
	int size;
	FILE *infile = fopen("15.b","rb");
	fseek(infile,0,SEEK_END);
	size = ftell(infile);
	//printf("%d",size);
	*Load_From_File("15.b",&size);
	int i;	
	int* ugh = getGapArray(15);
	int len = sizeof(&ugh);
	printf("%d\n",len);
	for (i=0;i<len;i++){
		printf("%d ",ugh[i]);
	}
	(ugh);

	long * array = Load_From_File("15.b",&size);
	double* comps;
	double* moves;

	Shell_Insertion_Sort(array,15,comps,moves);
	//Shell_Selection_Sort(array,15,comps,moves);
	
	printf("\n");
	int i;
	int len = 15;
	for (i=0;i<len;i++){
		printf("%d ",array[i]);
	}

	
	return 0;
}
*/

