; org 7C00h
; global _start ; test
; ; extrn	_kernel:near
; ; extern kernel
; ; section .text
; _start:
;     cli
;     xor ax, ax
;     mov ds, ax
;     mov es, ax
;     mov ss, ax
;     sti

; ;   call kernel
;   mov ah, 00h; код функции изменения видео режима
;   mov al, 02h; настройка графического режима 80x25 (текст)
;   int 10h; вызов прерывания

;   mov ax, 1301h
;   mov bl, 12h
;   mov cx, 12
;   mov dl, 0
;   mov dh, 2
;   mov bp, message
;   int 10h

;   jmp $

; message db 'Hello World!'

; times 510 - ($ - $$) db 0
; db 0x55, 0xAA
; ; bootloader.asm

; ; global _start
; ; extern main

; ; section .text
; ; _start:
;     ; hardware initialization
;     ; ...

;     ; call main function
;     ; call main

;     ; return control to the bootloader
;     ; ...
[org 0x7c00]

mov bx, HELLO
xor al, ah
mov al, 1
mov ah, 1
push eax
cmp al, ah
jle .L0
call print
call print_nl
xor al, ah

.L0:
    mov bx, GOODBYE
    call print
    call print_nl

jmp $

%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"


HELLO:
    db 'Hello, World', 0

GOODBYE:
    db 'Goodbye', 0

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55