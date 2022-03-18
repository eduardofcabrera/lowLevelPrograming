#include <stdio.h>

extern int global;
void libfun(int value) {
    printf("Param: %d\n", value);
    printf("Global: %d\n", global);
}