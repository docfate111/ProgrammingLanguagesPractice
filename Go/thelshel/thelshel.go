package main
import (
	"fmt"
	"strings"
	"bufio"
	"os"
	"os/exec"
	"strconv"
	)
func main(){
	var str []string;
	for{
		fmt.Printf("TSH>");
		str=read();
		if((string(str[0])=="quit") || (string(str[0])=="exit")){
			break;
		}
		eval(str);
	}
}
func read() []string{
	var output string;
	reader := bufio.NewReader(os.Stdin);
	output, _ = reader.ReadString('\n');
	return strings.Split(strings.TrimSuffix(output, "\n"), " ");
}
func help(){
	fmt.Println("ThelShel 1.0.0");
	fmt.Println("This is a shell:");
	fmt.Println("ls-list files");
	fmt.Println("cd [directory name]-change directory");
}
func eval(some []string){
	switch some[0]{
		case "help":
			help();
		case "cd":
			cd(some);
		case "rn":
			rn(some);
		case "chmod":
			a, _:=strconv.Atoi(some[1]);
			err:=os.Chmod(some[2], os.FileMode(a));
			if err!=nil{
				fmt.Println("Error changing file");
			}
		default:
			sh_eval(some);
	}
}
func sh_eval(some []string){
		cmd := exec.Command(some[0], some[1:]...);
		cmd.Stderr=os.Stderr;
		cmd.Stdout=os.Stdout;
		err:=cmd.Run();
		if(err!=nil){
			fmt.Fprintln(os.Stderr, err);
		}
}
