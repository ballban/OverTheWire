#!/bin/bash
# Same as utumno0?
mkdir /tmp/ballban_maze1
cd /tmp/ballban_maze1

# use LD_PRELOAD="" to override the default library
nano libc.c

gcc libc.c -o libc.so.4 -fPIC -shared -ldl -m32
LD_PRELOAD="./libc.so.4" /maze/maze1

# password: PBeZRPjetr