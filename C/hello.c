#include <stdio.h>
void main(){
printf("Ilove C");
int a, b;
char name[12];
    printf("hello world");
    printf("\t\nwe are here");
printf("Enter your name:\n ");
scanf("%s", &name);
printf("Whats your number? ");
scanf("%d", &a);
if(name=="hi"){
printf("Please senter a real name");
}
else if(name=="thelford"){
printf("you are awesome!");
}
else{
printf("idfc");
}
switch(a){
case 1:
	printf("a is 1");
	break;
case 2:
	printf("a is 2");
	break;
case 3:
	printf("a is 3");
	break;
default:
	printf("the value of a is unknown");
}
printf("Hello %s", name);
}

