.model small
.stack 100h
.code
main proc
    mov bh,30h
    
    mov bl,80h
     
    
    mov cx,128
     
    
    top:
    jcxz end
     
    mov ah,2 
    mov dl,bl
    int 21h
    mov dl,20h
    int 21h
    
    cmp bl,0ffh
    jg end 
    
    inc bh
    inc bl
    
    cmp bh,39h
    jle top 
    
    mov bh,30h
     
    mov ah,2
    mov dl,0ah
    int 21h 
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
     
     
     
    loop top 
    
    end:
    mov ah,4ch
    int 21h
    main endp
end main