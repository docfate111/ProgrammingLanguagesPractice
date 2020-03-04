#include <stdio.h>
#include <stdlib.h>
int TossDice(int input);
void check(int x, int y);
int playerScore=0;
int computerScore=0;
int main(){
	int val;
	while(1){
		playerScore=0;
		computerScore=0;
		printf("Your roll is: \n");
		int a=TossDice(playerScore);
		printf("\nYou scored %d\n", a);
		printf("\n My roll is: \n");
		int b=TossDice(computerScore);
		printf("\nI scored %d\n", b);
		check(a, b);
		printf("\nEnter 0 to play again or 1 to escape: ");
		scanf(" %d", &val);
		if(val){return 0;}
	}
}
int TossDice(int input){
	for(int i=0; i<6; i++){
		int n=rand()%7;
		printf("%d ", n);
		input+=n;
	}
	return input;
}
void check(int x, int y){
	if(x>y){
			printf("\nLucky bastard. You win!\n");
        }else if(x==y){
			printf("\nTie.\n");
        }else{
			printf("\nHa! I win!\n");
        }
}

