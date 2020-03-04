#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct deck{
	char type[10];
	char used;
	int value;
}d;
d cards[52];
void init();
void shuffle(d* thisDeck, int howMany);
int main(){
	init();
	shuffle(cards, 2);
	return 0;
}
void init(){//create deck of cards
	for(int x=0; x<=3; x++){//each x is suite of cards
		for(int y=0; y<13; y++){//each y is a value
			switch(x){
				case 0:strcpy(cards[y].type, "Diamonds");
					cards[y].value=y;
					cards[y].used='n';
					break;
				case 1:strcpy(cards[y].type, "Diamonds");
                                        cards[y].value=y;
                                        cards[y].used='n';
					break;
				case 2:strcpy(cards[y].type, "Diamonds");
                                        cards[y].value=y;
                                        cards[y].used='n';
					break;
				case 3:strcpy(cards[y].type, "Diamonds");
                                        cards[y].value=y;
                                        cards[y].used='n';
					break;
			}}}
}
void shuffle(d *thisDeck, int howMany){
		int r;
		int count=0;
		printf("\nYour %d cards are: \n\n", howMany);
		while(count<howMany){
			r=rand()%51;
			if(thisDeck[r].used=='n'){
				switch(thisDeck[r].value){
					case 12:printf("Ace of %s\n", thisDeck[r].type);
						break;
					case 11:printf("King of %s\n", thisDeck[r].type);
						break;
					case 10:printf("Queen of %s\n", thisDeck[r].type);
						break;
					case 9:printf("Jack of %s\n", thisDeck[r].type);
						break;
					default:printf("%d of %s",thisDeck[r].value+2, thisDeck[r].type);
						break;
				}
				thisDeck[r].used='y'; count++;
			}}}
