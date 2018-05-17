/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */   
#include<stdio.h>
#include "awesum.h"
#include <string.h>

int longest_name(struct Team* team)
{ 
	int sizeLongest = strlen(team -> head -> value -> name); 
	struct PersonNode* curr = team -> head -> next; 

	while(curr != NULL)
	{ 
		if(strlen(curr -> value -> name) > sizeLongest)
			sizeLongest = strlen(curr -> value -> name); 

		curr = curr -> next; 
	}

	return(sizeLongest); 
}

void fprint_team(struct Team* team, FILE* stream)
{
	fprintf(stream, "%s\n", team -> name); 

	//If passed an empty team
	if(team -> head == NULL)
	{ 
		fprintf(stream, "- leader:  (none)\n"); 
		fprintf(stream, "- members: (none)\n"); 
	}
	else
	{

		struct Person* leader = pick_leader(team); 
		//If passed a team with one member
		if(team -> head -> next == NULL)
		{ 
			fprintf(stream, "- leader:  (none)\n");  
			fprintf(stream, "- members: %s (favorite: (none))\n",team -> head -> value -> name); 
		}
		else
		{
			struct PersonNode* curr = team -> head;  
			char* favName = curr -> value -> favorites.head -> value -> name;  
			int space;
			int spaceBetween = (longest_name(team) - strlen(curr -> value -> name)) + 1;  

			if(leader == NULL)
				fprintf(stream, "- leader:  (none)\n"); 
			else
				fprintf(stream, "- leader:  %s\n", leader -> name);

			fprintf(stream, "- members: %s%*s(favorite: %s)\n", curr -> value -> name, spaceBetween," ", favName); 
			curr = curr -> next; 

			while(curr != NULL)
			{ 
				favName = curr -> value -> favorites.head -> value -> name; 
				space = strlen(curr -> value -> name) + 11; 
				spaceBetween = (longest_name(team) - strlen(curr -> value -> name) + 1); 
				fprintf(stream, "%*s%*s(favorite: %s)\n", space, curr -> value -> name,spaceBetween, " ",  favName); 
				curr = curr -> next; 
			}
		}
	}
}

struct Team create_test_team()
{ 
	struct Person people[] = { 
		{.name = "Stephanie", .favorites = create_favorites(&people[1], &people[0], NULL)}, 
		{.name = "Isaac", .favorites = create_favorites(&people[0], NULL)}
	};


	return create_team("Grey Keys", sizeof(people)/sizeof(*people), people); 
}

int main(int argc, char* argv[])
{
	//Testing NULL case
	struct Team team1 = create_team("Nobody", 0, NULL); 
	fprint_team(&team1, stdout); 
	free_team(&team1); 

	//Testing only one person in team
	fprintf(stdout, "\n"); 
	struct Person person1 = {.name = "Titan", .favorites = {NULL}}; 
	struct Team team2 = create_team("One Man Band", 1, &person1);  
	fprint_team(&team2, stdout); 
	fprintf(stdout, "\n"); 
	struct Team team2copy = copy_team(&team2);
	fprint_team(&team2copy,stdout);
	free_team(&team2); 

	//Creating members of using create_test_team() and checking favorites	
	struct Team team3 = create_test_team(); 
	struct PersonNode* curr = team3.head -> value -> favorites.head; 
	fprint_team(&team3, stdout); 

	fprintf(stdout, "\nFavorites of member 1:\n"); 
	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}
	
	//Adding person to the end of team 3
	struct Person* newPerson = add_person(&team3, "Charlotte", \
							create_favorites(team3.head -> value, team3.tail -> value, NULL)); 
		
	fprintf(stdout, "\nName of added person: %s\n", team3.tail -> value -> name); 
	
	//Printing the favorites of the added person
	curr = newPerson -> favorites.head; 
	fprintf(stdout, "Favorites of added person:\n"); 

	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}

	//Adding favorite to the beginning of the second to last members favorites
	add_favorite(team3.tail -> previous -> value, team3.tail -> value, 0); 
	fprintf(stdout, "\nNew list of favorites for member 2:\n"); 
	
	curr = team3.tail -> previous -> value -> favorites.head; 
	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}

	//Adding favorite to head -> next for second to last member
	add_favorite(team3.tail -> previous -> value, team3.tail -> previous -> value, 1); 
	fprintf(stdout, "\nNew list of favorites for member 2:\n");

	curr = team3.tail -> previous -> value -> favorites.head; 
	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}

	//Adding favorite to the head -> next -> next space for second to last member
	add_favorite(team3.tail-> previous -> value, team3.tail -> value, 2);
	curr = team3.tail -> previous -> value -> favorites.head; 
	fprintf(stdout, "\nNew list of favorites for member 2:\n");
	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}

	//Adding favorite to the tail of favorites for first member 
	add_favorite(team3.head -> value, team3.tail -> value, -1); 
	
	curr = team3.head  -> value -> favorites.head; 
	fprintf(stdout, "\nNew list of favorites for member 1:\n"); 
	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}
	//Adding favorite to the second to last favorite for first member
	add_favorite(team3.head -> value, team3.tail -> previous -> value, -2); 

	curr = team3.head  -> value -> favorites.head; 
	fprintf(stdout, "\nNew list of favorites for member 1:\n"); 
	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}
	
	//Copy and print team 3
	fprintf(stdout, "\nCopy of team 3:\n"); 
	struct Team teamCopy = copy_team(&team3);
	fprint_team(&teamCopy, stdout); 

	curr = teamCopy.head  -> value -> favorites.head; 
	fprintf(stdout, "\nFavorites of first person on copy of team:\n"); 
	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}
	free_team(&team3); 
	free_team(&teamCopy);

	return(0); 
}
