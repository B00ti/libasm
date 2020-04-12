bits 64

global strstr:function

section .text
    strstr:
        xor rax, rax                ; set rax = null
        xor rbx, rbx                ; set rbx = null
		mov rcx, 0			        ; set rcx = null
        mov rdx, 0                  ; set rdx = null
        cmp rdi, 0                  ;
        je returnnull               ;
        cmp rsi, 0                  ;
        je returnnull               ;
        jmp loop                    ; jump loop

    loopcheck:
        mov rax, [rdi+rcx]          ;
        mov rbx, [rsi+rdx]          ; set rbx = arg2
        cmp al, 0                   ;
        je returnnull               ;
        cmp bl, 0                   ; cmp arg2 == null
        je return                   ; jump return
        inc rdx                     ; incremente
        inc rcx                     ;
        cmp al, bl                  ; cmp arg1 and arg2
        je loopcheck                ; return arg1[i]
        jmp loop                    ;

    loop:
        mov rdx, 0                  ; set rdx = null
        mov rax, [rdi+rcx]          ; set rax = arg1
        mov rbx, [rsi+rdx]          ; set rbx = arg2
        cmp bl, 0                   ;
        je returndef                ;
        cmp al, 0                   ; cmp arg1 == null
        je returnnull               ; return null
        cmp al, bl                  ;
        je loopcheck                ; jump loopcheck
        inc rcx                     ;
        jmp loop                    ;

    return:
        mov rax, rdi                ;
        add rax, rcx                ;
        sub rax, rdx                ;
        ret                         ; return 

    returndef:
        mov rax, rdi                ;
        ret                         ;

    returnnull:
        xor rax, rax                ;
        ret                         ; return
