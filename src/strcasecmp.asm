BITS 64

SECTION .text

[GLOBAL strcasecmp:]

strcasecmp:
	push rbp
	mov rbp, rsp
	jmp strloop
preloop:
	inc rdi
	inc rsi
strloop:
	mov bl, byte [rsi]
	cmp byte [rdi], bl
	jne check
	cmp byte [rdi], 0h
	je gend
	jmp preloop
check:
	cmp bl, 'A'
	jle bend
	cmp bl, 'Z'
	jle other
	cmp bl, 'a'
	jle bend
	cmp bl, 'z'
	jle other
	jmp bend
other:
	mov bh, byte [rdi]
	cmp bh, 'A'
	jle bend
	cmp bh, 'Z'
	jle premodulo
	cmp bh, 'a'
	jle bend
	cmp bh, 'z'
	jle premodulo
	jmp bend
premodulo:
	mov rbx, 0h
	mov bl, byte [rdi]
amod:
	sub bl, 020h
	cmp bl, 020h
	jg amod
	mov rcx, 0h
	mov cl, byte [rsi]
bmod:
	sub cl, 020h
	cmp cl, 020h
	jg bmod
	cmp bl, cl
	je preloop
	jmp bend
gend:
	mov rax, 0h
	leave
	ret
bend:
	mov rax, 0h
	mov rbx, 0h
	mov al, byte [rdi]
	mov bl, byte [rsi]
	sub rax, rbx
	leave
	ret