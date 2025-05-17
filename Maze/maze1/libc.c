#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

extern int puts(const char *s);

__uid_t __suid;
__uid_t __euid;
__uid_t __ruid;

int puts(const char *s)
{
    __suid = geteuid();
    __euid = geteuid();
    __ruid = geteuid();
    setresuid(__ruid, __euid, __suid);
    system("cat /etc/maze_pass/maze2");
}