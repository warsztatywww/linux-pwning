
section .data
	fmt db "%d", 10, 0

section .text

extern printf, rand, time, srand

main:

	xor rdi, rdi
	call time
	mov rdi, rax
	call srand

	call rand ; -> rax

	mov rdi, fmt
	mov rsi, rax
	mov rax, 0
	call printf

	mov rax, 60 ; Exit
	mov rdi, 0  ; Code: 0
	syscall     ; Syscall

global main

