#include <stdio.h>
#include <stdlib.h>
#include <sys/times.h>
#include <time.h>

int main(int argc, char *argv[])
{
    struct tms tms;
    clock_t tmp_time;
    int random_time;
    time_t t;
    unsigned int seed;
    int i;

    tmp_time = times(&tms);
    random_time = tmp_time + tms.tms_cstime + tms.tms_utime + tms.tms_stime + tms.tms_cutime;
    tmp_time = clock();
    random_time += tmp_time;
    t = time(0);
    random_time = 128 - (random_time + t) % 256;
    t = time(0);
    seed = t + random_time;

    srand(seed);

    for (i = 0; i < random_time; i = i + 1)
    {
        rand();
    }

    for (i = 0; i < 20; i++)
    {
        int r = rand();
        if (argc > 1)
            printf("%08x %d\n", r, r);
    }

    printf("Seed: %u\n", seed);
    return 0;
}