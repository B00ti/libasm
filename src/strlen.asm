bits 64

global strlen:function

section .text
	strlen:
		mov rcx, 0			; set len to null
		cmp rdi, 0			; check arg1 == NULL
		je return			; jump return

	loop:
		mov rax, [rdi+rcx]	; set var 
		test al, al			; test byte less == NULL
		je return			; jump return
		inc rcx				; incremente
		jmp loop			; jump loop

	return:
		mov rax, rcx		; set return value
		ret					; return