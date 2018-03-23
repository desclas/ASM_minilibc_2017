BITS 64

SECTION .text

[GLOBAL strpbrk:]
strpbrk:
	push rbp
	mov rbp, rsp
	jmp floop
prestr:
	inc rax
strloop:
	mov bl, byte [rax]
	cmp byte [rdi], bl
	je gend
	cmp byte [rax], 0h
	jne prestr
	inc rdi
floop:
	cmp byte [rdi], 0h
	je bend
	mov rax, rsi
	jmp strloop
bend:
	mov rax, 0h
	leave
	ret
gend:
	mov rax, rdi
	leave
	ret
