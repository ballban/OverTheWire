sftp -oPort=2221 behemoth0@narnia.labs.overthewire.org
behemoth0
get /behemoth/behemoth0
exit

sshpass -p 'behemoth0' ssh behemoth0@narnia.labs.overthewire.org -p 2221
cd /behemoth

gef ./behemoth0
disassemble main
b *main+123
run

# password eatmyshorts
exit

./behemoth0 <<< eatmyshorts

cat /etc/behemoth_pass/behemoth1
# password: 8YpAQCAuKf