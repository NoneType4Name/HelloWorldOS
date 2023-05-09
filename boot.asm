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
[org 7c00h]

mov bx, START
call print
mov bx, START_LOAD_DISK
call print

mov bp, 8000h
mov sp, bp
mov bx, 9000h


; mov dh, 1h
mov ah, 2h; func read disc.
; pusha;        work with stack
; push dx;      work with stack
mov dl, dl; disk.
mov ch, 0h; cylinder.
mov dh, 0h; head number.
mov cl, 2h; sector.
mov al, 1h; count sectors to read.
; int 13h
; pop dx
; popa

; mov dh, 1 ;sectors

call LoadFromDisk
mov dx, [9000h]
call print_hex

; mov sp, 7e00h

; mov al, 2
; mov ch, 00h
; mov cl, 02h
; mov dl, 00h

; mov al, 1
; mov ah, 1
; push eax
; cmp al, ah
; jle .L0
; call print_nl
; xor al, ah

; .L0:
    ; mov bx, GOODBYE
    ; call print
    ; call print_nl

jmp $

%include "LoadFromDisk.asm"
%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"


START:
    db 'Boot Start', 0ah, 0dh, 0
START_LOAD_DISK:
    db 'Load data from disk', 0ah, 0dh, 0

; GOODBYE:
;     db 'Goodbye', 0

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55
; dw 0xFF55
dw 6461h
; dw 0xface ; sector 3 = 512 bytes