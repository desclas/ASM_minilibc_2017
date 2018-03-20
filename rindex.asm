BITS 64

SECTION .text

[GLOBAL rindex:]

rindex:
	push rbp
	mov rbp, rsp
	mov rbx, rdi
	xor rax, rax
	jmp strloop
preloop:
	inc rbx
strloop:
	cmp byte [rbx], sil
	je save
	cmp byte [rbx], 0h
	je end
	jmp preloop
save:
	mov rax, rbx
	cmp byte [rbx], 0h
	jne preloop
end:
	leave
	ret