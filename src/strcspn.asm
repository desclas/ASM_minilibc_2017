BITS 64

SECTION .text

[GLOBAL mystrcspn:]

mystrcspn:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	jmp floop
good:
	inc rcx
	jmp ffloop
preloop:
	inc rax
strloop:
	cmp byte [rax], 0h
	je good
	mov bl, byte [rax]
	cmp byte [rdi], bl
	jne preloop
ffloop:
	inc rdi
floop:
	cmp byte [rdi], 0h
	je end
	mov rax, rsi
	jmp strloop
end:
	mov rax, rcx
	leave
	ret
