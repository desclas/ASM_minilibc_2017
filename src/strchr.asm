BITS 64

SECTION .text

[GLOBAL strchr:]

strchr:
	push rbp
	mov rbp, rsp
	mov rax, rdi
	jmp strloop
preloop:
	inc rax
strloop:
	cmp byte [rax], sil
	je gend
	cmp byte [rax], 0h
	je bend
	jmp preloop
gend:
	leave
	ret
bend:
	mov rax, 0h
	leave
	ret