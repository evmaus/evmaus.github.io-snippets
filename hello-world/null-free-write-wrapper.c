#include <string.h>
#include <sys/mman.h>

char code[] = "\xeb\x17\x31\xc0\xb0\x04\x31\xdb\xb3\x01\x59\x31\xd2\xb2\x12\xcd\x80\x31\xc0\xb0\x01\x31\xdb\xcd\x80\xe8\xe4\xff\xff\xff\x48\x65\x6c\x6c\x6f\x20\x53\x68\x65\x6c\x6c\x63\x6f\x64\x65\x72\x21\x0a";

int main(){
    void * buf;

    // mmap a executable memory block and copy code into it.
    buf = mmap(0, sizeof(code), PROT_EXEC | PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
    memcpy(buf, (void*) code, sizeof(code));
    
    ((void (*) (void))buf)();

    return -1;
}