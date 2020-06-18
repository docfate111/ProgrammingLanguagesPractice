src: src.o
	     ld -o src src.o
src.o: src.s
	     as -o src.o src.s
echo: echo.o
	ld -o echo echo.o
echo.o:
	as -o echo.o echo.s
clean:
	rm *.o src
debug:
	as -g -o src.o src.s
	ld -o src src.o
	gdb src
