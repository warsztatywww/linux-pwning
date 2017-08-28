
section .data
	powitanie db "Czesc, "
	lpowitanie equ $-powitanie
	bufor times 100 db 0
	lbufor equ $-bufor

section .text

main:

	xor r10, r10
	.czytaj:
		inc r10
		mov rax, 0  ; Read
		mov rdi, 0  ; stdin
		lea rsi, [bufor + r10 - 1]
		mov rdx, 1
		syscall

		mov rax, [bufor + r10 - 1]
		cmp al, 0Ah
		jne .czytaj

	lea rdx, [r10+lpowitanie] ; Wczytana dlugosc

	mov rax, 1
	mov rdi, 1
	mov rsi, powitanie
	syscall

	mov rax, 60 ; Exit
	mov rdi, 0  ; Code: 0
	syscall     ; Syscall

global main
