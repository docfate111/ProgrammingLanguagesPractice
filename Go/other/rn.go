package main

import (
	"fmt"
	"flag"
	"os"
	"io/ioutil"
	//"path/filepath"
	)
//command-line utility to rename files!
func main(){
	var isDir bool;
	flag.BoolVar(&isDir, "d", false, "Set true if file is a directory");
	flag.Parse();
	flags:=flag.Args();
	if len(flags)<2{
		fmt.Println("Usage rn [file] [new name]");
		os.Exit(1);
	}
	source:=flags[0];
	dest:=flags[1];
	//read file
	if isDir{
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
	}else{
		errmf := os.Rename(source, dest);
		if errmf!=nil{
			fmt.Println("Error renaming dir!");
		}
	}
}


