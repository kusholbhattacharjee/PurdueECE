/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include <stdlib.h>
#include "team.h"

struct Team create_test_team(){
	struct Person people[]={
		{.name="one", .favorite=&people[4]},
		{.name="two" ,.favorite=&people[3]},
		{.name="three" ,.favorite=&people[1]},
		{.name="four",.favorite=&people[3]},
		{.name = "five",.favorite=&people[0]},
	};
	return create_team("Awesome",5,people);
}

int main(int argc, char *argv[]){
	
	struct Team lol = create_test_team();
	//leader = add_Person(t,names[1],names[3]);
	
	struct Team empty = create_team("sd",0,NULL);
	fprint_team(&empty,stdout);

	fprint_team(&lol,stdout);
	struct Team haha = copy_team(&lol);
	printf("The tail is %s\n", lol.tail->value->name);	
	printf("The head is  %s\n", lol.head->value->name);
	fprint_team(&haha,stdout);
	printf("The second  is %s\n", lol.head->next->value->name);
	printf("The first favorite is the fourth %s\n",lol.head->value->favorite->name);
	
	detach_person(&lol,"one");
	detach_person(&lol,"one"

	/*
	struct Person *guy = detach_person(&lol,"one");
	fprint_team(&lol,stdout);
	add_person(&lol,"Bob","two");
	struct Person *dude = detach_person(&lol,"awe");
	fprint_team(&lol,stdout);
	free(dude);
	free(guy);
	*/
	free_team(&haha);
	free_team(&lol);
	return EXIT_SUCCESS;


}
