
section .data
	litera    db  0, 0

section .text

main:

	mov rax, 0  ; Read
	mov rdi, 0  ; stdin
	mov rsi, litera
	mov rdx, 2 ; litera, nowa linia
	syscall

	mov rax, [litera]
	inc rax
	mov [litera], rax

	mov rax, 1
	mov rdi, 1
	; rsi, rdx bez zmian
	syscall

	mov rax, 60 ; Exit
	mov rdi, 0  ; Code: 0
	syscall     ; Syscall

global main

