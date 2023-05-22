LoadFromDisk:
    pusha;        work with stack
    push dx;      work with stack

    ; mov dl, dl; disk.
    ; mov ch, 0h; cylinder.
    ; mov dh, 0h; head number.
    ; mov cl, 2h; sector.
    ; mov al, 1h; count sectors to read.
    int 13h
    jc ErrLoadFromDisk

    pop dx
    ; cmp al, 1h
    ; jne ErrReadSegFromDisk
    popa
    mov bx, DISC_SUCCESS
    call print
    ret

inf_loop jmp $


ErrLoadFromDisk:
    mov bh, ah
    mov bx, DISC_ERR
    call print
    jmp inf_loop

; ERR:
;     mov bx, DISK_ERR_01
;     call print
;     jmp inf_loop
; ERR_02:
;     mov bx, DISK_ERR_02
;     call print
;     jmp inf_loop
; ERR_03:
;     mov bx, DISK_ERR_03
;     call print
;     jmp inf_loop
; ERR_04:
;     mov bx, DISK_ERR_04
;     call print
;     jmp inf_loop
; ERR_05:
;     mov bx, DISK_ERR_05
;     call print
;     jmp inf_loop
; ERR_06:
;     mov bx, DISK_ERR_06
;     call print
;     jmp inf_loop
; ERR_07:
;     mov bx, DISK_ERR_07
;     call print
;     jmp inf_loop
; ERR_08:
;     mov bx, DISK_ERR_08
;     call print
;     jmp inf_loop
; ERR_09:
;     mov bx, DISK_ERR_09
;     call print
;     jmp inf_loop
; ERR_0A:
;     mov bx, DISK_ERR_0A
;     call print
;     jmp inf_loop
; ERR_0B:
;     mov bx, DISK_ERR_0B
;     call print
;     jmp inf_loop
; ERR_0C:
;     mov bx, DISK_ERR_0C
;     call print
;     jmp inf_loop
; ERR_0D:
;     mov bx, DISK_ERR_0D
;     call print
;     jmp inf_loop
; ERR_0E:
;     mov bx, DISK_ERR_0E
;     call print
;     jmp inf_loop
; ERR_0F:
;     mov bx, DISK_ERR_0F
;     call print
;     jmp inf_loop
; ERR_10:
;     mov bx, DISK_ERR_10
;     call print
;     jmp inf_loop
; ERR_11:
;     mov bx, DISK_ERR_11
;     call print
;     jmp inf_loop
; ERR_20:
;     mov bx, DISK_ERR_20
;     call print
;     jmp inf_loop
; ERR_40:
;     mov bx, DISK_ERR_40
;     call print
;     jmp inf_loop
; ERR_80:
;     mov bx, DISK_ERR_80
;     call print
;     jmp inf_loop
; ERR_AA:
;     mov bx, DISK_ERR_AA
;     call print
;     jmp inf_loop
; ERR_BB:
;     mov bx, DISK_ERR_BB
;     call print
;     jmp inf_loop
; ERR_CC:
;     mov bx, DISK_ERR_CC
;     call print
;     jmp inf_loop
; ERR_E0:
;     mov bx, DISK_ERR_E0
;     call print
;     jmp inf_loop
; ERR_FF:
;     mov bx, DISK_ERR_FF
;     call print
;     jmp inf_loop

; ErrReadSegFromDisk:
;     mov bx, DISK_SEG_ERR
;     call print
;     jmp inf_loop
DISC_SUCCESS db 'Succes read disk', 0ah, 0dh, 0
DISC_ERR db 'Error read disk', 0ah, 0dh, 0
DISK_SEG_ERR db 'Error read some sectors of disk', 0ah, 0dh, 0

; DISK_ERR_01 db 'bad command passed to driver', 0ah, 0dh, 0
; DISK_ERR_02 db 'address mark not found or bad sector', 0ah, 0dh, 0
; DISK_ERR_03 db 'diskette write protect error', 0ah, 0dh, 0
; DISK_ERR_04 db 'sector not found', 0ah, 0dh, 0
; DISK_ERR_05 db 'fixed disk reset failed', 0ah, 0dh, 0
; DISK_ERR_06 db 'diskette changed or removed', 0ah, 0dh, 0
; DISK_ERR_07 db 'bad fixed disk parameter table', 0ah, 0dh, 0
; DISK_ERR_08 db 'DMA overrun', 0ah, 0dh, 0
; DISK_ERR_09 db 'DMA access across 64k boundary', 0ah, 0dh, 0
; DISK_ERR_0A db 'bad fixed disk sector flag', 0ah, 0dh, 0
; DISK_ERR_0B db 'bad fixed disk cylinder', 0ah, 0dh, 0
; DISK_ERR_0C db 'unsupported track/invalid media', 0ah, 0dh, 0
; DISK_ERR_0D db 'invalid number of sectors on fixed disk format', 0ah, 0dh, 0
; DISK_ERR_0E db 'fixed disk controlled data address mark detected', 0ah, 0dh, 0
; DISK_ERR_0F db 'fixed disk DMA arbitration level out of range', 0ah, 0dh, 0
; DISK_ERR_10 db 'ECC/CRC error on disk read', 0ah, 0dh, 0
; DISK_ERR_11 db 'recoverable fixed disk data error, data fixed by ECC', 0ah, 0dh, 0
; DISK_ERR_20 db 'controller error (NEC for floppies)', 0ah, 0dh, 0
; DISK_ERR_40 db 'seek failure', 0ah, 0dh, 0
; DISK_ERR_80 db 'time out, drive not ready', 0ah, 0dh, 0
; DISK_ERR_AA db 'fixed disk drive not ready', 0ah, 0dh, 0
; DISK_ERR_BB db 'fixed disk undefined error', 0ah, 0dh, 0
; DISK_ERR_CC db 'fixed disk write fault on selected drive', 0ah, 0dh, 0
; DISK_ERR_E0 db 'fixed disk status error/Error reg = 0', 0ah, 0dh, 0
; DISK_ERR_FF db 'sense operation failed', 0ah, 0dh, 0
