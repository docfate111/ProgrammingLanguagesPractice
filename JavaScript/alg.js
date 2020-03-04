//var random=require('random');
//var i=randomIntInc(1, 16);
function linearSearch(a){
	var b=1;
	while(b!=a){
		b++;
	}
	return "The number is: "+b;
}
function bisectionSearch(min, max, actualNum){
	var possibles=[];
	for(var i=min; i<=max; i++){
		possibles+=i;
	}
	var guess=(min+max)/2;
	while(guess!=actualNum){
		if(guess>actualNum){
			max=guess-1;
		}
		else if(guess==actualNum){
			return "The number is: "+guess;
		}
		else{
			min=guess+1;
	}
}
}
console.log(bisectionSearch(1, 16, 7));
