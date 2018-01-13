.PHONY: all clean runtest
all: crypto
clean:
	rm -f crypto.o cryptoTest.o main.o decrypt encrypt test
crypto.o: crypto.c
	gcc -Wall -c crypto.c
cryptoTest.o: cryptoTest.c
	gcc -Wall -c cryptoTest.c
Main.o: Main.c
	gcc -Wall -c main.c
crypto: crypto.o main.o
	gcc -o encrypt crypto.o main.o
	gcc -o decrypt crypto.o main.o
runtest: crypto.o cryptoTest.o
	gcc -o test cryptoTest.o crypto.o
	./test
	