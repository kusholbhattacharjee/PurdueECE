/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */   
#include<stdlib.h> 
#include<stdbool.h> 
#include<string.h> 
#include<stdarg.h>
#include "awesum.h"

struct PersonNode* create_node(struct Person* value); 
int size_list(struct PersonNode* head); 
void _connect_all_favorites(Favorites favorites, struct Team* team);

struct Team create_team(char* name, int population, struct Person* people)
{
	int i; 
	int a = 0; 
	
	struct Team newTeam;
	struct PersonNode* curr; 
	Favorites tempFavs = {.head = NULL, .tail = NULL}; 

	newTeam.name = strdup_(name); 

	newTeam.head = NULL; 
	newTeam.tail = newTeam.head;

	for(i = 0; i < population; i++)
		add_person(&newTeam, (people + i) -> name, tempFavs);  

	curr = newTeam.head; 

	while(curr != NULL)
	{
		curr -> value -> favorites = people[a].favorites; 
		_connect_all_favorites(curr -> value -> favorites, &newTeam); 
		curr = curr -> next; 
		a++; 
	}

		
	return(newTeam); 
}

void _connect_all_favorites(Favorites favorites, struct Team* team)
{ 
	struct PersonNode* curr = favorites.head; 
	while(curr!= NULL)
	{ 
		curr -> value = find_person(team, curr -> value -> name); 
		curr = curr -> next; 
	}
}

struct Person* add_person(struct Team* team, char* name, Favorites favorites)
{ 
	struct Person* newPerson = malloc(sizeof(*newPerson));
	newPerson -> name = strdup_(name);

	if(favorites.head != NULL)
	{
		newPerson -> favorites = favorites; 
		_connect_all_favorites(newPerson -> favorites, team);
	}

	if(team -> head == NULL)
	{
		team -> head = create_node(newPerson);
		team -> tail = team -> head; 
	}
	else
	{ 
		team -> tail -> next = create_node(newPerson); 
		team -> tail -> next -> previous = team -> tail; 
		team -> tail = team -> tail -> next; 
	}

	return(newPerson); 
}

struct Person* find_person(struct Team* team, char* name) 
{ 
	struct PersonNode* curr = team -> head; 

	while(curr != NULL)
	{ 
		if(strcmp(curr -> value -> name, name) == 0)
			return(curr -> value); 

		curr = curr -> next; 
	}

	return(NULL); 
}

		
struct Person* pick_leader(struct Team* team)
{ 

	return(NULL); 
}

struct Team copy_team(struct Team* team)
{ 
	struct Team copyTeam; 
	struct PersonNode* curr; 
	struct PersonNode* curr2;
	struct Person* copyFav;
	struct PersonNode* favIndex; 
	struct PersonNode* favIndexCopy;
	
	Favorites tempFavs = {.head = NULL, .tail = NULL}; 
	copyTeam.name = strdup_(team -> name); 

	copyTeam.head = NULL; 
	copyTeam.tail = copyTeam.head; 
	
	curr = team -> head; 
	while(curr != NULL)
	{ 
		add_person(&copyTeam, curr -> value -> name, tempFavs); 
		curr = curr -> next; 
	}


	curr = copyTeam.head; 
	curr2 = team -> head; 

	while(curr != NULL)
	{
		copyFav = find_person(&copyTeam, curr2 -> value -> favorites.head -> value -> name); 
		if(copyFav != NULL)
		{
			curr -> value -> favorites.head = create_node(copyFav); 
			curr -> value -> favorites.tail = curr -> value -> favorites.head; 
		}		
		favIndex = curr2 -> value -> favorites.head -> next; 
		favIndexCopy = curr -> value -> favorites.tail;
		
		while(favIndex != NULL)
		{ 
			copyFav = find_person(&copyTeam, favIndex -> value -> name); 
			if(copyFav != NULL)
			{
				favIndexCopy -> next = create_node(copyFav); 
				favIndexCopy -> next -> previous = favIndexCopy;
			}

			favIndexCopy = favIndexCopy -> next; 
			favIndex = favIndex -> next; 
		}

		curr = curr -> next; 
		curr2 = curr2 -> next; 
	}
	

	return(copyTeam); 
}

