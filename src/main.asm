bits 16
org 0x7C00



start:
        jmp main

puts:
    push si
    push ax

    .loop:
        lodsb           ; loads next char in AL
        or al, al
        jz .done
        mov ah, 0eh     ; teletype output
        mov bh, 0
        int 10h
        jmp .loop

    .done:        
    pop ax
    pop si
    ret





    main:
        mov ax,0 ; we cant write ds,es 
        mov ds,ax
        mov es,ax
;setup stack
    mov ss,ax
    mov sp,0x7C00        

MOV si,msg
call puts


hlt

.halt:

    jmp .halt

msg: db 'Hello, World!', 0

times 510-($-$$) db 0
dw 0xAA55