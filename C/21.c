#include "cards.h"
d cards[52]; //creates deck of cards struct
void check(int d, int p);
int main(){
	init();
	int player=0; int dealer=0;
	char choice;
	while(1){
		puts("Your ");
		player=shuffle(cards, 2);
		puts("My ");
		dealer=shuffle(cards, 1);
		printf("Your score is: %d\n Hit(enter h) or stay(enter s):", player);
		scanf(" %c", &choice);
		if(choice=='h'){
			player+=shuffle(cards, 1);
		}else{
			dealer+=shuffle(cards, 1);
			printf("\nMy score is: %d", dealer);
		}
		check(dealer, player);
		printf("\nPlay again?(0 for no, 1 for yes)");
		scanf(" %c", &choice);
		if(choice!='1'){
			return 0;
		}
	}
}
void check(int d, int p){
	if(d>21){
		printf("\nI bust");
	}else if(p>21){
		printf("\nYou bust");
	}else if(d>p){
		printf("\nI win. You lose.");
	}else if(21-d<21-p){
		printf("\nYou win. I lose.");
	}else{
		printf("\nTie.");
	}
}
