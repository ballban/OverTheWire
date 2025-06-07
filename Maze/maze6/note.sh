#!/bin/bash
# We don't know how to solve this one
# So we searched for the hint: https://rk700.github.io/2014/07/14/maze/
# We tried for like 3 hours to solve it, but it seems like glibc 2.24 add vtable check to prevent File Stream Pointer Overflows
# Maybe this could help: https://ctf-wiki.org/pwn/linux/user-mode/io-file/exploit-in-libc2.24/
# But it's too complicated for us