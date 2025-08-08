void restart(char *param_1)
{
    __uid_t __euid;
    __uid_t __ruid;

    __euid = geteuid();
    __ruid = geteuid();
    setreuid(__ruid, __euid);
    execlp(param_1, param_1, 0);
    return;
}

void main(int argc, char **argv, int *envp)
{
    if (*envp != 0)
    {
        restart(*argv);
    }
    printf((char *)envp[3]);
    /* WARNING: Subroutine does not return */
    _exit(0x7325);
}