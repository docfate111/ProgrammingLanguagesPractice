#include <iostream>
using namespace std;
int sumOfmultiples(int below){
unsigned int sum=0;
for(int i=0; i<below; i++){
if((i%3==0)||(i%5==0)){
sum+=i;
}
}
return sum;
}
int main(){
int num;
cout<<"Sum of natural numbers below: ";
cin>>num;
cout<<"The sum is: "<<endl;
cout<<sumOfmultiples(num)<<endl;
return 0;
}
