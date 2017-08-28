section .data
	msg     db      "Hello WWW13!", 0Ah ; Wiadomość z nową linią
	mlen    equ     $-msg               ; Obliczenie długości wiadomości

section .text
	global  _start
	_start:

	mov     rax, 1    ; Write
	mov     rdi, 1    ; File
	mov     rsi, msg  ; Contents
	mov     rdx, mlen ; Length
	syscall

	mov     rax, 60  ; Exit
	xor     rdi, 0   ; Code
	syscall
