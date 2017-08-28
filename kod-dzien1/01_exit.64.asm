
section .text

main:

	mov rax, 60 ; Exit
	mov rdi, 0  ; Code: 0
	syscall     ; Syscall

global main

