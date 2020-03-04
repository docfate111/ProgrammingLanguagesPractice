#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(){
	FILE *fp;
	//int open(const char* pathname, int flags);
	//int creat(const char* pathname, mode_t mode);
	//int close(int fd);
	//if returns -1 method failed else it worked
	//flags: O_RDONLY, O_WRONLY, O_RDWR, O_CREAT
	int file=open("hello.c", O_RDONLY);
	char* mem=(char *)malloc(10);
	if(file!=-1){
		int count=read(file, mem, 10);
		close(file);
		for(int i=0; i<10; i++){
			putchar(mem[i]);
		}
		free(mem);
	}else{
		printf("Error");
		free(mem);
	}
	return 0;
}
