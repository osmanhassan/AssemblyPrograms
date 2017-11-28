.model small
.stack 100h
.code
main proc
    mov bl,41h
    
    mov bh,0
    mov dh,1
    
    mov cx,5
    top:
        
        mov bh,0
        mov bl,41h
        
        top1:
        
             mov ah,2
             mov dl,bl
             int 21h
             
             mov dl,20h
             int 21h
             
             inc bh
             inc bl
             
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
        
        inc dh
        
        loop top
        
        mov ah,4ch
        int 21h
        
        main endp

end main
    
