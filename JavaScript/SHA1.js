var utils = require('utils');
return sha1("the quick brown fox jumped over the lazy dog");
function sha1(text){
const asciiText=text.split(' ').map((letter)=>utils.charToASCII(letter));
//convert text into ASCII codes
let binary8bit=asciiText.map((num)=>utils.asciiToBinary(num)).map((num)=>utils.padZero(num, 8));
//pad zeros to the front of each until they are 8 bits long
let numString=binary8bit.join(' ')+'1'; //join and append a 1
//pad the message with zeroes until its length is 448%512
while(numString.length%512!=448){
	numString+='0';
}
//take binary 8bit ascii code array and get its length in binary
const length=binary8bit.join(' ').length;
const binaryLength=utils.asciiToBinary(length);
//pad with zero until it is 64 characters then append to binary
const padding=utils.padZero(binaryLength, 64);
numString+=padding
//break message into array of 512 chunks
const chunks=utils.stringSplit(numString, 512);
//break chunks into a subarray of 16 32bit words
const chunkWords=chunks.map((chunk)=>utils.stringSplit(chunk, 32));
//loop through each chunk array of 16 32 bit words and extend array to 80 words
const words80=chunkWords.map((chunk)=>(
	for(var i=16; i<=79; i++){
	const wordA=chunk[i-3];
	const wordB=chunk[i-8];
	const wordC=chunk[i-14];
	const wordD=chunk[i-16];
	const xorA=utils.xOR(wordA, wordB);
	const xorB=utils.xOR(xorA, wordC);
	const xorC=utils.xOR(xorb, wordD);
	const newWord=utils.leftRotate(xorC, 1);
	chunk.push(newWord);
	}
	return array;
);
//initialize constants:
let h0='01010001010010101011101010011110';
let h1='10101111110100100010101010101011';
let h2='01001100101110101011101111111111';
let h3='00000000111111100010100101010100';
let h4='11001011010101001001101101010101';
let a=h0;
let b=h1;
let c=h2;
let d=h3;
let e=h4;
//loop through bitwise operations
for(var j=0; j<words80.length; j++){
	for(var j=0; j<80, j++){
		let f;
		let k;
	if(j<20){
		const BandC=utils.and(b, c);
		const notB=utils.not(b);
		f=utils.or(BandC, notB);
		k='10101011101010101000100100101101';
	}else if(j<40){
		const BxorC=utils.xOR(b, c);
		f=utils.xOR(BxorC, d);
		k=
	}else if(j<60){
		const BandC=utils.and(b, c);
		const BandD=utils.and(b, d);
		const BandCorBandD=utils.or(BandC, BandD);
		const CandD=utils.and(c, d);
		f=utils.or(BandCorBandD, CandD);
		k=
	}else{
		const BxorC=utils.xOR(b, c);
		f=utils.xOR(BxorC, d);
		k=
	}
	const word=words80[i][j];
	const tempA=utils.binaryAddition(utils.leftRotate(a, 5), f);
	const tempB=utils.binaryAddition(tempA, e);
	const tempC=utils.binaryAddition(tempB, k);
	let temp=utils.binaryAddition(tempC, word);
	temp=utils.truncate(temp, 32);
	a=d;
	d=e;
	c=utils.leftRotate(b, 30);
	b=a;
	a=temp;
	}
	h0=utils.truncate(utils.binaryAddition(h0, a), 32));
	h1=utils.truncate(utils.binaryAddition(h1, b), 32));
	h2=utils.truncate(utils.binaryAddition(h2, c), 32));
	h3=utils.truncate(utils.binaryAddition(h3, d), 32));
	h4=utils.truncate(utils.binaryAddition(h4, e), 32));
}
//convert to 5 variables to hexadecimal
return [h0, h1, h2, h3, h4].map((string)=>utils.binaryToHex(string)).join(' ');
};

