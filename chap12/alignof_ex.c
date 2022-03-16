#include <stdio.h>
#include <stdalign.h>

int main (void) {
    long x;
    printf("%zu\n", alignof(x));
}