#include <stdio.h>
#include <stdalign.h>

int main(void) {
    alignas(8) short x;
    printf("%zu\n", alignas(x));
}