void add_favorite(struct Person* fan, struct Person* fave, int rank)
{ 
	struct PersonNode* index = fan -> favorites.head;
	struct PersonNode* newNode; 
	int i; 

	if(rank == 0) 
	{ 
		fan -> favorites.head -> previous = create_node(fave); 
		fan -> favorites.head -> previous -> next = fan -> favorites.head; 
		fan -> favorites.head = fan -> favorites.head -> previous; 
	}
	else if(rank == -1)
	{ 
		fan -> favorites.tail -> next = create_node(fave); 
		fan -> favorites.tail -> next -> previous = fan -> favorites.tail; 
		fan -> favorites.tail = fan -> favorites.tail -> next; 
	}
	else if(rank > 0)
	{ 

		for(i = rank; i > 0; i--)
			index = index -> next;

		if(index != NULL)
		{
			newNode = create_node(fave); 
			newNode -> previous = index -> previous; 
			newNode -> next = index; 
			index -> previous -> next = newNode; 
			index -> previous = newNode; 
		}
	}
	else if(rank < 0)
	{ 
		for(i = rank; i < -1; i++)
			index = index -> next; 

		if(index != NULL)
		{ 
			newNode = create_node(fave); 
			newNode -> next = index -> next; 
			newNode -> previous = index; 
			index -> next = newNode; 
			index -> next -> previous = newNode; 
		}
	}
		
}

Favorites create_favorites(struct Person* first_choice, ...)
{
	Favorites newFavorites; 
	va_list favs; 
	va_start(favs, first_choice); 
	struct Person* tempPerson; //Address of the parameters
	
	//Starts list off by creating head of list and setting tail equal to head
	tempPerson = first_choice; 
	newFavorites.head = create_node(tempPerson); 
	newFavorites.tail = newFavorites.head; 

	tempPerson = va_arg(favs, struct Person*); //Changes adress to next person in parameter list 

	while(tempPerson != NULL)
	{
		newFavorites.tail -> next = create_node(tempPerson); 
		newFavorites.tail -> next -> previous = newFavorites.tail; 
		newFavorites.tail = newFavorites.tail -> next; 
		tempPerson = va_arg(favs, struct Person*); 
	}

	va_end(favs); 

	return(newFavorites); 
}

void free_person(struct Person* person)
{ 
	struct PersonNode* curr = person -> favorites.head; 
	struct PersonNode* lastFav; 

	while(curr != NULL)
	{ 
		lastFav = curr; 
		curr = curr -> next; 
		free(lastFav); 
	}
	free(curr); 
	free(person -> name); 
	free(person); 


}

struct Person* detach_person(struct Team* team, char* name)
{ 
	struct Person* oldMember;  
	struct PersonNode* curr = team -> head; 
	struct PersonNode* oldCurr; 

	while(curr != NULL)
	{ 
		if(strcmp(curr -> value -> name, name) == 0)
		{ 
			if(curr -> previous == NULL && curr -> next == NULL)
			{ 
				oldMember = curr -> value; 
				team -> head = NULL; 
				team -> tail = team -> head; 
				oldCurr = curr; 
				curr = curr -> next; 
				free(oldCurr); 
				return(oldMember); 
			}

			else if(curr -> previous == NULL)
			{ 
				oldMember = curr -> value; 
				team -> head = curr -> next; 
				team -> head -> previous = NULL; 
				oldCurr = curr; 
				curr = curr -> next; 
				free(oldCurr); 
				return(oldMember); 
			}

			else if(curr -> next == NULL) 
			{ 
				oldMember = curr -> value; 
				team -> tail = curr -> previous;
				team -> tail -> next = NULL;
				oldCurr = curr; 
				curr = curr -> next; 
				free(oldCurr); 
				return(oldMember); 
			}

			else
			{ 
				oldMember = curr -> value; 
				curr -> previous -> next = curr -> next; 
				curr -> next -> previous = curr -> previous; 
				free(curr); 
				return(oldMember); 
			}
		}
	
		curr = curr -> next; 
	}


	return(NULL); 
}

void free_team(struct Team* team)
{
	struct PersonNode* curr = team -> head; 
	struct PersonNode* oldCurr; 

	while(curr != NULL)
	{
		oldCurr = curr; 
		curr = curr -> next; 
		struct Person* nextPers = detach_person(team, oldCurr -> value -> name); 
		free_person(nextPers);
	}

	free(team -> name); 
}


int size_list(struct PersonNode* head)
{
	int size = 0; 
	
	while(head != NULL)
	{ 
		size++; 
		head = head -> next; 
	}

	return(size);
}

//Function created by me to create a new PersonNode unlinked to the current list
struct PersonNode* create_node(struct Person* value)
{ 
	struct PersonNode* newNode = malloc(sizeof(*newNode)); 

	newNode -> next = NULL; 
	newNode -> value = value; 
	newNode -> previous = NULL;

	return(newNode); 
}

char* strdup_(char* s)
{ 
	return strcpy(malloc(sizeof(char) * (strlen(s) + 1)), s); 
}
