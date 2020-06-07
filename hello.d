extern (C):

// We cannot use core.stdc.stdio.printf because druntime
// doesn't support RISC-V.
int printf(scope const char* format, scope const ...);

int main()
{
    printf("Hello, World!\n");
    return 0;
}
