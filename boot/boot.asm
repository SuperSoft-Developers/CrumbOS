; boot.asm
[BITS 16]
[ORG 0x7C00]

start:
    cli

    ; Configura segmentos
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    sti

    ; Limpa a tela
    mov ax, 0x0003
    int 0x10

    ; Mensagem de boot
    mov si, boot_msg
    call print_string

hang:
    jmp hang

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

boot_msg db "CrumbOS Bootloader v0.1", 13, 10, 0

times 510-($-$$) db 0
dw 0xAA55
