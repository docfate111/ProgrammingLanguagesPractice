#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
//ssize_t read(int fd, void* buf, size_t count);
//count bytes from file into fd into memory pointed by buf
//calling again will sequentially read through the file
//" write(")
//writes "
int main(){
	char* mem=(char*)malloc(12);
	int file=open("hello.c", O_RDWR);
	int count=write(file, mem, 12);
	puts(mem);
	count=read(file, mem, 12);
	close(file);
	puts(mem);
	free(mem);
	return 0;
}
