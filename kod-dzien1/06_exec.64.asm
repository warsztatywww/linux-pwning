segment .data
	theshell db "/bin/sh", 0
	
	argv0 db "/bin/sh", 0
	argv dq argv0, 0

segment .text
	global  main
	main:

	mov     rax, 59   ; execve
	mov     rdi, theshell
	mov     rsi, argv
	mov     rdx, 0
	syscall
