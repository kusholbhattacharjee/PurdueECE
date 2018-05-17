#include <stdio.h> //needed for printf
#include <stdlib.h> //needed for EXIT_SUCCESS
#include "sorting.h"

Node* getLink(Node* temp,int link);
Gap * getGapArray(int Size);
int power(int r,int e);

Node* Shell_Sort(Node* list){
	int size = 0;
	Node* temp = list;
	while(temp!=NULL){
		temp = temp->next;
		size++;
	}
	//printf("SIZE: %d ",size);
	Gap* gapArr = getGapArray(size);
	int gap;
	Node* head = list;	
	Node* minP = list;
	Node* cP = list;
	Node* m = list;
	Node* ex = list;
	Gap* useless = gapArr;
	long min = 0;
	int i,j,x;
	while (gapArr!=NULL){
		gap = gapArr->value;
		//printf("\n%d\n",gap);
		for(j=0;j<gap;j++){
			x = j;
			//printf("j:%d ",j);
			while(x < (size-gap)){
				//printf("x:%d ",x);
				if (x==0){
					ex = NULL;
					i = x;
					min = head->value;
					while ((i+gap)<size){
						i = i+gap;
						temp = head;
						//printf("i:%d ",i);
						cP = getLink(temp,i);
						temp = head;
						//printf("comparing: %ld and %ld\n",min,cP->next->value);
						if (cP->next->value < min){
							ex = cP;
							min = cP->next->value;
							//printf("swap made: %ld\n",min);
						}
					}
					if (ex==NULL){
						//do nothing
					}
					else if(head == ex){
						//swap head with adjacent
						m = ex->next;
						head->next = m->next;
						m->next = head;
						head = m;
						//printf("head:%ld",head->value);
					}
					else{
						//swap normal with head CHECK THIS ONE
						temp = ex->next->next;
						head = ex->next;
						ex->next = list;
						head->next = list->next;
						list->next = temp;
						list = head;
					}
				}
				else{
					temp = head;
					minP = getLink(temp,x);
					min = minP->next->value;
					temp = head;
					ex = NULL;
					i = x;
					while ((i+gap)<size){
						i = i+gap;
						temp = head;
						//printf("i:%d ",i);
						cP = getLink(temp,i);
						temp = head;
						//printf("comparing: %ld and %ld\n at positions %d,%d",min,cP->next->value,x,i);
						if (cP->next->value < min){
							ex = cP;
							min = cP->next->value;
							//printf("swap made: %ld\n",min);
						}
					}
					if (ex == NULL){
						//do nothing
					}
					else if (minP->next == ex){
						//if adjacent swap
						m = ex->next;
						minP->next = m;
						ex->next = m->next;
						m->next = ex;
						//printf("%ld",m->value);
					}
					else{
						//swap normal
						m = minP->next;
						temp = ex->next->next;
						minP->next = ex->next;
						ex->next = m;
						minP->next->next = m->next;
						m->next = temp;
					}
				}
				x = x+gap;
			}
		}
		useless = gapArr;
		gapArr = gapArr->next;
		free(useless);
	}	
	return head;
}

Node *Load_From_File(char *Filename){	//Needs to be tested
	FILE* infile = fopen(Filename,"rb");
	fseek(infile,0,SEEK_END);
	int size = ftell(infile)/sizeof(long);
	rewind(infile);
	Node* head = malloc(sizeof(Node));
	fread(&(head->value),sizeof(long),1,infile);
	//printf("%ld\n",head->value);
	head->next = NULL;
	Node* temp = head;
	int i;
	for (i=1;i<size;i++){
		Node* newNode = malloc(sizeof(Node));
		newNode->next = NULL;
		fread(&(newNode->value),sizeof(long),1,infile);
		//printf("%ld\n",newNode->value);
		temp->next = newNode;
		temp = newNode;
	}
	fclose(infile);
	return head;
}

int Save_To_File(char *Filename, Node *list){
	FILE* outfile = fopen(Filename,"wb");
	int i = 0;
	while (list!=NULL){
		fwrite(&(list->value),sizeof(long),1,outfile);
		list = list->next;
		i++;
	}
	fclose(outfile);
	return i;
}

Gap * getGapArray(int Size){
	int sum_powers=0;
	int ct=0;
	int num = 0;
	int exp21 = sum_powers;
	int exp3 = 0;
	Gap* gapHead = NULL;
	Gap* temp = NULL;
	while (num<Size){	
		exp21 = sum_powers;
		exp3 = 0;
		while (exp3 < sum_powers+1){
			num = power(2,exp21) * power(3,exp3);

			if (num>Size){
				gapHead = temp;
				break;
			}

			Gap* gapNode = malloc(sizeof(Gap));
			gapNode->next = temp;
			gapNode->value = num;
			temp = gapNode;

			ct++;
			exp21--;
			exp3++;
		}
		sum_powers++;
	}
	return gapHead;
}

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

Node* getLink(Node* temp,int link){
	link = link-1;
	int i = 0;
	while (i<link && temp->next!=NULL){
		temp = temp->next;
		i++;
	}
	return temp;
}

