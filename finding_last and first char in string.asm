.model small
.stack 100h
.data
var1 db '?'
;var2 db '?'
str1 db "enter the string",0ah,0dh,'$'
str2 db "No capital $"
str3 db "first:"
str db "$"
str4 db "last:"
var2 db '?'
str5 db "$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,str1
    int 21h
     
    mov bh,0
    input:
    
    mov ah,1
    int 21h 
    mov bl,al
    
    cmp bl,0dh
    je print
    
    cmp bl,41h
    jl input
    
    cmp bl,'Z'
    jg input
    
    inc bh
    
    cmp bh,1
    je assign
    
    
    cmp bl,var1
    jl first
    
    cmp bl,var2
    jg last
    
    jmp input          
    assign:
    mov var1,bl
    mov var2,bl
    jmp input
    
    first:
    mov var1,bl
    jmp input
    last:
    mov var2,bl
    jmp input 
    
    print:
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    cmp bh,0
    je nocap
    
    mov ah,9
    lea dx,str3
    int 21h 
    
    mov ah,2
    mov dl,var1
    int 21h
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
     mov ah,9
    lea dx,str4
    int 21h
    jmp end
    
    nocap:
    mov ah,9
    lea dx,str2
    int 21h
    
    end:
    mov ah,4ch
    int 21h
    main endp 
end main
    
    
    
    
    