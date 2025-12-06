#include <sys/types.h>
#include <cstdio>

undefined4 main(undefined4 argc, int argv)
{
    __uid_t uid;
    __gid_t gid;
    pthread_t local_24[4];
    undefined1 *local_14;

    local_14 = (undefined1 *)&argc;
    pthread_create(local_24, (pthread_attr_t *)0, safecode, (void *)0);
    uid = getuid();
    gid = getgid();
    fix_perms(gid & 0xffff, uid & 0xffff);
    unsafecode(*(undefined4 *)(argv + 4));
    return 0;
}

void safecode(void)
{
    __uid_t euid;
    __gid_t gid;

    euid = geteuid();
    gid = getgid();
    fix_perms(gid & 0xffff, euid & 0xffff);
    do
    {
        printf("%d\n", 0);
        fflush(stdout);
        sleep(1);
    } while (true);
}

void fix_perms(uint param_1, uint param_2)
{
    /* setresgid */
    syscall(170, param_1 & 0xffff, param_1 & 0xffff, param_1 & 0xffff);
    /* setresuid */
    syscall(164, param_2 & 0xffff, param_2 & 0xffff, param_2 & 0xffff);
    return;
}

void unsafecode(char *param_1)
{
    char local_40c[1032];

    strcpy(local_40c, param_1);
    return;
}
