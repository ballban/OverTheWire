#include <stdio.h>
// gcc preload.c -o preload.so -fPIC -shared -ldl -m32
int puts(const char *str)
{
    printf("Hello from 'puts' !");

    return 0;
}