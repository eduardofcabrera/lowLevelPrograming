section .data

newline_char: db 10
codes: db '0123456789abcdef'
demo1: dq 0x1122334455667788
demo2: db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88 ; little endian -> lot bytes are storage in memomry starting with the LSB

section .text
global _start

print_newline:
    mov rax, 1 ; syscall write
    mov rdi, 1 ; descriptor of stdout file
    mov rsi, newline_char ; place where the data are obtained
    syscall
    ret

print_hex:
    mov rax, rdi ; take the argument

    mov rdi, 1
    mov rdx, 1
    mov rcx, 64

iterate:
    push rax ; save the initial value of rax
    sub rcx, 4
    sar rax, cl

    and rax, 0xf ; clean all the bits unless the 4 LSB
    lea rsi, [codes + rax] ; get the code of the char to be reproduced

    mov rax, 1

    push rcx ; syscall will change the rcx
    syscall 
    ; rax = 1 (31) - the identifier of write
    ; rdi = 1 for stdout
    ; rsi = the adress of the char

    pop rcx

    pop rax
    test rcx, rcx
    jnz iterate

    ret

_start:
    mov rdi, [demo1]
    call print_hex
    call print_newline

    mov rdi, [demo2]
    call print_hex
    call print_newline

    mov rax, 60
    xor rdi, rdi
    syscall
