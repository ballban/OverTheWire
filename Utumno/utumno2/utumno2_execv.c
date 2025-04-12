#include <stdio.h>
#include <unistd.h>

int main(void)
{
    char *argv[] = {NULL};
    execv("/utumno/utumno2", argv);
    // execv is correct, look up https://linux.die.net/man/3/execv
    return 0;
}