bits 64

global memset:function

section .text
	memset:
		mov rcx, 0			; set len value
		cmp rdx, 0			; test size < 0
		jle return			; jump return


	loop:
		cmp rdx, rcx		; cmp size and incr
		je return			; jump on finish
		mov [rdi+rcx], sil	; set mem at incr position
		inc rcx				; incremente
		jmp loop			; jump loop

	return:
		mov rax, rdi		; set return value to
		ret					; ret
