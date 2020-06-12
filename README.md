# ldc riscv hello

1. Get gcc.

```console
$ mkdir -p gcc
$ curl -L https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz | tar --strip-components=1 -C gcc -xz
```

2. Compile.

```console
$ ldc2 --mtriple=riscv64-unknown-none-elf -mcpu=generic-rv64 \
  -mattr=+m,+a,+c -betterC -c hello.d
$ iscv64-unknown-elf-gcc -march=rv64imac -mabi=lp64 -o hello hello.o
```

3. Get spike and pk and build

- spike: https://github.com/riscv/riscv-isa-sim
- pk: https://github.com/riscv/riscv-pk

4. Run!

```console
$ spike pk hello
bbl loaded
Hello, World!
```
