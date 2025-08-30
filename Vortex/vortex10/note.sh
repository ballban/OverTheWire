#!/bin/sh

mkdir /tmp/ballban_vortex10
cd /tmp/ballban_vortex10

# Get the base seed
nano getseed.c
gcc -o getseed.o getseed.c -m32

# Brute force the seed
nano run.py
chmod +x run.py

python3 run.py
# Password: srx196haC