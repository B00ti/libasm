bits 64

global memcpy:function

section .text
	memcpy:
		mov rcx, 0			; set len == null
		cmp rsi, 0			; test arg2 == null
		je return			; jump return
		cmp rdx, 0			; test size < 0
		jle return			; jump return

	loop:
		cmp rdx, rcx		; cmp size and incr
		je return			; jump on finish
		mov rax, [rsi+rcx]	; set mem dest with mem src
		mov [rdi+rcx], rax	; ''
		inc rcx				; incremente
		jmp loop			; jump loop

	return:
		mov rax, rdi		; set val return
		ret					; ret
