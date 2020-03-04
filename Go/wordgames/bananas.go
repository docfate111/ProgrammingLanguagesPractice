package main

import (
	"fmt"
	"io/ioutil"
	"math"
	"strings"
)

func main() {
	file, err := ioutil.ReadFile("dict.txt")
	check(err)
	var fileName string = string(file)
	var sA []string = strings.Split(fileName, "\n")
	//generate powerset of letters
	for i, word := range sA {
		sA[i] = clean(word)
	}
	var a string
	var possWords []string = make([]string, 500)
	fmt.Println("Enter 14 letters: ")
	//generates all valid Scrabble words
	fmt.Scanf("%s", &a)
	a = strings.ToUpper(clean(a))
	for true {
		fmt.Println("Ctrl+C to exit")
		fmt.Println("Generating valid words...")
		l := powerSet(a)
		var count int = 0
		for _, word := range l {
			if stringinSlice(word, sA) {
				fmt.Println(count, " : ", word)
				possWords[count] = word
				count++
			}
		}
		fmt.Print("Enter number of word to use: ")
		var choice int
		fmt.Scanf("%d", &choice)
		fmt.Println("You chose ", choice, possWords[int(choice)])
		a = removeLetters(possWords[int(choice)], a)
		fmt.Println("Remaining letters ", a)
		fmt.Println("Enter new letters: ")
		var input string
		fmt.Scanf("%s", &input)
		input = strings.ToUpper(clean(input))
		a += input
	}
}

func removeLetters(to string, from string) string {
	var output string = ""
	//tally number of characters
	letterFreq := make(map[string]int)
	for _, k := range from {
		letterFreq[string(k)]++
	}
	for _, k := range from {
		if letterisIn(string(k), to) {
			letterFreq[string(k)]--
		}
	}
	for i, j := range letterFreq {
		for j > 0 {
			output += i
			j--
		}
	}
	return output
}

func letterisIn(letter string, word string) bool {
	for _, k := range word {
		if letter == string(k) {
			return true
		}
	}
	return false
}

func clean(s string) string {
	var a string
	if string(s[len(s)-1]) == "\r" || string(s[len(s)-1]) == "\n" || string(s[len(s)-1]) == " " {
		a = s[0 : len(s)-1]
	} else {
		a = s
	}
	return a
}

func powerSet(set string) []string {
	var a float64 = math.Pow(2.0, float64(len(set)))
	var i float64
	var s []string = make([]string, int(a))
	var count int = 0
	for i = 0.0; i < a; i++ {
		var substr string
		for j := 0; j < len(set); j++ {
			if uint8(i)&(1<<uint8(j)) > 0 {
				substr += string(set[int(j)])
			}
		}
		if len(substr) > 1 {
			s[count] = substr
			count++
		}
	}
	return s
}

func stringinSlice(str string, list []string) bool {
	for _, v := range list {
		if strings.Compare(v, str) == 0 {
			return true
		}
	}
	return false
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}
