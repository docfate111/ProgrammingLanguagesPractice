/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   mergesort.c
 * Author: thwilliams
 *
 * Created on December 2, 2019, 7:26 PM
 */

#include <stdio.h>
#include <stdlib.h>
#define FALSE 0
#define TRUE 1
#define LEN(x) sizeof(x)/sizeof(x[0]) 
void swap(int *x, int *y) { 
    int temp = *x; 
    *x=*y; 
    *y=temp; 
} 
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
 void merge(int A[ ], int start, int mid, int end){
}
int* mergeSort(int nums[], int len){  
        int L[len/2];
        int R[len/2];
        if(len<=1){
            return nums;
        }else if(len==2){
            if(nums[0]>nums[1]){
                swap(&nums[0], &nums[1]);
                return nums;
            }else{
                return nums;
            }
        }else{
            int half, otherhalf;
            if(len%2==1){
                half=(len/2);        
                otherhalf=(len/2);
            }else{
                half=len/2;
                otherhalf=half;
            }
            int ind=0;
            for(int i=0; i<half; i++){
                L[ind++]=nums[i];
                printf("%d ", L[ind-1]);
            }
            ind=0;
            printf("\n");
            for(int i=otherhalf; i<len; i++){
                R[ind++]=nums[i];
                printf("%d ", R[ind-1]);
            }
            printf("\n");
            mergeSort(L, half);
            mergeSort(R, otherhalf);
    }
}
/*int main(){
    int A[]={10, 3, 7, 8, 2, 4, 5, 6, 1, 9};
    int* b=mergeSort(A, LEN(A));
    for(int i=0; i<LEN(A); i++){
        printf("%d ", b[i]);
    }
    return 0;
}*/
