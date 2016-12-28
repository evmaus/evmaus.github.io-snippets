.text
write_call:
    jmp tail
head:
    # This is a null-free "movl $0x4, %eax"
    xor %eax,%eax
    movb $0x4, %al
    # This is "movl $0x1, %ebx"
    xor %ebx, %ebx
    movb $0x1, %bl
    # Get the address of the .ascii section below
    # it was pushed to the stack by the "call" below.
    popl %ecx
    # "movl $0x12, %edx -- the length of "Hello Shellcoder!\n"
    xor %edx, %edx
    movb $0x12, %dl
    # Syscall
    int $0x80
    
    # And we'll exit, because we've smashed EBX, which we'd because
    # required to save if we wanted to use the standard calling convention.
    xor %eax,%eax
    movb $0x1, %al
    xor %ebx,%ebx
    int $0x80
tail:
    call head
    .ascii "Hello Shellcoder!\n"
