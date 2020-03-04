package main

import (
	"os"
	"fmt"
	"io/ioutil"
	)
//command-line utility to rename files!
func rn(flags []string){
	if len(flags)<2{
		fmt.Println("Usage rn [file] [new name]");
		os.Exit(1);
	}
	source:=flags[0];
	dest:=flags[1];
	//read file
	data, errr:=ioutil.ReadFile(source);
	if errr!=nil{
		fmt.Println("Error reading!");
		os.Exit(1);
	}
	//read write
	errw:=ioutil.WriteFile(dest, data, 0777);
	if errw!=nil{
		fmt.Println("Error writing!");
		os.Exit(1);
	}
	//remove old file
	errre:=os.Remove(source);
	if errre!=nil{
		fmt.Println("Error deleting file!");
		os.Exit(1);
	}
}

func cd(some []string){
	err:=os.Chdir(some[1]);
	if err!=nil{
		fmt.Println("Error changing directory");
	}
}

//to-do implement piping, history, python shell

