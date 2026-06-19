; kernel.asm
[BITS 16]
[ORG 0x1000]

start:
    ; Limpa a tela
    mov ax, 0x0003
    int 0x10

    ; Exibe mensagem
    mov si, msg
    call print_string

main_loop:
    jmp main_loop

print_string:
    mov ah, 0x0E

.next:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .next

.done:
    ret

msg db "CrumbOS Kernel v0.1", 13, 10
    db "Bem-vindo ao CrumbOS!", 13, 10, 0
