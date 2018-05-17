/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "team.h"
#include <stdarg.h>

void connect_favs(Favorites favorites,struct Team* team);
struct PersonNode* add_node(struct Person* person);
int max_length(struct Team* team);
struct Person* find_loser(struct Team* team,int min_votes,int total_votes);
struct Person* if_leader(struct Team* team, int min_votes,int total_votes);
Favorites detach_fav(struct PersonNode* position,struct Person* loser);

void connect_favs(Favorites favorites,struct Team* team){
	struct PersonNode* p = favorites.head;
	while(p!=NULL){
		p->value = find_person(team,p->value->name);
		p = p->next;
	}
	return;
}

struct Team create_test_team(){
	struct Person people[] = {
		{.name="Stephen Curry",.favorites=create_favorites(&people[1],people[0],NULL)},
		{.name="Lebron James",.favorites=create_favorites(&people[0],NULL)},
		{.name="Draymond Green",.favorites=create_favorites(&people[0],NULL)},
		{.name="Paul George",.favorites=create_favorites(&people[0],NULL)}
	};
	return create_team("NBA",sizeof(people)/sizeof(*people),people);
}

struct Team copy_team(struct Team* team){
	//initialize the copy team and a personNode at the head
	struct Team copy;
	struct PersonNode* place = team->head;
	copy.head = NULL;
	copy.tail = NULL;
	copy.name = _strdup(team->name);
	
	Favorites dummy = {
		.head = NULL,
		.tail = NULL
	};

	//0 person case
	if (team->head == NULL){
		return copy;
	}
	
	//go through the linked list and add the names of the people
	while(place!=NULL){
		add_person(&copy,place->value->name,dummy);
		place = place->next;
	}
	
	struct PersonNode* p = copy.head;
	struct PersonNode* q = team->head;
	struct PersonNode* f;
	struct PersonNode* f_copy;
	struct Person* fav_copy;
	while(p != NULL){
		if(q->value->favorites.head==NULL){
			p = p->next;
			q = q->next;
			continue;
		}
		fav_copy = find_person(&copy,q->value->favorites.head->value->name);
		if(fav_copy != NULL){
			p->value->favorites.head = add_node(fav_copy);
			p->value->favorites.tail = p->value->favorites.head;
		}
		
		f = q->value->favorites.head->next;
		f_copy = p->value->favorites.tail;

		while(f!=NULL){
			fav_copy = find_person(&copy,f->value->name);
			if(fav_copy!=NULL){
				f_copy->next = add_node(fav_copy);
				f_copy->next->prev = f_copy;
			}
			f_copy = f_copy->next;
			f = f->next;
		}

		p = p->next;
		q = q->next;
	}
	return copy;
}


struct Team create_team(char* name, int population, struct Person* people){
	//initialize the team and a personNode as a counter
	struct Team t;
	t.name = _strdup(name);
	t.head = NULL;
	t.tail = NULL;

	if (population==0){
		return t;
	}


	Favorites dummy = {
		.head=NULL,
		.tail=NULL
	};
	
	int i = 0;
	while(i<population){
		add_person(&t,(i+people)->name,dummy);
		i++;
	}
	
	i=0;
	struct PersonNode* looper = t.head;
	while(looper!=NULL){
		looper->value->favorites = people[i].favorites;
		connect_favs(looper->value->favorites,&t);
		looper = looper->next;
		i++;
	}

	return t;
}


