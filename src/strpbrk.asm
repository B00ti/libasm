bits 64

global strpbrk:function

section .text
    strpbrk:
        xor rax, rax                ; set rax = null
        xor rbx, rbx                ; set rbx = null
		mov rcx, 0			        ; set rcx = null
        mov rdx, 0                  ; set rdx = null
        cmp rdi, 0                  ; check arg1 == null
        je setnull                  ; return null
        cmp rsi, 0                  ; check arg2 == null
        je setnull                  ; return null
        jmp loop                    ; jump loop

    loopcheck:
        mov rbx, [rsi+rdx]          ; set rbx = arg2
        cmp bl, 0                   ; cmp arg2 == null
        je incr                     ; jump loop 1
        cmp al, bl                  ; cmp arg1 and arg2
        je return                   ; return arg1[i]
        inc rdx                     ; incremente
        jmp loopcheck               ; jmp loopcheck

    incr:
        inc rcx                     ; incremente

    loop:
        mov rax, [rdi+rcx]          ; set rax = arg1
        mov rdx, 0                  ; set rdx = null
        cmp al, 0                   ; cmp arg1 == null
        je setnull                  ; return null
        jmp loopcheck               ; jump loopcheck

    setnull:
        xor rax, rax                ; set return value to null
        ret                         ; return

    return:
        mov rax, rdi                ; set return value = arg1
        add rax, rcx                ; add to arg1[i]
        ret                         ; return 
