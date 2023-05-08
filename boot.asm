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
[org 0x7c00] ; tell the assembler that our offset is bootsector code

; The main routine makes sure the parameters are ready and then calls the function
mov bx, HELLO
call print

call print_nl

mov bx, GOODBYE
call print

call print_nl

mov dx, 0x12fe
call print_hex

; that's it! we can hang now
jmp $

; remember to include subroutines below the hang
%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"


; data
HELLO:
    db 'Hello, World', 0

GOODBYE:
    db 'Goodbye', 0

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55