.model small
.stack 100h
.data
str db "ENTER A HEX DIGIT: $"
str1 db "IN DECIMAL IT IS: $"
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
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    cmp bl,61h
    jl uppercase
    
    sub bl,31h
    jmp end
    
    upp
    ercase:
    
    sub bl,11h
    
    end:
    mov ah,9
    lea dx,str1
    int 21h
    
    mov ah,2
    mov dl,31h
    int 21h
    mov dl,bl
    int 21h 
    
    mov ah,4ch
    int 21h
    
    main endp
end main
