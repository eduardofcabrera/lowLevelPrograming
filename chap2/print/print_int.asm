global _start

section .data
newline_char: db 10

section .text

exit:
    xor rdi, rdi
    mov rax, 60
    syscall

string_length:
    xor rax, rax
.loop:
    cmp byte [rdi+rax], 0
    je .end
    inc rax
    jmp .loop
.end:
    ret

print_string:
    push rdi
    call string_length
    pop rsi
    mov rdx, rax
    mov rdi, 1
    mov rax, 1
    syscall
    ret

print_char:
    push rdi
    mov rdi, rsp
    call print_string
    pop rdi
    ret

print_newline:
    mov rax, 1 ; syscall write
    mov rdi, 1 ; descriptor of stdout file
    mov rsi, newline_char ; place where the data are obtained
    syscall
    ret

print_uint:
    mov rax, rdi
    mov rdi, rsp
    push 0
    sub rsp, 16

    dec rdi
    mov r8, 10

.loop:
    xor rdx, rdx
    div r8
    or dl, 0x30
    dec rdi
    mov [rdi], dl
    test rax, rax
    jnz .loop

    call print_string

    add rsp, 24
    ret

print_int:
    test rdi, rdi
    jns print_uint
    push rdi
    mov rdi, '-'
    call print_char
    pop rdi
    neg rdi
    jmp print_uint

_start: 
    mov rdi, -125
    call print_int
    call print_newline
    call exit



