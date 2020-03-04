#include <stdio.h>
//inline function
static inline int MAX(int a, int b){return a>b?a:b;}
static inline int SUM(int a, int b){return a+b;}
int main(){
	int a; int b;
	printf("Enter a number: \n");
	scanf("%d", &a);
	printf("Enter another one: \n");
	scanf("%d", &b);
	printf("The max is %d\n", MAX(a, b));
	printf("The sum is %d\n", SUM(a, b));
	return 0;
}
