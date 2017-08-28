;; hello64.asm
segment .data
    msg     db      "Hello WWW13!", 0Ah

segment .text
        global  _start
_start:
 ; write
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg
    mov     rdx, 13
    syscall
 ; exit
    mov     rax, 60
    xor     rdi, 0
    syscall
