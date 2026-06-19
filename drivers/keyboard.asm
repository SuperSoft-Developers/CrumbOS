; keyboard.asm
[BITS 16]

get_key:
    mov ah, 0x00
    int 0x16
    ret
call get_key

mov ah, 0x0E
int 0x10
