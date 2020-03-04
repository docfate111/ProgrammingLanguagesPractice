#include <stdio.h>
union IntorDouble{
	int i;
	float x;
};
int main(){
	union IntorDouble id;
	id.i=10;
	printf("Double: %d \nFloat: %f\n", id.i, id.x);
	id.x=3.1415;
	//overwrites id.i
	printf("Double: %d \nFloat: %f", id.i, id.x);
	return 0;
}

