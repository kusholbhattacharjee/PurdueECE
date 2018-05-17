 /* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */
#include <stdio.h>
#include <stdlib.h>

char* my_strdup(const char* original) {
	char* d = malloc(sizeof(*original) * 5);
	for (int i = 0; i<5; i++) {
	    d[i] = original[i];
	}
	return d;
}

int main(int argc, char *argv[]) {
	char s[] = "abc\n";
	fputs(s, stdout);  // Should print "abc" followed by a newline ('\n')

	char* t = my_strdup(s);
	fputs(t, stdout);  // Should print "abc" followed by a newline ('\n')
	free(t);

	return EXIT_SUCCESS;
}
