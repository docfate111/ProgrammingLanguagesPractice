#include <iostream>
using namespace std;
double convertToC(double a){
return (a-32)*.5556;
}
double convertToF(double a){
return ((9.0/5.0)*a)+32;
}
int main(){
int choice;
double temp;
cout<<"Temperature: F to C(1)or C to F(2)?"<<endl;
cin>>choice;
if(choice==1){
cout<<"What temperature in F to convert: "<<endl;
cin>>temp;
cout<<convertToC(temp)<<endl;
}else{
cout<<"What temperature in C to convert: "<<endl;
cin>>temp;
cout<<convertToF(temp)<<endl;
return 0;
}
}