void free_team(struct Team* team){
	free(team->name);

	struct PersonNode *p = team->head;
	struct PersonNode *q; 
	
	while (p!=NULL){
		q = p;
		p = p->next;
		struct Person* fred = detach_person(team,q->value->name);
		free_person(fred);
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

struct Person* add_person(struct Team* team, char * name, Favorites favorites){
	struct Person* insert = malloc(sizeof(*insert));
	insert->name = _strdup(name);

	if(favorites.head != NULL){
		insert->favorites = favorites;
		connect_favs(insert->favorites,team);
	}

	if(team->head==NULL){		
		team->head = add_node(insert);
		team->tail = team->head;
	}
	else{
		team->tail->next = add_node(insert);
		team->tail->next->prev = team->tail;
		team->tail = team->tail->next;	

	}

	return insert;
}

struct Person* detach_person(struct Team* team, char* name){
	struct Person* person = find_person(team,name);
	struct PersonNode* p = team->head;
	struct PersonNode* q;
	struct Person* fred;
	
	if(p == NULL){
		return NULL;
	}

	if(person == NULL){
		return NULL;
	}
	
	while(p!=NULL){	
		if(strcmp(p->value->name,name)==0){
			if(p->prev == NULL && p->next == NULL){
				fred = p->value;
				team->head = NULL;
				team->tail = NULL;
				q = p;
				p = p->next;
				free(q);
				return fred;
			}
			else if(p->prev == NULL){
				fred = p->value;
				team->head = p->next;
				team->head->prev = NULL;
				q =p;
				p = p->next;
				free(q);
				return fred;
			}
			else if(p->next == NULL){
				fred = p->value;
				team->tail = p->prev;
				team->tail->next = NULL;
				q = p;
				p = p->next;
				free(q);
				return fred;
			}

			else{
				fred = p->value;
				p->prev->next = p->next;
				p->next->prev = p->prev;
				free(p);
				return fred;
			}
		}
		p = p->next;
	}
	return NULL;
}

void free_person(struct Person* person){
	struct PersonNode* p = person->favorites.head;
	struct PersonNode* q;

	while(p!=NULL){
		q = p;
		p = p->next;
		free(q);
	}
	
	free(p);
	free(person->name);
	free(person);
}



void fprint_team(struct Team* team, FILE* stream){
	fprintf(stream,"%s\n",team->name);

	if(team->head==NULL){
		fprintf(stream,"- leader:  (none)\n");
		fprintf(stream,"- members: (none)\n");
		return;
	}
	
	struct Person* leader = pick_leader(team);
	if(team->head->next == NULL){
		fprintf(stream,"- leader:  (none)\n");
		fprintf(stream,"- members: %s (favorite: (none))\n",team->head->value->name);
		return;
	}
	
	struct PersonNode* t = team->head;
	char* fav = t->value->favorites.head->value->name;
	int len = 0;
	int max_len = (max_length(team)-strlen(t->value->name))+1;

	if(leader == NULL){
		fprintf(stream,"-leader:  (none)\n");
	}
	else{
		fprintf(stream,"-leader:  %s\n",leader->name);
	}

	fprintf(stream,"- members: %s%*s(favorite: %s)\n",t->value->name,max_len," ",fav);
	t = t->next;
	while(t!=NULL){
		fav = t->value->favorites.head->value->name;
		len = strlen(t->value->name)+11;
		max_len = (max_length(team)-strlen(t->value->name))+1;
		fprintf(stream,"%*s%*s(favorite: %s)\n",len,t->value->name,max_len," ",fav);
		t = t->next;
	}
	return;
}

int max_length(struct Team* team){
	int max_len = strlen(team->head->value->name);
	struct PersonNode* p = team->head->next;

	while(p!=NULL){
		if(strlen(p->value->name)>max_len){
			max_len = strlen(p->value->name);
		}
		p = p->next;
	}
	return max_len;
}

char* _strdup(char* s){
	return strcpy(malloc(sizeof(*s)*(strlen(s)+1)),s);
}

//add node to linked list
struct PersonNode* add_node(struct Person* person){
	struct PersonNode* insert = malloc(sizeof(*insert));
	insert->value = person;
	insert->prev = NULL;
	insert->next = NULL;
	return insert;
}

void add_favorite(struct Person* fan,struct Person* fav,int rank){
	struct PersonNode* p = fan->favorites.head;
	struct PersonNode* insert;
	int i=0;
	if(rank==0){
		fan->favorites.head->prev = add_node(fav);
		fan->favorites.head->prev->next = fan->favorites.head;
		fan->favorites.head = fan->favorites.head->prev;
	}
	else if(rank==-1){
		fan->favorites.tail->next = add_node(fav);
		fan->favorites.tail->next->prev = fan->favorites.tail;
		fan->favorites.tail = fan->favorites.tail->next;
	}
	else if(rank>0){
		for(i=rank;i>0;i--){
			p = p->next;
		}
		if(p!=NULL){
			insert = add_node(fav);
			insert->prev = p->prev;
			insert->next = p;
			p->prev->next = insert;
			p->prev = insert;
		}
	}
	else if(rank<0){
		for(i=rank;i<-1;i++){
			p = p->next;
		}
		if(p!=NULL){
			insert = add_node(fav);
			insert->next = p->next;
			insert->prev = p;
			p->next = insert;
			p->next->prev = insert;
		}
	}
}

Favorites create_favorites(struct Person* one,...){
	Favorites insert;
	va_list args;
	va_start(args, one);
	struct Person* temp;

	temp = one;
	insert.head = add_node(temp);
	insert.tail = insert.head;

	temp = va_arg(args,struct Person*);

	while(temp!=NULL){
		insert.tail->next = add_node(temp);
		insert.tail->next->prev = insert.tail;
		insert.tail = insert.tail->next;
		temp = va_arg(args,struct Person*);
	}
	va_end(args);
	return(insert);
}

struct Person* pick_leader(struct Team* team){
	return NULL;
	/*
	//create copy of the team
	struct Team copy = copy_team(team);
	struct Person* leader = NULL;
	int inf = 0;
	
	
	struct PersonNode* p = copy.head;
	int total_votes = 0;
	int min_votes = 0;
	while(p!=NULL){
		if(p->value->favorites.head!=NULL){
			total_votes++;
			min_votes++;
		}
		else{
			detach_person(&copy,p->value->name);
		}
		p = p->next;
	}

	
	while(copy.head!=NULL && inf<100){
		if(copy.head == NULL){
			return NULL;
		}
		
		//find total_votes and detach null voters
		struct PersonNode* p = copy.head;
		int total_votes = 0;
		int min_votes = 0;
		while(p!=NULL){
			if(p->value->favorites.head!=NULL){
				total_votes++;
				min_votes++;
			}
			else{
				detach_person(&copy,p->value->name);
			}
			p = p->next;
		}

		leader = if_leader(&copy,min_votes,total_votes);
		struct Person* loser = find_loser(&copy,min_votes,total_votes);
		if(leader!=NULL){
			struct Person final = *leader; 
			free_team(&copy);
			struct Person* king = find_person(team,final.name);
			return king;
		}
		else{
			p = copy.head;
			while(p!=NULL){
				p->value->favorites = detach_fav(p,loser);
				p = p->next;
			}
		}
		inf++;
	}
	return NULL;
	*/
}

Favorites detach_fav(struct PersonNode* position,struct Person* loser){
	Favorites favs = position->value->favorites;
	struct PersonNode* p = position->value->favorites.head;
	struct PersonNode* q;
	if(loser == NULL){
		return favs;
	}
	while(p!=NULL){
		if (strcmp(p->value->name,loser->name)==0){					
			if(p->prev == NULL && p->next == NULL){
				favs.head = NULL;
				favs.tail = NULL;
				q = p;
				p = p->next;
				free(q);
			}
			else if(p->prev == NULL){
				favs.head = p->next;
				favs.head->prev = NULL;
				q =p;
				p = p->next;
				free(q);
			}
			else if(p->next == NULL){
				favs.tail = p->prev;
				favs.tail->next = NULL;
				q = p;
				p = p->next;
				free(q);
			}
			else{
				q = p;
				q->prev->next = q->next;
				q->next->prev = q->prev;
				p = p->next;
				free(q);
			}
		}
		else{
			p = p->next;
		}
	}
	return position->value->favorites;
}

struct Person* if_leader(struct Team* team, int min_votes,int total_votes){
	//see if there is a person above 50%	
	int temp_votes;
	struct PersonNode* p = team->head;
	struct PersonNode* q = p;
	struct Person* leader = NULL;
	while(p!=NULL){
		while(q!=NULL){
			if(strcmp(p->value->name,q->value->favorites.head->value->name)==0){
				temp_votes++;
			}	
			q = q->next;
		}
		if (temp_votes>(total_votes/2)){
			leader = p->value;
		}
		p = p->next;
	}
	return leader;
}

struct Person* find_loser(struct Team* team,int min_votes,int total_votes){
	//find who needs to be eliminated 
	int temp_votes;
	struct PersonNode* p = team->head;
	struct PersonNode* q = p;
	struct Person* victim = NULL;

	while(p!=NULL){
		while(q!=NULL){
			if(strcmp(p->value->name,q->value->favorites.head->value->name)==0){
				temp_votes++;
			}	
			q = q->next;
		}
		if (temp_votes<min_votes){
			min_votes = temp_votes;
			victim = p->value;
		}
		p = p->next;
	}
	return victim;
}
