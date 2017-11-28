          .model small
.stack 100h
.data
str1 db "type a character :$"
str2 db "the ascii code of $"
var db '?' 
str3 db " in hex is $"

str4 db "the number of 1 bits is $"
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,str1
    int 21h
    
    mov ah,1
    int 21h
    mov var,al
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov ah,9
    lea dx,str2
    int 21h 
    
    mov ah,2
    mov dl,var
    int 21h
    
     mov ah,9
    lea dx,str3
    int 21h
    
    mov bh,0
    mov bl,30h
     
    mov ch,4 
    
    top:
    cmp bh,8
    jg end
    
    shl var,1
    
    jc cf 
    
    
    
    mov ah,2
    mov dl,30h 
    int 21h
    mov dl,20h
    int 21h
    
    inc bh
    
    jmp top
    
    cf:
    
    inc bl 
    mov ah,2
    mov dl,31h
    int 21h
    mov dl,20h
    int 21h 
    
    inc bh
    
    jmp top
    
    end: 
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov ah,9
    lea dx,str4
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h 
    
    mov ah,4ch
    int 21h
    
    main endp
end main
    