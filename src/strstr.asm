BITS 64

SECTION .text

[GLOBAL strstr:]

strstr:
	push rbp
	mov rbp, rsp
	jmp floop
next:
	inc rax
	inc rbx
strloop:
	mov cl, byte [rbx]
	cmp cl, 0h
	je gend
	cmp byte [rax], 0h
	je bend
	cmp byte [rax], cl
	je next
floop:
	mov rax, rdi
	mov rbx, rsi
	mov cl, byte [rsi]
	cmp byte [rdi], cl
	je strloop
	cmp byte [rdi], 0h
	je bend
	inc rdi
	jmp floop
gend:
	mov rax, rdi
	leave
	ret
bend:
	mov rax, 0h
	leave
	ret