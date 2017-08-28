
10_ubersecret.64:     file format elf64-x86-64

00000000004009e0 <frame_dummy>:
  4009e0:	b8 20 81 48 00       	mov    eax,0x488120
  4009e5:	48 85 c0             	test   rax,rax
  4009e8:	74 1e                	je     400a08 <frame_dummy+0x28>
  4009ea:	55                   	push   rbp
  4009eb:	be 00 02 6b 00       	mov    esi,0x6b0200
  4009f0:	bf d8 11 4a 00       	mov    edi,0x4a11d8
  4009f5:	48 89 e5             	mov    rbp,rsp
  4009f8:	e8 23 77 08 00       	call   488120 <__register_frame_info>
  4009fd:	5d                   	pop    rbp
  4009fe:	e9 5d ff ff ff       	jmp    400960 <register_tm_clones>
  400a03:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400a08:	e9 53 ff ff ff       	jmp    400960 <register_tm_clones>
  400a0d:	0f 1f 00             	nop    DWORD PTR [rax]
  400a10:	e9 cb 95 00 00       	jmp    409fe0 <getchar>
  400a15:	48 83 f8 61          	cmp    rax,0x61
  400a19:	72 15                	jb     400a30 <frame_dummy+0x50>
  400a1b:	48 83 f8 6b          	cmp    rax,0x6b
  400a1f:	77 0f                	ja     400a30 <frame_dummy+0x50>
  400a21:	49 c7 c7 01 00 00 00 	mov    r15,0x1
  400a28:	4d 31 f6             	xor    r14,r14
  400a2b:	e9 4e 01 00 00       	jmp    400b7e <frame_dummy+0x19e>
  400a30:	48 3d ff 00 00 00    	cmp    rax,0xff
  400a36:	0f 87 81 00 00 00    	ja     400abd <frame_dummy+0xdd>
  400a3c:	48 83 f8 2e          	cmp    rax,0x2e
  400a40:	0f 84 e3 00 00 00    	je     400b29 <frame_dummy+0x149>
  400a46:	48 83 f8 40          	cmp    rax,0x40
  400a4a:	0f 84 9d 00 00 00    	je     400aed <frame_dummy+0x10d>
  400a50:	48 83 f8 20          	cmp    rax,0x20
  400a54:	74 77                	je     400acd <frame_dummy+0xed>
  400a56:	48 83 f8 0a          	cmp    rax,0xa
  400a5a:	74 71                	je     400acd <frame_dummy+0xed>
  400a5c:	48 83 f8 5d          	cmp    rax,0x5d
  400a60:	74 6c                	je     400ace <frame_dummy+0xee>
  400a62:	48 83 f8 0d          	cmp    rax,0xd
  400a66:	74 65                	je     400acd <frame_dummy+0xed>
  400a68:	48 83 f8 71          	cmp    rax,0x71
  400a6c:	74 4f                	je     400abd <frame_dummy+0xdd>
  400a6e:	48 83 f8 7a          	cmp    rax,0x7a
  400a72:	0f 84 c9 00 00 00    	je     400b41 <frame_dummy+0x161>
  400a78:	48 83 f8 3f          	cmp    rax,0x3f
  400a7c:	0f 84 88 00 00 00    	je     400b0a <frame_dummy+0x12a>
  400a82:	48 83 f8 5b          	cmp    rax,0x5b
  400a86:	74 17                	je     400a9f <frame_dummy+0xbf>
  400a88:	48 83 f8 23          	cmp    rax,0x23
  400a8c:	0f 84 d2 00 00 00    	je     400b64 <frame_dummy+0x184>
  400a92:	48 c7 c7 49 e0 6a 00 	mov    rdi,0x6ae049
  400a99:	e8 72 79 00 00       	call   408410 <_IO_puts>
  400a9e:	c3                   	ret    
  400a9f:	49 8b 85 28 02 6b 00 	mov    rax,QWORD PTR [r13+0x6b0228]
  400aa6:	49 8b 9d 20 02 6b 00 	mov    rbx,QWORD PTR [r13+0x6b0220]
  400aad:	48 0f af c3          	imul   rax,rbx
  400ab1:	49 83 ed 08          	sub    r13,0x8
  400ab5:	49 89 85 28 02 6b 00 	mov    QWORD PTR [r13+0x6b0228],rax
  400abc:	c3                   	ret    
  400abd:	49 c7 c7 02 00 00 00 	mov    r15,0x2
  400ac4:	48 83 c4 08          	add    rsp,0x8
  400ac8:	e9 2c 01 00 00       	jmp    400bf9 <main+0x2b>
  400acd:	c3                   	ret    
  400ace:	49 8b 9d 28 02 6b 00 	mov    rbx,QWORD PTR [r13+0x6b0228]
  400ad5:	49 8b 85 20 02 6b 00 	mov    rax,QWORD PTR [r13+0x6b0220]
  400adc:	48 99                	cqo    
  400ade:	48 f7 fb             	idiv   rbx
  400ae1:	49 83 ed 08          	sub    r13,0x8
  400ae5:	49 89 85 28 02 6b 00 	mov    QWORD PTR [r13+0x6b0228],rax
  400aec:	c3                   	ret    
  400aed:	49 8b 85 28 02 6b 00 	mov    rax,QWORD PTR [r13+0x6b0228]
  400af4:	49 8b 9d 20 02 6b 00 	mov    rbx,QWORD PTR [r13+0x6b0220]
  400afb:	48 01 d8             	add    rax,rbx
  400afe:	49 83 ed 08          	sub    r13,0x8
  400b02:	49 89 85 28 02 6b 00 	mov    QWORD PTR [r13+0x6b0228],rax
  400b09:	c3                   	ret    
  400b0a:	49 8b 9d 28 02 6b 00 	mov    rbx,QWORD PTR [r13+0x6b0228]
  400b11:	49 8b 85 20 02 6b 00 	mov    rax,QWORD PTR [r13+0x6b0220]
  400b18:	48 99                	cqo    
  400b1a:	48 f7 fb             	idiv   rbx
  400b1d:	49 83 ed 08          	sub    r13,0x8
  400b21:	49 89 95 28 02 6b 00 	mov    QWORD PTR [r13+0x6b0228],rdx
  400b28:	c3                   	ret    
  400b29:	49 83 ed 08          	sub    r13,0x8
  400b2d:	48 c7 c7 57 e0 6a 00 	mov    rdi,0x6ae057
  400b34:	49 8b b5 30 02 6b 00 	mov    rsi,QWORD PTR [r13+0x6b0230]
  400b3b:	e8 40 70 00 00       	call   407b80 <_IO_printf>
  400b40:	c3                   	ret    
  400b41:	49 8b 85 28 02 6b 00 	mov    rax,QWORD PTR [r13+0x6b0228]
  400b48:	49 8b 9d 20 02 6b 00 	mov    rbx,QWORD PTR [r13+0x6b0220]
  400b4f:	48 f7 d0             	not    rax
  400b52:	48 ff c0             	inc    rax
  400b55:	48 01 d8             	add    rax,rbx
  400b58:	49 83 ed 08          	sub    r13,0x8
  400b5c:	49 89 85 28 02 6b 00 	mov    QWORD PTR [r13+0x6b0228],rax
  400b63:	c3                   	ret    
  400b64:	48 c7 c7 57 e0 6a 00 	mov    rdi,0x6ae057
  400b6b:	49 8b b5 28 02 6b 00 	mov    rsi,QWORD PTR [r13+0x6b0228]
  400b72:	e8 09 70 00 00       	call   407b80 <_IO_printf>
  400b77:	49 83 ed 08          	sub    r13,0x8
  400b7b:	75 e7                	jne    400b64 <frame_dummy+0x184>
  400b7d:	c3                   	ret    
  400b7e:	48 83 f8 61          	cmp    rax,0x61
  400b82:	72 1b                	jb     400b9f <frame_dummy+0x1bf>
  400b84:	48 83 f8 6b          	cmp    rax,0x6b
  400b88:	77 15                	ja     400b9f <frame_dummy+0x1bf>
  400b8a:	49 d1 e6             	shl    r14,1
  400b8d:	4c 89 f3             	mov    rbx,r14
  400b90:	48 c1 e3 02          	shl    rbx,0x2
  400b94:	49 01 de             	add    r14,rbx
  400b97:	48 83 e8 61          	sub    rax,0x61
  400b9b:	49 01 c6             	add    r14,rax
  400b9e:	c3                   	ret    
  400b9f:	4d 89 b5 30 02 6b 00 	mov    QWORD PTR [r13+0x6b0230],r14
  400ba6:	49 83 c5 08          	add    r13,0x8
  400baa:	49 c7 c7 00 00 00 00 	mov    r15,0x0
  400bb1:	e9 5f fe ff ff       	jmp    400a15 <frame_dummy+0x35>
  400bb6:	15 0a 40 00 00       	adc    eax,0x400a
  400bbb:	00 00                	add    BYTE PTR [rax],al
  400bbd:	00 7e 0b             	add    BYTE PTR [rsi+0xb],bh
  400bc0:	40 00 00             	add    BYTE PTR [rax],al
  400bc3:	00 00                	add    BYTE PTR [rax],al
  400bc5:	00 f9                	add    cl,bh
  400bc7:	0b 40 00             	or     eax,DWORD PTR [rax+0x0]
  400bca:	00 00                	add    BYTE PTR [rax],al
	...

0000000000400bce <main>:
  400bce:	49 c7 c5 00 00 00 00 	mov    r13,0x0
  400bd5:	4d 31 f6             	xor    r14,r14
  400bd8:	4d 31 ff             	xor    r15,r15
  400bdb:	48 c7 c7 20 e0 6a 00 	mov    rdi,0x6ae020
  400be2:	e8 29 78 00 00       	call   408410 <_IO_puts>
  400be7:	e8 24 fe ff ff       	call   400a10 <frame_dummy+0x30>
  400bec:	68 e7 0b 40 00       	push   0x400be7
  400bf1:	42 ff 24 fd b6 0b 40 	jmp    QWORD PTR [r15*8+0x400bb6]
  400bf8:	00 
  400bf9:	48 c7 c0 00 00 00 00 	mov    rax,0x0
  400c00:	c3                   	ret    
  400c01:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  400c08:	00 00 00 
  400c0b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

