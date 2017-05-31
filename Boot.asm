[org 0]
bits 16
jmp boot1

print:
lodsb
or al,al
jz .printdone
mov ah,0eh
int 0x10
call print

.printdone:
ret

boot1:
cli
mov ax, 0x07c0

mov ds,ax
mov es,ax
mov ax, 0x0000
mov ss,ax
sti

mov si, bootmsg
call print



hlt
bootmsg db 0x0a,0x0d, "Loading System..." 0x0a,0x0d,0

times 510-($-$$) db 0
dw 0xAA55