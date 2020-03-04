/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   binarysearch.c
 * Author: thwilliams
 *
 * Created on December 3, 2019, 9:36 AM
 */

#include <stdio.h>
#include <stdlib.h>
#define FALSE 0
#define TRUE 1
#define LEN(x) sizeof(x)/sizeof(x[0]) 
int log(int a){
    if(a==1){
        return 0;
    }
    //log base 2
    return 1+log(a/2);
}
int binarySearch(int arr[], int len, int searchingFor){
    int count=0;
    int start=0;
    int end=len-1;
    int ave;
    while(count<log(len)+1){
        ave=(start+end)/2;
        printf("searching: %d-%d average is %d\n", start, end, ave);
        if(searchingFor==arr[ave]){
            return TRUE;
        }
        if(arr[ave]>searchingFor){
            end=ave;
        }else{
            start=ave;
            end=len-1;
        }
        count++;
    }
    return FALSE;
}
int main(){
    int A[]={0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    if(binarySearch(A, LEN(A), 7)){
        printf("Found!\n");
    }else{
        printf("Not found\n");
    }
    return 0;
}

