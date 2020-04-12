bits 64

global strchr:function

section .text
strchr:
    xor rax, rax		; set return value to null
	cmp rdi, 0			; test arg1 == null
	je return			; jump return

loop:
    cmp byte[rdi], sil	; compare
    je returnvalue		; jump return
    cmp byte[rdi], 0	; compare
    je return			; jump return
    inc rdi				; incremente
    jmp loop			; jump loop

returnvalue:
    mov rax, rdi		; set return value

return:
    ret					; return