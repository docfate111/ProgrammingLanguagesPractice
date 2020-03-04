package main

import (
	"flag"
	"fmt"
	"math"
	"strconv"
	"strings"
)

func main() {
	var c string
	flag.StringVar(&c, "w", "word", "what to convert")
	var base int
	flag.IntVar(&base, "t", 10, "base to convert to")
	var convFrom int
	flag.IntVar(&convFrom, "f", 10, "base to convert from")
	var isASCII bool
	flag.BoolVar(&isASCII, "a", false, "if string given is ASCII")
	flag.Parse()
	if isASCII {
		for i := 0; i < len(c); i++ {
			fmt.Printf("%s ", toBaseB(int(c[i]), base))
		}
	} else {
		if isLetter(c) && convFrom != 16 && convFrom != 64 {
			//bytes not digits
			var n string
			var output string = ""
			for i := 0; i < len(c); i++ {
				n = toBaseB(int(c[i]), base)
				fmt.Print(n)
				s, err := strconv.Atoi(n)
				if (s > 31 && s < 127) && err == nil {
					output += string(s)
				}
			}
			fmt.Println()
			fmt.Print(output)
		} else {
			n := baseAtoBaseB(convFrom, base, c)
			fmt.Println(n)
			s, err := strconv.Atoi(n)
			if (s > 31 && s < 127) && err == nil {
				fmt.Println(string(s))
			}
		}
	}
}

func baseAtoBaseB(from int, to int, SinA string) string {
	return toBaseB(toBase10(SinA, from), to)
}

func toBase10(S string, B int) int {
	if S == "" {
		return 0
	}
	var lastDigit int
	if B == 16 {
		var base16 string = "0123456789abcdef"
		lastDigit = strings.Index(base16, string(S[len(S)-1]))
	} else if B == 64 {
		var base64 string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
		lastDigit = strings.Index(base64, string(S[len(S)-1]))
	} else {
		var err error
		lastDigit, err = strconv.Atoi(string(S[len(S)-1]))
		panic(err)
	}
	return toBase10(S[:len(S)-1], B)*B + lastDigit
}

//returns true if all letters
func isLetter(s string) bool {
	for _, r := range s {
		if (r < 'a' || r > 'z') && (r < 'A' || r > 'Z') {
			return false
		}
	}
	return true
}
func panic(e error) {
	if e != nil {
		fmt.Println("There is an error: ", e)
	}
}

func floorDiv(a int, b int) int {
	return int(math.Floor(float64(a) / float64(b)))
}

func toBaseB(N int, B int) string {
	if N == 0 {
		return ""
	}
	var lastDig string
	if B == 16 {
		var base16 string = "0123456789abcdef"
		lastDig = string(base16[N%B])
	} else if B == 64 {
		var base64 string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
		lastDig = string(base64[N%B])
	} else {
		lastDig = strconv.Itoa(N % B)
	}
	return toBaseB(floorDiv(N, B), B) + lastDig
}
