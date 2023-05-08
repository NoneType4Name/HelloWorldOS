#include <iostream>
#include <direct.h>
char b[1024];
int main(){
    _chdir("../");
    // std::cou << _getcwd(b, sizeof(b));
    std::system("nasm -f bin boot.asm -o boot.bin && qemu-system-x86_64 boot.bin");
    return 0;
}