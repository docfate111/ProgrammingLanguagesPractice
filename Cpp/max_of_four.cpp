#include <iostream>
#include <cstdio>
using namespace std;
/*
Add `int max_of_four(int a, int b, int c, int d)` here.
*/

int main() {
    int a, b, c, d;
    scanf("%d %d %d %d", &a, &b, &c, &d);
    int ans = max_of_four(a, b, c, d);
    printf("%d", ans);
    return 0;
}
int max_of_fours(int a, int b, int c, int d){
    int max=0; 
int[4] nums=[a, b, c, d];
    for(int i=0; i<sizeof(nums)/sizeof(nums[0]); i++){
    if(max>nums[i]){
        max=nums[i];
    }
        }
    return max;
}
