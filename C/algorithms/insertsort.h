/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   insertsort.h
 * Author: thwilliams
 *
 * Created on December 2, 2019, 9:01 PM
 */
#include <stdio.h>
#include <stdlib.h>
#define FALSE 0
#define TRUE 1
#define LEN(x) sizeof(x)/sizeof(x[0]) 
//O(n^2) for worst and average case
void swap(int *x, int *y) { 
    int temp = *x; 
    *x=*y; 
    *y=temp; 
} 
int* insertionSort(int nums[], int len){
    int curr=0;
    for(int i=0; i<len-1; i++){
        curr=i;
        while(nums[curr]>nums[curr+1]){
            swap(&nums[curr], &nums[curr+1]);
            curr--;
        }
    }
    return nums;
}
/*int main(){
    int A[]={10, 3, 7, 8, 2, 4, 5, 6, 1, 9};
    int* b=insertionSort(A, LEN(A));
    for(int i=0; i<LEN(A); i++){
        printf("%d ", b[i]);
    }
    return 0;
}*/


