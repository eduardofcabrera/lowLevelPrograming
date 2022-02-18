global _start

section .data
message: db 'STRING', 0 ; the code 10 is to start a new line, so we have 14 bytes in message
newline_char: db 10

section .text

print_newline:
    mov rax, 1 ; syscall write
    mov rdi, 1 ; descriptor of stdout file
    mov rsi, newline_char ; place where the data are obtained
    syscall
    ret

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

_start: 
    mov rdi, message
    call print_string
    call print_newline
    call exit



