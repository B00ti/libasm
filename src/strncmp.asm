bits 64

global strncmp:function

section .text
	strncmp:
		xor rax, rax		; set return value = null
		xor rbx, rbx		; set register = null
		mov rcx, 0			; set size = null
		cmp rdi, 0			; test arg1 == null
		je return			; return
		cmp rsi, 0			; test arg2 == null
		je return			; return
		cmp rdx, 0			; test size < 0
		jbe return			; return

	loop:
		mov rax, [rdi+rcx]	; set val arg1
		mov rbx, [rsi+rcx]	; set val arg2
		cmp al, 0			; test arg1 && NULL
		je returnvalue		; return value
		cmp bl, 0			; test arg2 && NULL
		je returnvalue		; return value
		cmp al, bl			; cmp arg1 and arg2
		jne returnvalue		; return value 
		cmp rcx, rdx		; test size
		je returnvalue		; jump returnvalue
		inc rcx				; incremente
		jmp loop			; jump loop

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
