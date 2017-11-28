.model small
.stack 100h
.data

str1 db 0ah,0dh,"The sum of "
var1 db '?'
str2 db " and "
var2 db '?'
str3 db " is: "
str4 db "$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    MOV ah,2
    mov dl,'?'
    int 21h
    
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov ah,1
    int 21h
    mov var1,al
    int 21h
    mov var2,al
    
    add bl,var1
    add bl,var2
    
    
    cmp bl,69h
    jg double    
    sub bl,30h
    
    mov ah,9
    lea dx,str1
    int 21h 
    
    mov ah,2
    mov dl,bl
    int 21h
    
    jmp end 
    
double:    
    sub bl,3ah
    
    mov ah,9
    lea dx,str1
    int 21h
    
    mov ah,2
    mov dl,31h
    int 21h
    mov dl,bl
    int 21h
    
end:
    mov ax,4ch
    int 21h
    main endp
end main
    
   
    
    