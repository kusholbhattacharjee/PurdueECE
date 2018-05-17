/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */   
#include<stdio.h>
#include "team.h"
#include <string.h>
/*
struct Team create_test_team()
{ 
	struct Person people[] = { 
		{.name = "Stephen Curry", .favorites = create_favorites(&people[1], &people[0], NULL)}, 
		{.name = "Lebron James", .favorites = create_favorites(&people[0], NULL)}
	};


	return create_team("NBA", sizeof(people)/sizeof(*people), people); 
}
*/

int main(int argc, char* argv[])
{
	//Testing NULL case
	struct Team team1 = create_team("NBA", 0, NULL); 
	fprint_team(&team1, stdout);  
	struct Team team1copy = copy_team(&team1);
	fprint_team(&team1copy,stdout);
	free_team(&team1copy);
	free_team(&team1);

	//Testing only one person in team and no favorites
	fprintf(stdout, "\n"); 
	struct Person person1 = {.name = "Kevin Durant", .favorites = {NULL}}; 
	struct Team team2 = create_team("NBA", 1, &person1);  
	fprint_team(&team2, stdout); 
	fprintf(stdout, "\n"); 	
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
	struct Person* newPerson = add_person(&team3, "James Harden", \
							create_favorites(team3.head -> value, team3.tail -> value, NULL)); 
	struct Person* newPe = add_person(&team3, "Dwayne Wade", \
							create_favorites(team3.head -> value, team3.tail -> value, NULL));	
	fprintf(stdout, "\nName of added person: %s\n", team3.tail -> value -> name); 
	struct Person* newP = add_person(&team3, "Dwight Howard", \
							create_favorites(team3.head -> value, team3.tail -> value, NULL));
	//Printing the favorites of the added person
	curr = newPerson -> favorites.head; 
	fprintf(stdout, "Favorites of added person:\n"); 

	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}

	//Adding favorite to the beginning of the second to last members favorites
	add_favorite(team3.tail -> prev -> value, team3.tail -> value, 0); 
	fprintf(stdout, "\nNew list of favorites for member 2:\n"); 
	
	curr = team3.tail -> prev -> value -> favorites.head; 
	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}

	//Adding favorite to head -> next for second to last member
	add_favorite(team3.tail -> prev -> value, team3.tail -> prev -> value, 1); 
	fprintf(stdout, "\nNew list of favorites for member 2:\n");

	curr = team3.tail -> prev -> value -> favorites.head; 
	while(curr != NULL)
	{ 
		fprintf(stdout, "- %s\n", curr -> value -> name); 
		curr = curr -> next; 
	}

	//Adding favorite to the head -> next -> next space for second to last member
	add_favorite(team3.tail-> prev -> value, team3.tail -> value, 2);
	curr = team3.tail -> prev -> value -> favorites.head; 
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
	add_favorite(team3.head -> value, team3.tail -> prev -> value, -2); 

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

	return EXIT_SUCCESS; 
}
