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
	
	fprint_team(&lol,stdout);


	printf("The tail is %s\n", lol.tail->value->name);	
	printf("The head is  %s\n", lol.head->value->name);

	printf("The second  is %s\n", lol.head->next->value->name);
	printf("The first favorite is the fourth %s\n",lol.head->value->favorite->name);
	struct Team new = create_team("lol",0,NULL);
	detach_person(&lol,"one");
	fprint_team(&lol,stdout);
	free_team(&lol);
	return EXIT_SUCCESS;


}
