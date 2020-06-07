.PHONY: all clean

LDC = $(PWD)/build-ldc/bin/ldc2
DFLAGS = --mtriple=riscv64-unknown-none-elf -mcpu=generic-rv64 -mabi=lp64 -mattr=+m,+a,+c --gcc=./gcc/bin/riscv64-unknown-elf-gcc -Xcc=-march=rv64imac -Xcc=-mabi=lp64 -g -betterC

all:
	$(LDC) $(DFLAGS) hello.d

clean:
	$(RM) *.o
