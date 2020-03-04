/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * File:   main.c
 * Author: thwilliams
 * Created on September 23, 2019, 3:36 PM
 */
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
int check();
int main(int argc, char** argv){
    init();
    printBoard();
    int computerMove;
    printf("You are x\n");
    player='x';
    printf("The computer is o\n");
    computer='o';
    while(1){
        printf("Enter a column: ");
        scanf("%d", &playerMove);
        if(!makeMove(playerMove, 'o')){
            break;
        }
        printBoard();
        if(check()){
            break;
        }
        while(!makeMove(aiMove('x'), 'x')){
            break;
        }
        if(check())
            break;
    }
    return (EXIT_SUCCESS);
}
int check(){
    if(winsFor(player)){
        printf("You win!\n");
        return 1;
    }
    if(winsFor(computer)){
        printf("Game over! Computer wins!\n");
        return 1;
    }
    return 0;
}
