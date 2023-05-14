#include <iostream>
#include <direct.h>
char b[1024];
int main(){
    _chdir("../");
    std::system("nasm -f bin Loader/boot.asm -o build/boot.bin && qemu-system-x86_64 build/boot.bin -boot c");
    return 0;
}