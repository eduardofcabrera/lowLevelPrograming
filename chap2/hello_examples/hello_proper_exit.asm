global _start

section .data
message: db 'hello, world!', 10 ; the code 10 is to start a new line, so we have 14 bytes in message

section .text
_start: ; mov writes a value in register or in memory
    mov     rax, 1 ; rax stores the number of system call write
    mov     rdi, 1 ; stdout descriptor
    mov     rsi, message ; string adress -> message is just a pointer to the adress 
    mov     rdx, 14 ; string's len
    syscall ; make system calls

    mov     rax, 60 ; number of exit system call
    xor     rdi, rdi ; set zero to the argument of syscall
    syscall

; to run
; nasm -felf64 hello.asm -0 hello.o
; ld -o hello hello.o
; chmod u+x hello
; ./hello

