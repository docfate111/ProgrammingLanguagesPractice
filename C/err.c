#include <stdio.h>
int main(){
	fprintf(stderr, "this is an error\n");
	perror("error");
	return 0;

}
