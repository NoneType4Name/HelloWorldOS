#include <iostream>
int main(){
    std::system("nasm -f bin boot.asm -o boot.bin && qemu-system-x86_64 boot.bin");
    return 0;
}