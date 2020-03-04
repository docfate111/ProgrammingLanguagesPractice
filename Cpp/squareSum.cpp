#include <iostream>
using namespace std;
/*The sum of the squares of the first ten natural number is 1^2+2^2+...10^2=385
The square of the sum of the first ten natural numbers is: (1+2+..10)^2=3025
The difference between these numbers is 2640 */
int sumOfsquares(int a){
int sum=0;
for(int i=0; i<=a; i++){
sum+=i*i;
}
return sum;}
int sumSquared(int a){
int sum=0;
for(int i=0; i<=a; i++){
sum+=i;
}
return sum*sum;
}
int main(){
int a=0;
cout<<"What number: "<<endl;
cin>>a;
cout<<"The difference is: "<<sumSquared(a)-sumOfsquares(a)<<endl;
return 0;
}

