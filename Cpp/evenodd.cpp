#include <iostream>
using namespace std;
int main(){
int a;
do{
cout<<"Enter a number(0 to exit): "<<endl;
cin>>a;
if (a%2==0)
cout<<"That number is even"<<endl;
else if(a%2==1)
cout<<"That number is odd"<<endl;
}while(a!=0);
return a;
}
