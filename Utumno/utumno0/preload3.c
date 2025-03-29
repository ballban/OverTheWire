#include <stdio.h>

int puts(const char *str)
{
    printf("%s\n", 0xf7fdabb0);
    printf("%s\n", 0xffffd3c0);
    printf("%s\n", 0xf7fbd159);
    printf("%s\n", 0x0804907d);
    printf("%s\n", 0xf7fa8e34);
    printf("%s\n", 0xffffd398);
    printf("%s\n", 0x0804917d);
    printf("%s\n", 0x0804a01d);
    printf("%s\n", 0x0804a008);

    return 0;
}