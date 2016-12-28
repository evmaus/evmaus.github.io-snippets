.text
write_call:
    # Start the function
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx # save ebx
    
    movl $0x4, %eax # Syscall Id for "Write"
    movl $0x1, %ebx # File Descriptor for stdout
    movl 8(%ebp), %ecx # Address of "HelloMsg"
    movl 12(%ebp), %edx # Length of "HelloMsg"
    int $0x80

    #end the function
    popl %ebx # restore ebx
    popl %ebp
    ret
    