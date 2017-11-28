.model small
.stack 100h
.code
main proc
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,31h
    jl print
    
    cmp bl, 35h
    jg print
    
    jmp end
    
    print:
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov dl,bl
    int 21h
    
    end:
    mov ah,4ch
    int 21h
    main endp
end main