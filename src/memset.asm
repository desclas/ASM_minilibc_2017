BITS 64

SECTION .text

[GLOBAL memset:]

memset:
	push rbp
	mov rbp, rsp
	mov rax, rdi
	jmp memloop
preloop:
	dec rdx
	mov byte [rax], sil
	inc rax
memloop:
	cmp rdx, 0h
	jne preloop
	mov rax, rdi
	leave
	ret
