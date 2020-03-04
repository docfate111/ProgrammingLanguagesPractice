#include <iostream>
#include <string>
#include <cstring>
using namespace std;
string encrypt(string a, unsigned int key){
char b[a.length()];
for(int i=0; i<a.length(); i++){
b[i]=((a[i]+key-97)%26)+97;
}
string ciphertext=b;
return ciphertext;
}
string decrypt(string a, unsigned int key){
char b[a.length()];
for(int i=0; i<a.length(); i++){
b[i]=((a[i]+26-key-97)%26)+97;}
string ciphertext=b;
return ciphertext;
}
int main(){
int choice;
int unsigned key;
string a;
while(1){
cout<<"Enter 1 for encryption, 2 for decryption, Ctrl+C to escape "<<endl;
cin>>choice;
if(choice==1){
cout<<"Message to encrypt: "<<endl;
cin>>a;
cout<<"Key to shift by: "<<endl;
cin>>key;
cout<<"The encrypted message is: "<<encrypt(a, key)<<endl;
}
else if(choice==2){
cout<<"Message to decrypt: "<<endl;
cin>>a;
cout<<"Key to shift by: "<<endl;
cin>>key;
cout<<"The decrypted message is: "<<decrypt(a, key)<<endl;
}
else{
cout<<"Choose an option!!!"<<endl;
break;
}
}
return 0;
}
