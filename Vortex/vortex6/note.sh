#!/bin/bash
mkdir /tmp/ballban_vortex6
cd /tmp/ballban_vortex6

nano vortex6_execv.c
gcc -m32 -o vortex6_execv vortex6_execv.c

# run
./vortex6_execv
cat /etc/vortex_pass/vortex7
# password: p4ZfutGrw

