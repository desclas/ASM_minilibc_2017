BITS 64

SECTION .text

[GLOBAL memcpy:]

memcpy:
	push rbp
	mov rbp, rsp
	mov rax, rdi
strloop:
	cmp rdx, 0h
	je end
	movsb
	dec rdx
	jmp strloop
end:
	leave
	ret