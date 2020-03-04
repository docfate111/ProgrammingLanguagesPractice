#include <iostream>
using namespace std;
/*The following iterative sequence is defined for the set of positive integers: n->n/2(n is even) 
n->3*n+1 is odd 
Using these rules and starting with 13 we get the following sequence: 13, 40, 20, 10, 5, 16, 8, 4, 2, 1
It can be seen that this sequence contains 10 terms. All starting numbers end at 1. Which starting number produces the longest chain*/
int collatz(int a){
long unsigned int counter=0;
long unsigned int max=0;
int b=a;
for(int i=0; i<b; i++){
while(a!=1){
if(a%2==0){
a=a/2;
counter++;
}
else{
a=3*a-1;
counter++;
}
}
if(counter>max){
max=counter;
}
}
return max;
}
int main(){
int num;
cout<<"Enter a number: "<<endl;
cin>>num;
cout<<collatz(num);
}
