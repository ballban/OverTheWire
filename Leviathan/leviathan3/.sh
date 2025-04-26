sshpass -p 'f0n8h2iWLP' ssh leviathan3@leviathan.labs.overthewire.org -p 2223

sftp -oPort=2223 leviathan3@leviathan.labs.overthewire.org
get level3

./level3
# password: h0no33kakaka*32.2*[x]...s3cr3t
h0no33
kakaka
*32.2*[x]
...s3cr3t


gdb-gef ./level3
disassemble do_stuff
# find the address of strcmp
# b *0x080484a6
# password: snlprintf
quit

./level3
snlprintf
cat /etc/leviathan_pass/leviathan4

# password: WG1egElCvO