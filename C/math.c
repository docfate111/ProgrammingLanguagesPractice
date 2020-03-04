#include <stdio.h>
#include <stdlib.h>
void hi();
int main(){
int count=0;
for(count=0; count<10; count++){
	printf("%d", count);
}
if(count>10){
	printf("bigger than 10");
}
else
{
	printf("less  than 10");
}
return 0;
}
void hi(){
	int x[12], i;
	for(i=0; i<10; i++){
		scanf("%d", x[i]);
}
}
