#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define c 30
void permute(int a);
char s[c];
int forbidden[c];
int count=0;
int isIn(int arr[], int n, int l);
int main(){
    for(int i=0; i<strlen(s); i++){
        permute(i);
    }
    return 0;
}
int isIn(int arr[], int n, int l){
    for(int i=0; i<l; i++){
        if(arr[i]==n){
            return 1;
        }
    }
    return 0;
}
void permute(int a){
    forbidden[count++]=a;
    if(!isIn(forbidden, a, 30)){
        printf("%c", s[a]);
        if(a+1<strlen(s)){
            permute(a+1);
        }
        if(a>=1){
            permute(a);
        }
    }
}