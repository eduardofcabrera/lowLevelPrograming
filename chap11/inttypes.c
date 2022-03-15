#include <stdio.h>
#include <inttypes.h>

void main(void) {
    int64_t i64 = -10;
    uint64_t u64 = 100;
    printf("Signed 64-bit integer: %" PRIi64 "\n", i64);
    printf("Unsigned 64-bit integer: %" PRIu64 "\n", u64);
}