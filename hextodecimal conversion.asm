.model small
.stack 100h
.code 
main proc
    
    input:
    
     mov ah,1
    int 21h 
    mov bl,al
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
     cmp bl,'y'
    je number
     
    cmp bl,'Y'
    je number  
    
    cmp bl,'N'
    je end
    
    cmp bl,'n'
    je end
    
    number:
    cmp bl,0
    jl back_input
    
    cmp bl,39h
    jg char
    
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
    
    char:
    cmp bl,41h
    jl back_input
    
    cmp bl,46h
    jg  back_input
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    mov dl,31h
    int 21h
    
    sub bl,11h
    mov dl,bl
    int 21h
    
     mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h                                 
    
    back_input:
    
    
    
    jmp input
   
    
    end:
    mov ah,4ch
    int 21h
    main endp
end main