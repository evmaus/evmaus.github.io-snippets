#include <string.h>
#include <sys/mman.h>

// Hex pulled from the assembled "asm-function.s"
char code[] = "\x55\x89\xe5\x53\xb8\x04\x00\x00\x00\xbb\x01\x00\x00\x00\x8b\x4d\x08\x8b\x55\x0c\xcd\x80\x5b\x5d\xc3";

// Message to print out
char msg[] = "Hello Reader!\n";

int main(){
    void * buf;

    // mmap a executable memory block and copy code into it.
    buf = mmap(0, sizeof(code), PROT_EXEC | PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
    memcpy(buf, (void*) code, sizeof(code));
    
    ((void (*) (char*, int))buf)(msg, sizeof(msg));

    return 0;
}