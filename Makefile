.PHONY: all clean

CC = $(PWD)/gcc/bin/riscv64-unknown-elf-gcc
LDC = ldc2

DFLAGS = --mtriple=riscv64-unknown-none-elf -mattr=+m,+a,+c -betterC -c
CFLAGS = -march=rv64imac -mabi=lp64

OBJ = hello.o
TARGET = hello

all:
	$(LDC) $(DFLAGS) -of=$(OBJ) hello.d
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ)

clean:
	$(RM) *.o hello
