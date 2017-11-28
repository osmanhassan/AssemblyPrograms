.model small
.stack 100h
.data

str db "**********",0ah,0dh
str1 db "$"
 .code
 main proc  
    
    mov ax,@data
    mov ds,ax
    
    mov bx,30h 
    
compare:
    
    cmp bx,39h
    jle output
    jmp end 
    
output:

    mov ah,9
    lea dx,str
    int 21h
    
    mov ah,2
    mov dl,07h
    int 21h    
    
    inc bx
    jmp compare
    
end:
    
    mov ah,4ch
    int 21h
    main endp
 end main
    
    
    