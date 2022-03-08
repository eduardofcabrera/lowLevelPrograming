#include <stdio.h>

const int g_array_1[] = {1, 2, 3, 2};
const int g_array_2[] = {1, 3, 2, 12};

int dotProd(const int* array_1, const int* array_2, size_t s1, size_t s2) {
    if (s1 != s2) {
        printf("LEN ERROR");
        return 0;
    }
    size_t i;
    int sum = 0;
    for (i = 0; i < s1; i++) {
        sum = sum + (array_1[i]*array_2[i]);
    }
    return sum;
}

int main(void) {
    printf("PRODUCT %d \n", dotProd(g_array_1, g_array_2, sizeof(g_array_1)/sizeof(int), sizeof(g_array_2)/sizeof(int)));
    return 0;
}