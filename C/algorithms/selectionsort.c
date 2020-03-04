/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   insertionsort.c
 * Author: thwilliams
 *
 * Created on December 2, 2019, 4:42 PM
 */

#include <stdio.h>
#include <stdlib.h>
#define LEN(x) sizeof(x)/sizeof(x[0]) 
//O(n^2) complexity best and worse case
int findMin(int nums[], int len){
    int min=100;
    for(int i=0; i<len; i++){
        if(nums[i]<min){
            min=nums[i];
        }
    }
    return min;
}
int* remov(int min, int nums[], int len){
    int pos;
    int i;
    for(i=0; i<len; i++){
        if(nums[i]==min){
            pos=i;
            break;
        }
    }
    for(i=pos; i<len-1; i++){
        nums[i]=nums[i+1];
    }
    return nums;
}
int* selectionSort(int nums[], int len){
    int ans[len];
    int index=0;
    int min;
    while(index<len){
        min=findMin(nums, len-index);
        ans[index]=min;
        nums=remov(min, nums, len-index);
        index++;
        printf("%d ", min);
    }
    printf("\n");
    return ans;
}
/*int main(){
    int A[]= {10, 3, 7, 8, 2, 4, 5, 6, 1, 9};
    int* b=selectionSort(A, LEN(A));
   for(int i=0; i<LEN(A); i++){
        printf("%d ", b[i]);
    }
    return 0;
}*/

