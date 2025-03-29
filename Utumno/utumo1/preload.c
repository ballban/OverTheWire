#include <stdio.h>
// gcc preload.c -o preload.so -fPIC -shared -ldl -m32
int strncmp(const char *s1, const char *s2, size_t n)
{
    printf("Hello from 'strncmp' !");

    return 0;
}