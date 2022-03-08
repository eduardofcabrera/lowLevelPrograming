#include <stdio.h>

int is_prime(unsigned long n) {
    if (n == 1 | n == 2) {
        return 1;
    }
    int i;
    for (i=1; i < n/2;i++) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

void main(void) {
    unsigned long n = 13;
    int r;
    r = is_prime(n);
    printf('%d\n', r);
}