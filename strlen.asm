BITS 64

SECTION .text

[GLOBAL strlen:]
strlen:
	push rbp
	mov rbp, rsp
	xor rax, rax
	jmp strloop
prelen:
	inc rax
	inc rdi
strloop:
	cmp byte [rdi], 0h
	jne prelen
	leave
	ret