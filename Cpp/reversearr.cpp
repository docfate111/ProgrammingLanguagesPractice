#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    int a=0;
cout<<"How many numbers in the array? "<<endl;
    cin>>a;
    int b[a+1];
    for(int i=0; i<a; i++){
	cout<<"enter numbers: "<<endl;
        cin>>a;
        b[i]=a;
    }
    for(int i=0; i<a; i++){
        cout<<b[a-i-1];
    }
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
    return 0;
}

