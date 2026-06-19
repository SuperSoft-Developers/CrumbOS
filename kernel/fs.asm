; fs.asm
[BITS 16]

app_name db "shell.cru",0

app_data:
db "print Ola do CrumbOS",0
find_file:
    ; Futuramente comparar nomes
    mov si, app_data
    ret
