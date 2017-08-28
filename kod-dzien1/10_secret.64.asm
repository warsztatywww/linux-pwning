segment .data
	hellomsg db "Magiczny program - odkryj jego dzialanie", 0
	eunk db "Zla operacja", 10, 0
	digf db "-> %lld", 10, 0

segment .bss
	iobuf resb 1024
	iosz   equ $-iobuf

segment .text

extern getchar, puts, printf, stdin

getc: ; => rax ; ~rdi
	jmp getchar ; call;ret

hany:

	cmp rax, '0'
	jb .notdg
	cmp rax, '9'
	ja .notdg

	mov r15, 1
	xor r14, r14
	jmp hnum

	.notdg:
	cmp rax, ' '
	jz .o.i
	cmp rax, 10
	jz .o.i
	cmp rax, 13
	jz .o.i
	cmp rax, 'q'
	jz .o.e
	cmp rax, 255
	ja .o.e
	cmp rax, '+'
	jz .o.p
	cmp rax, '-'
	jz .o.m
	cmp rax, '*'
	jz .o.s
	cmp rax, '/'
	jz .o.x
	cmp rax, '%'
	jz .o.x2
	cmp rax, '.'
	jz .o.w
	cmp rax, '#'
	jz .o.wa
	
	mov rdi, eunk
	call puts
	ret

	.o.i:
		ret
	.o.e:
		mov r15, 2
		add rsp, 8
		jmp main.end
	.o.p:
		mov rax, [iobuf+r13-8]
		mov rbx, [iobuf+r13-16]
		add rax, rbx
		sub r13, 8
		mov [iobuf+r13-8], rax
		ret
	.o.m:
		mov rax, [iobuf+r13-8]
		mov rbx, [iobuf+r13-16]
		not rax
		inc rax
		add rax, rbx
		sub r13, 8
		mov [iobuf+r13-8], rax
		ret
	.o.s:
		mov rax, [iobuf+r13-8]
		mov rbx, [iobuf+r13-16]
		imul rax, rbx
		sub r13, 8
		mov [iobuf+r13-8], rax
		ret
	.o.x:
		mov rbx, [iobuf+r13-8]
		mov rax, [iobuf+r13-16]
		cqo
		idiv rbx
		sub r13, 8
		mov [iobuf+r13-8], rax
		ret
	.o.x2:
		mov rbx, [iobuf+r13-8]
		mov rax, [iobuf+r13-16]
		cqo
		idiv rbx
		sub r13, 8
		mov [iobuf+r13-8], rdx
		ret
	.o.w:
		sub r13, 8
		mov rdi, digf
		mov rsi, [iobuf+r13]
		call printf
		ret
	.o.wa:
		mov rdi, digf
		mov rsi, [iobuf+r13-8]
		call printf
		sub r13, 8
		jnz .o.wa
		ret

hnum:
	cmp rax, '0'
	jb .notdg
	cmp rax, '9'
	ja .notdg

	imul r14, 10
	sub rax, '0'
	add r14, rax

	ret
	.notdg:

		mov [iobuf + r13], r14
		add r13, 8

		mov r15, 0
		jmp hany

jtab:
	dq hany
	dq hnum
	dq main.end

global  main
main:

	mov r13, 0
	xor r14, r14
	xor r15, r15

	mov rdi, hellomsg
	call puts

.main:

	call getc
	push .main
	jmp [jtab + 8*r15]

main.end:
	mov rax, 0 ; return 0;
	ret
