global _start

section .data

test_string: db "abcdef", 0
newline_char: db 10

section .text

strlen:

    xor rax, rax ; zero the rax

.loop:

    cmp byte [rdi+rax], 0 ; check if the actual symbol is the null end '0' 
                          ; check the first by of [rdi+rax]
    je .end ; jump if byte[rdi+rax] = 0
    inc rax ; increment by one
    jmp .loop

.end:
    ret ; when ret the rax will store the return value

_start:

    mov rdi, test_string
    call strlen
    mov rdi, rax

    mov rax, 60 ; exit code syscall
    syscall
