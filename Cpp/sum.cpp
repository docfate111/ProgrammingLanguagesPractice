#include <iostream>
using namespace std;
int main(){
    int a;
    int sum=0;
cout<<"Enter three numbers: "<<endl;
    for(int i=0; i<3; i++){
	cin>>a;
        sum+=a;
    }
    cout<<sum<<endl;
    return 0;
}
