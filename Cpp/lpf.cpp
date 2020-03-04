#include <iostream>
using namespace std;
/*finds the largest prime factor of a given number*/
int findPrimefactors(int a){
int nums[a];
int largest=0;
for(int j=0; j<=a; j++){nums[j]=j;}
for(int k=0; k<=a; k++){
for(int p=0; p<=nums[k]; p++){
if((nums[k]%p==0)&&(nums[k]>largest)){
largest=nums[k];
}}}
return largest;}
int main(){
int a;
cout<<"What number: "<<endl;
cin>>a;
cout<<findPrimefactors(a)<<endl;
return 0;
}
