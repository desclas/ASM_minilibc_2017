BITS 64

SECTION .text

[GLOBAL strcmp:]

strcmp:
	push rbp
	mov rbp, rsp
	mov rax, rdi
	mov rcx, rsi
	jmp cmploop
equal:
	cmp byte [rax], 0h
	jne precmp
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