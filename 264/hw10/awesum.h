/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */   

typedef struct 
{ 
	struct PersonNode* head; 
	struct PersonNode* tail; 
} Favorites; 

struct Person
{ 
	char* name; 
	Favorites favorites; 
};

struct Team
{
 	char* name; 
	struct PersonNode* head; 
	struct PersonNode* tail; 
}; 

struct PersonNode
{ 
	struct Person* value; 
	struct PersonNode* next; 
	struct PersonNode* previous; 
}; 


struct Team create_team(char* name, int population, struct Person* people); 
struct Person* add_person(struct Team* team, char* name, Favorites favorites); 
Favorites create_favorites(struct Person* first_choice, ...); 
char*  strdup_(char* s); 
struct Team copy_team(struct Team* team); 
void   free_team(struct Team* team);
void   free_person(struct Person* person); 
struct Person* detach_person(struct Team* team, char* name); 
void   add_favorite(struct Person* fan, struct Person* fave, int rank); 
struct Person* find_person(struct Team* team, char* name); 
struct Person* pick_leader(struct Team* team);
