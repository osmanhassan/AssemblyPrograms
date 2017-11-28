.model small
.stack 100h
.data
var db '?'
.code
 main proc
    mov ax,@data
    mov ds,ax
    
    mov var,1
    
    mov dh,1
    mov bl,'A'
    
    mov cx,5
    top:
       mov bl,'A'
       mov bh,6
       mov var,1
       top1:
        
        mov ah,2
        mov dl,bl
        int 21h
        mov dl,20h
        int 21h
        
        dec bh
        inc bl
        
        cmp bh,dh
        jg top1
        
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        inc dh
        
        top2:
        
        mov dl,20h
        int 21h
        
        inc var
        
        cmp var,dh
        jl top2
        
        ;inc dh
        
        loop top
        
        mov ah,4ch
        int 21h
        main endp
 end main
        
        
        
        
    
    