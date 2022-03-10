#include <stdio.h>

struct list {
    struct node obj;
    struct list* next;
};

struct node {
    int id;
    char name;
    char mail;
};
