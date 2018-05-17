/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdlib.h>
#include <stdio.h>
#include "team.h"

struct Team create_team(int population, char* names[], int* favorites){
	struct Person A;
	int len;
	struct Team Squad;
	Squad.favIndexes = favorites;
	Squad.population = population;
	Squad.people = malloc(sizeof(struct Person)*population);
	int i,j;
	for (i=0;i<population;i++){
		for (len=0;names[i][len]!='\0';len++){}
		len = len+1;
		A.name = malloc(sizeof(char)*len);
		for(j=0;j<len;j++){
			A.name[j]=names[i][j]; 
		}
		A.favorite = &A;
		Squad.people[i] = A;
	}
	for (i=0;i<population;i++){
		Squad.people[i].favorite = &Squad.people[favorites[i]]; 
	}
	return Squad;
}

void free_team(struct Team* team){
	int i;
	for (i=0;i<team->population;i++){
		free(team->people[i].name);
	}
	free((team->people));
}

struct Person* pick_leader(struct Team* team){
	char** leaders;
	int i,len,j;
	leaders = malloc(team->population * sizeof(char*));
	for (i=0; i < team->population; i++){
		for (len=0;team->people[i].favorite->name[len] !='\0';len++){}
		len+=1;
		leaders[i] = malloc(sizeof(char)*len);
		for (j=0;j<len;j++){
			leaders[i][j] = team->people[i].favorite->name[j];
		}
	}
	
	int streak=0;
	int greatest=0;
	int final=0;
	for (i=0;i<(team->population);i++){
		streak = 0;
		for (j=i+1;j<(team->population);j++){
			if (team->favIndexes[i] == team->favIndexes[j]){
				streak+=1;
				if (streak==greatest && team->favIndexes[i]<final){
					final = team->favIndexes[i];
				}
				else if (streak>greatest){
					greatest = streak;
					final = team->favIndexes[i];
				}
			}
		}
	}
	

	for (i=0;i<team->population;i++){
		free(leaders[i]);	
	}
	free(leaders);
	return &(team->people[final]);
}


