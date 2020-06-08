# ldc riscv hello

1. Get gcc.

```console
$ mkdir -p gcc
$ curl -L https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.1.0-2018.12.0-x86_64-linux-ubuntu14.tar.gz | tar --strip-components=1 -C gcc -xz
```

2. Get LDC with patch and build.

```console
% git clone --recurse-submodules -b m64 --depth=1 https://github.com/kinke/ldc
$ mkdir build-ldc && cd $_
$ cmake -G Ninja ../ldc \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PWD/../install-ldc
$ ninja -j$(nproc)
$ cd ..
```

3. Compile.

```console
$ ./build-ldc/bin/ldc2 --mtriple=riscv64-unknown-none-elf -mcpu=generic-rv64 \
  -mattr=+m,+a,+c --gcc=./gcc/bin/riscv64-unknown-elf-gcc \
  -Xcc=-march=rv64imac -Xcc=-mabi=lp64 -g -betterC hello.d
```

4 Get spike and pk and build

- spike: https://github.com/riscv/riscv-isa-sim
- pk: https://github.com/riscv/riscv-pk

5 .Run!

```console
$ spike pk hello
bbl loaded
Hello, World!
```
