section .data
codes: db      '0123456789ABCDEF'

section .text
global _start
_start:
    ; number 1122... in hex format
    mov rax, 0x1122334455667788

    mov rdi, 1 ; wrtie option
    mov rdx, 1
    mov rcx, 64 ; rcx is used for loops

.loop:
    push rax ; push to the stack
    sub rcx, 4 ; substract 4 from rcx -> so it'll goes to loop this 16 times 64/4
    ; cl is the minor part of rcx ( 2 LSB )
    ; rax -- eax -- ax -- ah + al
    ; rcx -- ecx -- cx -- ch + cl
    sar rax, cl ; shift arithmetic right with the MSB shifted back to itself
    and rax, 0xf ; 0xf = 1111 -> mask 

    lea rsi, [codes + rax] ; adreass computation instruction -> raz will be the ofset 
    ;mov rsi codes + mov rsi, [codes] = lea si, [codes + rax]
    mov rax, 1 

    push rcx
    syscall
    pop rcx

    pop rax

    test rcx, rcx
    jnz .loop

    mov rax, 60
    xor rdi, rdi
    syscall