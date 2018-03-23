BITS 64

SECTION .text

[GLOBAL strncmp:]

strncmp:
	push rbp
	mov rbp, rsp
	mov rax, rdi
	mov rcx, rsi
	cmp rdx, 0h
	je equalout
	jmp cmploop
equal:
	dec rdx
	cmp rdx, 0h
	je equalout
	cmp byte [rax], 0h
	jne precmp
equalout:
	mov rax, 0h
	leave
	ret
precmp:
	inc rax
	inc rcx
cmploop:
	cmp ax, cx
	je equal
	cmp ax, cx
	jg greater
	cmp ax, cx
	jl lower
greater:
	mov rax, 01h
	leave
	ret
lower:
	xor rax, rax
	dec rax
	leave
	ret