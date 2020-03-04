#include <stdio.h>
#include <ctype.h>
#include <string.h>
//enum alphabet{A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z};
int letterCount[26]; //corresponds to letter in alphabet
char* alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
int isAnagram(char* a, char* b);
int isAnagram(char* a, char* b){
    for(int i=0; i<26; i++){
        letterCount[i]=0;
    }
    int has1=0;
    for(int h=0; h<strlen(a); h++){
        for(int i=0; i<26; i++){
            if(toupper(a[h])==alphabet[i]){
                letterCount[i]+=1;
                has1=1;
            }
        }
    }
    for(int h=0; h<strlen(b); h++){
        for(int i=0; i<26; i++){
            if(toupper(b[h])==alphabet[i]){
                letterCount[i]-=1;
            }
        }
    }
    int sum=0;
    for(int i=0; i<26; i++){
        if(letterCount[i]==0){
            sum++;
        }
    }
    return sum==26 && has1;
}