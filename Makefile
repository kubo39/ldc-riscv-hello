.PHONY: all clean

LDC = ~/dev-ldc/build-ldc/bin/ldc2
DFLAGS = --mtriple=riscv64-unknown-none-elf -mattr=+m,+a,+c -mcpu=generic-rv64 --gcc=./gcc/bin/riscv64-unknown-elf-gcc -Xcc=-march=rv64imac -Xcc=-mabi=lp64 -g -betterC

all:
	$(LDC) $(DFLAGS) hello.d

clean:
	$(RM) *.o hello
