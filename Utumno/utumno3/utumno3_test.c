#include <stdbool.h>
#include <stdio.h>

int main(int argc, char **argv)
{
    int iVar1;
    char b[24];
    char a[24];
    int c;
    int i;

    i = 0;
    while (true)
    {
        iVar1 = getchar();
        printf("iVar1: %d\n", iVar1);
        if ((iVar1 == -1) || (23 < i))
            break;
        b[i] = (char)iVar1;
        b[i] = b[i] ^ (char)i * '\x03';
        iVar1 = getchar();
        printf("iVar2: %d\n", iVar1);
        a[b[i]] = (char)iVar1;
        printf("b[i]: %c\n", b[i]);
        printf("b: %s\n", b);
        printf("a: %s\n", a);
        i = i + 1;
    }
    return 0;
}