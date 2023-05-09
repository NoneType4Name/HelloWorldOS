#include <iostream>
#include <direct.h>
char b[1024];
int main(){
    _chdir("../");
    std::system("nasm -f bin boot.asm -o boot.bin && qemu-system-x86_64 boot.bin -boot c");
    return 0;
}