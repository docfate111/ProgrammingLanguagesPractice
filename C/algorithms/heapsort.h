/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   heapsort.h
 * Author: thwilliams
 *
 * Created on December 2, 2019, 4:14 PM
 */

/* 
 * File:   main.c
 * Author: thwilliams
 * Created on December 2, 2019, 9:30 AM
 */

#include "queue.h"
//best case: n log n 
//worst case: n
typedef struct Node{
    struct Node* left;
    struct Node* right;
    int n;
}node;
//level order
node* newNode(int a){
    node* nd=(node*)malloc(sizeof(node));
    nd->n=a;
    nd->left=NULL;
    nd->right=NULL;
    return nd;
}
/* Print nodes at a given level */
void printGivenLevel(node* root, int level) { 
    if(root == NULL) {
        return;
    }
    if(level == 1){
        printf("%d ", root->n); 
    }else if(level > 1){ 
        printGivenLevel(root->left, level-1); 
        printGivenLevel(root->right, level-1); 
    } 
} 
int height(node* c){ 
    if(c==NULL){
        return 0;   
    }else{ 
        /* compute the height of each subtree */
        int lheight = height(c->left); 
        int rheight = height(c->right); 
        /* use the larger one */
        if (lheight > rheight) 
            return(lheight+1); 
        else return(rheight+1); 
    } 
}
void printTree(node* root) { 
    int h = height(root); 
    int i; 
    for (i=1; i<=h; i++) 
        printGivenLevel(root, i); 
} 
//convert array of numbers to sort into a tree
node* arrToTree(int nums[], int len){
    int i=0;
    node* root=newNode(nums[i]);
    node* curr=root;
    i++;
    while(i<len && curr!=NULL){
        if(nums[i]<curr->n){
            if(curr->left==NULL){
                curr->left=newNode(nums[i]);
                i++;
            }else{
                curr=curr->left;
            }
        }else{
            if(curr->right==NULL){
                curr->right=newNode(nums[i]);
                i++;
            }else{
                curr=curr->right;
            }
        }
    }
    free(curr);
    return root;
}
//make the tree into a max heap so that the root is the largest
void max(node* curr){
    printf("%d \n", curr->n);
    if(curr->right==NULL && curr->left==NULL){
        return;
    }else if(curr->right==NULL){
        if(curr->n<curr->left->n){
            int temp=curr->left->n;
            curr->left->n=curr->n;
            curr->n=temp;
        }
        max(curr->left);
    }else if(curr->left==NULL){
         if(curr->n<curr->right->n){
            int temp=curr->right->n;
            curr->right->n=curr->n;
            curr->n=temp;
        }
        max(curr->right);
    }else{
        if(curr->n<curr->left->n){
            int temp=curr->left->n;
            curr->left->n=curr->n;
            curr->n=temp;
        }
        if(curr->n<curr->right->n){
            int temp=curr->right->n;
            curr->right->n=curr->n;
            curr->n=temp;
        }
        max(curr->left);
        max(curr->right);
    }
}
/*int main(){
    int arr[]={4, 10, 3, 5, 1};
    //int* ans=(int*)malloc(5);
    node* heap=arrToTree(arr, 5);
    max(heap);
    printTree(heap);
    free(heap);
    int arr2[]={4, 3, 7, 1, 8, 5};
    //int* ans=(int*)malloc(5);
    node* heap2=arrToTree(arr2, 6);
    max(heap2);
    printTree(heap2);
    free(heap2);
    return 0;
}*/