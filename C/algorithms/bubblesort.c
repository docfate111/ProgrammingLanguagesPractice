#include <stdio.h>
#include <stdlib.h>
#define FALSE 0
#define TRUE 1
#define LEN(x) sizeof(x)/sizeof(x[0]) 
//O(n^2) for worst and average case
int isSorted(int nums[], int len){
    for(int i=0; i<len-1; i++){
        if(nums[i]>nums[i+1]){
            return FALSE;
        }
    }
    return TRUE;
}
void bubbleSort(int nums[], int len){
    int temp;
    while(!isSorted(nums, len)){
        for(int i=0; i<len-1; i++){
            if(nums[i]>nums[i+1]){
                temp=nums[i];
                nums[i]=nums[i+1];
                nums[i+1]=temp;
            }
        }
    }
}
/*int main(){
    int A[]= {10, 3, 7, 8, 2, 4, 5, 6, 1, 9};
    bubbleSort(A, LEN(A));
    for(int i=0; i<LEN(A); i++){
        printf("%d ", A[i]);
    }
    return 0;
}*/
