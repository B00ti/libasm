bits 64

global rindex:function

section .text
	rindex:
		xor rax, rax				; set rax = null
		mov rcx, 0					; set rcx = null
		cmp rdi, 0					; test arg1 == null
		je return					; return
		cmp rsi, 0					; test arg2 == null
		je return					; return

	loopcheck:
		mov rax, [rdi+rcx]			;
		cmp al, 0					;
		je decr						;
		inc rcx						;
		jmp loopcheck				;

	decr:
		dec rcx						;

	loop:
		mov rax, [rdi+rcx]			; set rax = arg1[]
        cmp al, 0					; test arg1 = null
        je return	          		; return
        cmp al, sil        			; cmp val
        je returnvalue       		; return value
		jmp decr					;

	returnvalue:
		mov rax, rdi        		; set return value
        add rax, rcx        		; add increment
		ret							; return

	return:
		xor rax, rax				; set rax = null
		ret							; return
