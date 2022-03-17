#ifdef _STACK_H_
#define _STACK_H_

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

struct list;

strcut stack {
    struct list* first;
    struct list* last;
    size_t count;
};

struct stack stack_init(void);
void statck_deint(struct stack* s, int value);

void stack_push(struct stack* s, int value);
void stack_pop(struct stack* s);
bool stack_is_empty(struct stack const* s);

void stack_foreach(struct stack* s, void (f)(int));

#endif