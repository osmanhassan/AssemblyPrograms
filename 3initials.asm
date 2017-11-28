.model small
.stack 100h
.data
str db "enter three initials: $",
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,str
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    int 21h
    mov bh,al
    int 21h
    mov cl,al
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    mov dl,bl
    int 21h
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    mov dl,bh
    int 21h
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    mov dl,cl
    int 21h 
    main endp
end main
    
    