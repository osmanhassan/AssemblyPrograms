.model small
.stack 100h
.data
 str db "***********",0ah,0dh
 str1 db "$"
 str2 db "****"
 var1 db '?'
 var2 db '?'
 var3 db '?'
 str3 db "****",0ah,0dh
 str4 db "$" 
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,2
    mov dl,'?'
    int 21h
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov ah,1
    int 21h
    mov var1,al
    int 21h
    mov var2,al
    int 21h
    mov var3,al
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov bl,30h
    
    compare:
    cmp bl,35h
    jl output1
    jmp output2
    
    output1:
    mov ah,9
    lea dx,str
    int 21h
    inc bl
    jmp compare 
    
    output2:
    mov ah,9
    lea dx,str2
    int 21h
    mov bl,30h
    
    compare1:
    cmp bl,35h
    jl output3
    jmp end 
    
    output3:
    mov ah,9
    lea dx,str
    int 21h
    inc bl
    jmp compare1
    
    end:
    mov ah,2
    mov dl,07h
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main
    
    