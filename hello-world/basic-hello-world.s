# Declare the 'main' function for the linker.
.global main

# Declare the local variables--a 'Hello Reader' string,
# and the length of that string.
.data
HelloMsg:
    .ascii "Hello Reader!\n"  
.set len, .-HelloMsg

.text
main:
    #Print Hello Msg
    movl $0x4, %eax # Syscall Id for "Write"
    movl $0x1, %ebx # File Descriptor for stdout
    movl $HelloMsg, %ecx # Address of "HelloMsg"
    movl $len, %edx # Length of "HelloMsg"
    int $0x80
    
    #Exit the program.
    mov $0x1, %eax # Syscall id for Exit
    mov $0x0, %ebx # Exit code = 0
    int $0x80
    