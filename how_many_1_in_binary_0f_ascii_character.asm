.model small
.stack 100h
.code
 main proc
    mov bl,0 
    
    mov ah,1
    int 21h 
    
    mov cx,8
    
    top:
    
    jcxz print
    shl al,1
    jc cf
    loop top
    
    cf:
    
    inc bl
    loop top
    
    print:
    
     mov ah,2
     add bl,30h
     mov dl,bl
     int 21h
     
     mov ah,4ch
     int 21h
     
     main endp
 end main
    