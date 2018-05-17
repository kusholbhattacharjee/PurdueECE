/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "team.h"


struct Team copy_team(struct Team* team){
	//initialize the copy team and a personNode at the head
	struct Team copy;
	struct PersonNode* place = team->head;
	copy.head = NULL;
	copy.tail = NULL;

	//0 person case
	if (team->head == NULL){
		copy.name = NULL;
		return copy;
	}

	copy.name = team->name;

	
	//go through the linked list and add the names of the people
	while(place!=NULL){
		char* p_name = place->value->name;
		add_person(&copy,p_name,NULL);
		place = place->next;
	}

	//go through the linked list one more time and add all the favorites in
	struct PersonNode* looper = team->head;
	place = copy.head;
	while(looper!=NULL){
		char* f_name = looper->value->favorite->name;
		place->value->favorite = find_person(&copy,f_name);
		looper = looper->next;
		place = place->next;
	}
	return copy;
}


struct Team create_team(char* name, int population, struct Person* people){
	//initialize the team and a personNode as a counter
	struct Team t;
	t.head = NULL;
	t.tail = NULL;
	
	//0 person case
	if (population==0){
		t.name = name;
		return t;
	}

	t.name = name;
	int i = 0;
	struct PersonNode* looper = NULL;

	//add each person using the add person method
	while(i<population){
		add_person(&t,people[i].name,NULL);
		i++;
	}

	i = 0;
	looper = t.head;

	//add each person's favorite by going through the linked list
	while(looper!=NULL){
		looper->value->favorite = find_person(&t,people[i].favorite->name);
		looper = looper->next;
		i++;
	}

	return t;
}


void free_team(struct Team* team){

	if(team->head == NULL){
		return;
	}

	//initialize the 2 personNodes needed to delete each person
	struct PersonNode *p = team->head;
	struct PersonNode *q = team->head->next;
	
	
	//go through the linked list and free each Person and then the personNode
	while(p != NULL){	
		q = p->next;
		free(p->value);
		free(p);
		p = q;
	}
	return;
}


struct Person* find_person(struct Team* team, char * name){
	//go through the linked list and compare the name of the person at the node to the name given
	//if the person is found return a pointer to the person
	struct PersonNode* i = team->head;
	while (i!=NULL){
		if(strcmp(i->value->name,name)==0){
			return i->value;
		}
		i = i->next;
	}
	//return NULL if no match found
	return NULL;
}

struct Person* add_person(struct Team* team, char * name, char * favorite_name){
	//initialize a Person and assign memory
	struct PersonNode* insert;
	insert = malloc(sizeof(struct PersonNode));
	insert->value = malloc(sizeof(*(insert->value)));
	insert->value->name = name;
	
	//find the favorite and set it to person at insert's value
	//otherwise the favorite is set to NULL
	if (favorite_name != NULL){
		insert->value->favorite = find_person(team,favorite_name);
	}
	else{
		insert->value->favorite = NULL;
	}

	
	insert->next = NULL;
	insert->prev = NULL;
	
	//if there is a null team return 
	if (team->head == NULL){
		team->head = insert;
		team->tail = insert;
		return insert->value;
	}
	
	//move the position over to the tail's next
	struct PersonNode* position = team->head;
	while(position->next !=NULL){
		position = position->next;
	}

	//put the insert person in the tail's next spot
	position->next = insert;
	insert->prev = team->tail;
	team->tail = insert;
	return insert->value;
}

struct Person* detach_person(struct Team* team, char* name){
	if(team->head == NULL){
		return NULL;
	}

	//find the person who is going to be attached
	struct Person* person = find_person(team,name); 
	struct Person* copy = person;
	
	//if there is no copy array
	if(copy==NULL){
		return NULL;
	}
	
	//if the head is NULL of team
	struct PersonNode* p = team->head;
	if(p==NULL){
		return NULL;
	}
	
	//if the detached person is the head
	if(p->value==person){
		team->head = p->next;
		copy = p->value;
		free(p);
		return copy;
	}
	
	//loop through until end is reached or q is the person
	struct PersonNode *q = p->next;
	while(q!=NULL && q->value!=person){
		p = p->next;
		q = q->next;
	}
	//if q is the person that needs to be detached, free it
	if(q!=NULL){
		p->next = q->next;
		copy = q->value;
		free(q);
	}
	return copy;
}

void free_person(struct Person* person){
	//just free the pointer
	free(person);
}



void fprint_team(struct Team* team, FILE* stream){
	struct PersonNode* t = team->head;
	int max_len = 0;
	int x = 0;

	if(t==NULL){
		fprintf(stream,"%s\n",team->name);
		fprintf(stream,"- members: (none)\n");
	}

	//find the max length of a string 
	while (t!=NULL){	
		x = strlen(t->value->name);
		if (x>max_len){
			max_len=x;
		}
		t = t->next;
	}

	//go through the linked list 
	t = team->head;
	int line = 0;
	while (t!=NULL){
		if(line==0){
			fprintf(stream,"%s\n",team->name);
			line++;
			continue;
		}
		else if(line==1){
			fprintf(stream,"- members: ");
		}										//print the gap in the right format
		else{
			fprintf(stream,"           ");
		}
		fprintf(stream,"%s",t->value->name);
		int i = 0;
		for(i = strlen(t->value->name);i<max_len;i++){
			fprintf(stream," ");						//print the spaces when the smaller names don't reach
		}
		fprintf(stream," (favorite: %s)\n",t->value->favorite->name); //print the favorite for each line
		t=t->next;
		line++;
	}
	return;
}

char* _strdup(char* s){
	return strcpy(malloc(sizeof(*s)*(strlen(s)+1)),s);
}

