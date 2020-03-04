#include <iostream>
#include <fstream>
using namespace std;
int main(){
string line;
ofstream myfile;
myfile.open("cexample.txt");
myfile<<"C++ is way better than C!";
myfile.close();
return 0;
}

