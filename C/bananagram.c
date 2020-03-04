#include <stdlib.h>
#include "anagram.h"
void wack(char* input);
void substring(char a[], char b[], int start, int end);
int main(){
    printf("Enter 12 letters: ");
    char set[12];
    fgets(set, 12, stdin);
    char buffer[2];
    substring(set, buffer, 0, 2);
    puts(buffer);
    /*int ind=0;
    for(int start=0; start<12; start++){
            for(int j=start; j<12; j++){
                combos[ind++]=set[j];
                if(strlen(combos)>1){
                    wack(combos);
                }
            }
            ind=0;
    }*/
    return 0;
}
void substring(char a[], char b[], int start, int end) {
    int j=0;
    for(int i=start; i<end; i++){
        if(i<strlen(b)){
            a[j++]=b[i];
        }
    }
}
void wack(char* input){
    FILE* file = fopen("dict.txt", "r"); /* should check the result */
    char line[12];
    while (fgets(line, sizeof(line), file)) {
        if(isAnagram(input, line)){
            puts(line);
        }
    }
    fclose(file);
}