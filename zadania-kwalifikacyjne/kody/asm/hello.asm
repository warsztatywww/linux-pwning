;; hello.asm
segment .data
    msg     db      "Hello WWW13!", 0Ah

segment .text
        global  _start
_start:
 ; write
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, msg
    mov     edx, 13
    int     80h
 ; exit
    mov     eax, 1
    xor     ebx, ebx
    int     0x80
