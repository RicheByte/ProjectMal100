; Educational Boot Sector Virus Simulation
; Designed for researchers and analysts to study boot sector virus mechanics
; WARNING: This code is for EDUCATIONAL PURPOSES ONLY. Do not run on a real system.
; Run only in a controlled emulator (e.g., QEMU or Bochs) with no real disk access.
; Released under MIT License with restrictions against malicious use.

org 0x7C00

; Virus simulation entry point
start:
    cli                 ; Disable interrupts (simulated)
    xor ax, ax          ; Zero out registers for clean state
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00      ; Set stack pointer below boot sector

    ; Simulate relocation to safe memory (0x0600)
    ; In a real virus, this moves the code to avoid being overwritten
    mov si, 0x7C00
    mov di, 0x0600
    mov cx, 512
    rep movsb
    call print_relocation ; Log relocation action

    ; Jump to relocated code
    jmp 0x0000:relocated

relocated:
    ; Simulate decryption of virus body (XOR with key 0x5A)
    ; Demonstrates basic encryption used in viruses for obfuscation
    mov si, encrypted_body
    mov di, si
    mov cx, encrypted_end - encrypted_body
    mov bl, 0x5A        ; Encryption key
decrypt_loop:
    lodsb
    xor al, bl
    stosb
    loop decrypt_loop
    call print_decryption ; Log decryption action

    ; Simulate saving original MBR
    ; In a real virus, this preserves the MBR for stealth
    mov si, 0x7C00
    mov di, original_mbr
    mov cx, 512
    rep movsb
    call print_mbr_save

    ; Simulate infecting other disks (no actual disk access)
    call simulate_infect_disks

    ; Display payload (prints 'X' to screen)
    mov ah, 0x0E
    mov al, 'X'
    int 0x10

    ; Simulate restoring and booting original MBR
    mov si, original_mbr
    mov di, 0x7C00
    mov cx, 512
    rep movsb
    call print_mbr_restore

    ; Halt execution (no real boot to avoid damage)
    jmp $

; Simulated infection routine (logs actions instead of infecting)
simulate_infect_disks:
    pusha
    ; Simulate reading a sector (originally BIOS int 0x13, AH=0x02)
    call print_read_attempt

    ; Simulate checking for infection (signature check)
    ; In a real virus, this prevents re-infection
    call print_signature_check

    ; Simulate polymorphic modification (XOR with pseudo-random key)
    rdtsc               ; Use timestamp counter for pseudo-randomness
    mov bl, al          ; Use low byte as new key
    mov si, encrypted_body
    mov cx, encrypted_end - encrypted_body
poly_loop:
    lodsb
    xor al, bl
    stosb
    loop poly_loop
    call print_polymorphism

    ; Simulate writing to disk (no actual write)
    call print_write_attempt

    popa
    ret

; Helper routines to log actions (simulated BIOS int 0x10 for output)
print_relocation:
    mov si, msg_relocation
    call print_string
    ret

print_decryption:
    mov si, msg_decryption
    call print_string
    ret

print_mbr_save:
    mov si, msg_mbr_save
    call print_string
    ret

print_mbr_restore:
    mov si, msg_mbr_restore
    call print_string
    ret

print_read_attempt:
    mov si, msg_read_attempt
    call print_string
    ret

print_signature_check:
    mov si, msg_signature_check
    call print_string
    ret

print_polymorphism:
    mov si, msg_polymorphism
    call print_string
    ret

print_write_attempt:
    mov si, msg_write_attempt
    call print_string
    ret

; Print string routine (BIOS int 0x10, AH=0x0E)
print_string:
    lodsb
    cmp al, 0
    je print_done
    mov ah, 0x0E
    int 0x10
    jmp print_string
print_done:
    ret

; Messages for simulation output
msg_relocation:      db "Simulating relocation to 0x0600...", 0x0D, 0x0A, 0
msg_decryption:      db "Simulating decryption of virus body...", 0x0D, 0x0A, 0
msg_mbr_save:        db "Simulating saving original MBR...", 0x0D, 0x0A, 0
msg_mbr_restore:     db "Simulating restoring original MBR...", 0x0D, 0x0A, 0
msg_read_attempt:    db "Simulating disk sector read...", 0x0D, 0x0A, 0
msg_signature_check: db "Simulating infection signature check...", 0x0D, 0x0A, 0
msg_polymorphism:    db "Simulating polymorphic modification...", 0x0D, 0x0A, 0
msg_write_attempt:   db "Simulating writing virus to disk...", 0x0D, 0x0A, 0

; Simulated encrypted virus body (decrypted at runtime)
encrypted_body:
    ; XOR-encrypted with key 0x5A (dummy data for demonstration)
    db 0xFF ^ 0x5A, 0xEE ^ 0x5A, 0xDD ^ 0x5A
encrypted_end:

; Storage for original MBR (simulated)
original_mbr:
    times 446 - ($ - $$) db 0  ; Space for virus code (before partition table)

; Partition table (dummy for example)
    db 0x80, 0x01, 0x01, 0x00, 0x83, 0xFE, 0xFF, 0xFF
    db 0x3F, 0x00, 0x00, 0x00, 0xC1, 0xF0, 0xFF, 0x00
    times 64 - 16 db 0  ; Remaining partition table entries

; Boot signature
    dw 0xAA55
