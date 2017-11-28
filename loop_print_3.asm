.model small
.stack 100h
.data
var db '?'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov bl,'a'
    mov dh,1
    ;mov var,4
    
    mov cx,5
    
    top:
    
    jcxz end
    mov bh,0
    mov var,5
    mov bl,'A' 
    
    top1:
    
    mov ah,2
    mov dl,20h
    int 21h
    
    dec var
    
    top2:
    
    cmp var,dh
    jge top1
    
    mov dl,bl
    int 21h
    
    mov dl,20h
    int 21h
    
    inc bh
    inc bl
    
    cmp bh,dh
    jl top2
    
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
    
    end:
    
    mov ah,4ch
    int 21h
    main endp
end main
    
    