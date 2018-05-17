/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include <stdlib.h>
#include "team.h"

int main(int argc, char *argv[]){
	char* names[] = {"Kushol", "Harsha", "Pratik", "Sam","Aadharsh"};
	int favorites[] = {3,4,0,2,2};
	struct Team team = create_team(5,names,favorites);
	for(int x = 0; x<5;x++){
		printf("%s %s %d\n",team.people[x].name,(*(team.people[x].favorite)).name, team.favIndexes[x]);
	}

	struct Person * leader = pick_leader(&team);
	
	printf("The most popular is %s. The rest are losers.\n", leader->name);
	free_team(&team);
	return EXIT_SUCCESS;


}
