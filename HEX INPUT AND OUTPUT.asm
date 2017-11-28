.model small
.stack 100h
.code
main proc
    xor bx,bx
    mov cx,4
    input:
    
    cmp cx,0
    je print
    
    mov ah,1
    int 21h
    mov ah,0
    
    cmp al,0dh
    je print
    
    cmp al,'A'
    jnge number
    
    sub al,37h
    shl bx,4
    
    or bx,ax
    dec cx
    jmp input
    
    number:
    
    sub al,30h
    shl bx,4
    
    or bx,ax
    dec cx
    jmp input
    
    print:
    
    mov ah,2
    mov dl,0ah
    int 21h
    
    mov dl,0dh
    int 21h
    
    mov cx,4
    top:
    cmp cx,0
    je end
    
    mov dl,bh
    
    shr dl,4
    
    cmp dl,9
    jg A 
    
    add dl,30h
    
    mov ah,2
    int 21h
    
    dec cx
    shl bx,4
    jmp top 
    
    A:
    
    add dl,37h
    
    mov ah,2
    int 21h
    
    dec cx
    shl bx,4
    jmp top 
    
    end:
    
    mov ah,4ch
    int 21h
    
    main endp
end main

    
    
    
    