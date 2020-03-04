/* 
 * File:   board.h
 * Author: thwilliams
 * Created on September 23, 2019, 4:32 PM
 */
#define HEIGHT 6
#define WIDTH 7
 /* x 0      1     2       3      4      5      6
0  [0, 0] [1, 0] [2, 0] [3, 0] [4, 0] [5, 0] [6, 0] 
1  [0, 1] [1, 1] [2, 1] [3, 1] [4, 1] [5, 1] [6, 1] 
2  [0, 2] [1, 2] [2, 2] [3, 2] [4, 2] [5, 2] [6, 2] 
3  [0, 3] [1, 3] [2, 3] [3, 3] [4, 3] [5, 3] [6, 3] 
4  [0, 4] [1, 4] [2, 4] [3, 4] [4, 4] [5, 4] [6, 4] 
5  [0, 5] [1, 5] [2, 5] [3, 5] [4, 5] [5, 5] [6, 5] 
y*/
char board[WIDTH][HEIGHT];
int playerMove;
char player, computer;
void init(){
    for(int i=0; i<HEIGHT; i++){
        for(int j=0; j<WIDTH; j++){
            board[j][i]='_';
        }
    }
}    
void printBoard(){
    for(int i=0; i<HEIGHT; i++){
        for(int j=0; j<WIDTH; j++){
            printf("%c ", board[j][i]);
        }
        printf("\n");
    }
    for(int i=0; i<WIDTH; i++){
        printf("%d ", i);
    }
    printf("\n");
}
int makeMove(int col, char c){
    if(board[col][0]!='_'){
        printf("Invalid move: that column is full. \n");
        return 0;
    }
    for(int a=HEIGHT-1; a>-1; a--){
        if((board[col][a]=='_') &&(board[col][a-1])=='_'){
            board[col][a]=c;
            return 1;
        }
    }
    printf("Move invalid\n");
    return 0;
}
void removeMove(int col){
    int i=0;
    while(board[col][i]=='_'){
        i++;
    }
    board[col][i]='_';
}
int isFull(){
    int count=0;
    for(int i=0; i<WIDTH; i++){
        if(board[i][0]!='_'){
            count++;
        }
    }
    return count==WIDTH;
}
int hori(char ch, int r_start, int c_start, int N){
    for(int i=0; i<N; i++){
        if(board[r_start+i][c_start]!=ch){
            return 0;
        }
    }
    return 1;
}
int vert(char ch, int r_start, int c_start, int N){
    for(int i=0; i<N; i++){
        if(board[r_start][c_start+i]!=ch){
            return 0;
    }
    }
    return 1;
}
int horizontalW(char c, int N){
    for(int row=0; row<4; row++){
        for(int col=0; col<6; col++){
            if(hori(c, row, col, N)){
                return 1;
            }
        }
    }
    return 0;
}
int verticalW(char c, int N){
    for(int row=0; row<7; row++){
        for(int col=0; col<4; col++){
            if(vert(c, row, col, N)){
                return 1;
            }
        }
    } 
    return 0;
}
int dig(char ch, int r_start, int c_start, int N){
    for(int i=0; i<N; i++){
        if(board[r_start-i][c_start-i]!=ch){
            return 0;
    }
    }
    return 1;
}
int dig2(char ch, int r_start, int c_start, int N){
    for(int i=0; i<N; i++){
        if(board[r_start+i][c_start-i]!=ch){      
            return 0;
        }
    }
    return 1;
}
int diagW(char ch, int N){
    for(int i=0; i<7; i++){
        for(int j=5; j>2; j--){
          if(dig2(ch, i, j, N)){
              return 1;
          }  
          if(dig(ch, i, j, N)){
              return 1;
          }
        }
    }
    return 0;
}
int winsFor(char ch){
                if(verticalW(ch, 4)){
                    return 1;
                }
                if(horizontalW(ch, 4)){
                    return 1;
                }
                if(diagW(ch, 4)){
                    return 1;
                } 
    return 0;
}
int inArow(char ch, int N){
    if(verticalW(ch, N)){
                    return 1;
                }
                if(horizontalW(ch, N)){
                    return 1;
                }
                if(diagW(ch, N)){
                    return 1;
                } 
    return 0;
}
int maxindexOf(int a[7]){
    int max=-1000;
    int optimalMove=0;
    for(int i=0; i<7; i++){
        if(max>a[i]){
            max=a[i];
            optimalMove=i;
        }
    }
    return optimalMove;
}
int aiMove(char ch){
    int moveValues[7]={0, 0, 0, 0, 0, 0, 0};
    for(int i=0; i<7; i++){
        makeMove(i, player);
        for(int k=3; k<5; k++){
        if(inArow(playerMove, k)){
            moveValues[i]-=2*k;
        }
        }
        printBoard();
        printf("%d", moveValues[i]);
        removeMove(i);
        printBoard();
    }
    return maxindexOf(moveValues);
}
