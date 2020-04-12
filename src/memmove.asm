bits 64

global memmove:function

section .text
	memmove:
        xor rax, rax        ; set rax = null
        xor rbx, rbx        ; set rbx = null
		mov rcx, 0			; set len == null
        mov rax, rsi        ; set rax to arg2
        cmp rdi, 0          ; test arg1 == null
        je returnnull       ; return null
		cmp rsi, 0			; test arg2 == null
		je returnnull	    ; jump return null
		cmp rdx, 0			; test size < 0
		jle returnnull		; jump return null

	loop:
		cmp rdx, 0		    ; cmp size and incr
		je return			; jump on finish
		mov rbx, [rax+rcx]	; set mem dest with mem src
        mov [rdi+rcx], rbx  ; set dest to src
		inc rcx				; incremente
        dec rdx             ; decremente
		jmp loop			; jump loop

    returnnull:
        xor rax, rax        ; set rax = null
        ret                 ; return

	return:
		mov rax, rdi		; set val return
		ret					; return
