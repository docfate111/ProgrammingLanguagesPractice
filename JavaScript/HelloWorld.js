/*This is a comment this file is to learn syntax
To use js in html type </script type="text/javascript"><![CDATA[
//js code here]]></script>*/
//single line comment: if else statement
//variable declaration
var a=4;
b=5;
//defining functions
function cubeme(incoming){
	if (incoming==1){
		return "What are you doing?"
	}else{
		return Math.pow(incoming, 3)
	}
}
/*document.write() and alert() only work in browser in cmd use console.log() instead
typing "use strict"; before code enables strict mode: in strict mode assignment needs keyword var
prevents variable defined in eval function from being used
also prevents assigning same variable multiple values:*/
eval("var testVar=2;");
var o={
	testVar:1,
	testVar:2
};
//6 data types:numbers(can be int, float, or even hex), strings, booleans, null, undefined, objects
//is not a number function return true b/c 4 is a number
isNaN("4");
//document.write("Hello world!");
//MATH object:
//document.write(Math.PI);
/*var c=MATH.random();
var k=MATH.abs(-5);
var exp=MATH.exp(x, y);
var r=MATH.round(7.89); //rounds to nearest int8*/
//\b: backspace, \t: tab, \n: newline, \v: vertical tab, \f: form feed, \r: carriage return, \\: literal backlash
var hi="hello\n"+"world";
//String methods
console.log("this is a string".length);
console.log(hi.length);
console.log(hi.substr(3)); //index starts at zero, returns everything beginning with third character l
console.log(hi.substr(3, 9)); //includes eigth character but not the ninth
console.log(hi.slice(3));
console.log(hi.slice(4, 5)); //same as substr except when dealing with negative values
var words=hi.concat("is a string")
hi.toUpperCase();
hi.toLowerCase();
//null represents nothing and evaluates to false, not the same as being empty
//undefined: var doesnt contain a value yet
//objects:
var myObj={};
var myObject = {
	"identifier":"1",
	"name":"Tom Strong"
};
alert(myObject.name);
var hero={};
hero["Doctor Fate"]=new Object;
hero["Orion"]=new Object;
//Arrays:
var unity=new Array();
unity[0]="livewire";
unity[1]="ninjak";
var doomPatrol=["negative woman", "elastigirl", "robotman"];
var outsiders=new Array("metamorpho", "katana", "halo");
//variables:
var zeta, beam, blaster;
var name="Mr. Terrific", team="JSA", best_writer="Geoff Johns";
var changingThisVariable=3;
changingThisVariable="lmao changed";
//variable scope: global if defined outside function, if defined in function only can be called inside the function
//Date object:
var now=new Date();
console.log(now.toLocaleDateString());
//for loop
for(var i=0; i<10; i++){
	console.log(i);
}
//regular expressions:syntax used to match and manipulate strings ^$
//conversion:
var myNum=100;
var myString=String(myNum);
var myStr=String(60);
var myBool=Boolean(4); //0 false else is true
//in operator:
var dude={
name:"jack", 
last_name:"bo"
};
"name" in dude //true, remember quotes
//instanceof operator
var m=new Date();
m instanceof Date; //true
//unary operators:
var b=+"43";
var e=-"42"; //converts string to int
++b; //returns before incrementing
var a=new Object;
a.name="star";
delete(a.name);
typeof b;
typeof(b);
//to get input:
var inputNum=prompt("Guess a number!");
//switch 
switch(lang){
	case "english":
		alert(lang);
	case "spanish":
		alert("hola!");
	default:
		alert("english!");
}
while(1>0){
	alert("Pop-ups forever);
}
var count=3;
do{
	++count;
}while(count<43);
for (var member in unity){
	alert(member);
}
//input from website form:
var name=document.forms[0].nametext.value;
//function parameter
function myFunction(par1, par2){
	var l=arguments.length;
	document.write(argument[0]);
	alert(argument[1]);
}






































