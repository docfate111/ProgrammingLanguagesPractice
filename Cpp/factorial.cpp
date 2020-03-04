#include <iostream>
using namespace std;
int factorial(int a){
return a*factorial(a-1);
}
int main(){
int num;
cout<<"Factorial of: "<<endl;
cin>>num;
cout<<"The factorial of "<<num<<" is: "<<factorial(num)<<endl;
return 0;
}

