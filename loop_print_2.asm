.model small
.stack 100h
.code
main proc
    mov bl,'A'
    mov dh,4
    
    mov cx,4
    top:    
    jcxz end
    mov bh,0
    top1:
    mov ah,2
    mov dl,bl
    int 21h
    
    mov dl,20h
    int 21h
    
    inc bh
    cmp bh,dh
    jl top1
    
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h 
    
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    dec dh
    inc bl
    
    loop top
    
    end:
    mov ah,4ch
    int 21h
    
    main endp
end main
    