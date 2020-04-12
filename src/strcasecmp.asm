bits 64

global strcasecmp:function

section .text
	strcasecmp:
		xor rax, rax		; set return value = null
		xor rbx, rbx		; set register = null
		mov rcx, 0			; set size = null
		cmp rdi, 0			; test arg1 == null
		je return			; return
		cmp rsi, 0			; test arg2 == null
		je return			; return

	checkvalue:
		cmp al, bl			; cmp arg1 and arg2
		je incr				; incremente 
		sub rax, 32			; add to see big case
		cmp al, bl			; cmp arg1 and arg2
		je incr				; incremente
		add rax, 64			; add to see little case
		cmp al, bl			; cmp arg1 and arg2
		jne returnvalue		; return value

	incr:
		inc rcx				; incremente

	loop:
		mov rax, [rdi+rcx]	; set val arg1
		mov rbx, [rsi+rcx]	; set val arg2
		cmp al, 0			; test arg1 && NULL
		je returnvalue		; return value
		cmp bl, 0			; test arg2 && NULL
		je returnvalue		; return value
		jmp checkvalue		; check value

	returnvalue:
		sub rax, rbx		; set return value
		cmp al, 0			; test equal
		je equal			; jump equal
		cmp al, 0			; test pos
		jg pos				; jump pos
		cmp al, 0			; test neg
		jle neg				; jump neg

	pos:
		mov rax, 1			; set return value
		jmp return			; return

	neg:
		mov rax, -1			; set return value
		jmp return			; return

	equal:
		xor rax, rax		; set return value

	return:
		ret					; return