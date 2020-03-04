#include <iostream>
#include <string>
#include <cstring>
using namespace std;
string shiftcipher(string input, int shiftby){ //using string library
for(int  i=0; i<input.length(); i++){
input[i]=tolower(input[i]);
}
string alphabet="abcdefghijklmnopqrstuvwxyz";
string ciphertext="";
for(int i=0; i<input.length(); i++){
ciphertext+=alphabet.at(alphabet.find(input.at((i+shiftby)%26)));
}
return ciphertext;
}
string shift(string input, int key){
string letters;
for(int i=0; i<input.length(); i++){
letters[i]=(60+((input[i]+key)%26));
}
return letters;
}
int main(){
string a;
int b, c;
cout<<"Message to encrypt:"<<endl;
cin>>a;
cout<<"Shift cipher"<<"what number to shift by?";
cin>>c;
cout<<"Encrypted message: "+shiftcipher(a, c)<<endl;
cout<<shift(a, c)<<endl;
return 0;
}
