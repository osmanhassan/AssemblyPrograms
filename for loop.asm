.model small
.stack 100h
.code 
main proc
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov cx,10
     top:
     jcxz end
     mov ah,2
     mov dl,bl
     int 21h
     loop top
     
     mov bl,10 
     top1:
         mov ah,2
     mov dl,bl
     int 21h
     dec bl
     cmp bl,30h
     jg top1
     
     end:
     mov ah,4ch
     int 21h
     main endp
end main