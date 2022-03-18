#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

int global = 0;

void* threadimpl(void* arg) {
    for (int i = 0; i < 10; i++) {
        global++;
        printf("%d 1\n", global);
    }
    return NULL;
}

void* threadimpl2(void* arg) {
    for (int i = 0; i < 10; i++) {
        global++;
        printf("%d 2\n", global);
    }
    return NULL;
}

int main(void) {
    pthread_t t1, t2;
    pthread_create(&t1, NULL, threadimpl, "fizz");
    pthread_create(&t2, NULL, threadimpl2, "buzzzzz");
    pthread_exit(NULL);
    puts("bye");
    return 0;
}
