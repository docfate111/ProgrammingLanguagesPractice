#include <iostream>
using namespace std;
int fib(int n, string special="normal"){
int prev=0;
int curr=1;
int sum=1;
int evenSum=0;
int oddSum=0;
long unsigned int counter=0;
while(counter<n){
if(special=="even"){
	if(sum%2==0){
	evenSum+=sum;
}
}
if(special=="odd"){
	if(sum%2!=0){
	oddSum+=sum;
}}
prev=curr;
curr=sum;
sum+=prev;
counter++;
}
if(special=="even"){
return evenSum;}
else if(special=="odd"){
return oddSum;
}
else{
return sum;
}
}
 //n is the number of iterations/number of times
int main(){
string option;
cout<<"Even, odd, or normal?(answer in all lowercase)";
cin>>option;
long unsigned int p;
cout<<"How many iterations of the fibonacci sequence? "<<endl;
cin>>p;
cout<<fib(p, option)<<endl;
return 0;
}
