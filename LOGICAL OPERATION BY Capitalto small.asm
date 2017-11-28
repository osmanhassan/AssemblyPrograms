.model small
.stack 100h
.code
main proc
    mov ah,1
    int 21h
    mov bl,al
    
    XOR bl,20h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main