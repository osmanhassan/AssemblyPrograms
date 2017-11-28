.model small
.stack 100h
.data
var db '?'
.code
main proc
    mov ax,@data
    mov ds,ax
     
    mov var,0
    mov bl,0
    mov ch,0
    input:
    mov ah,1
    int 21h
    
    cmp al,0dh
    je output
    cmp al,2dh
    jne nominus
     
    mov var,al
    jmp input
    
    nominus:
   
    xor ah,ah
    
    mov cl,al
    sub cl,30h
    
    mov al,bl
     mov bl,10
     imul bl
     mov bl,al 
     add bl,cl
     jmp input
     
     output:
     
     cmp bl,0
     je print 
     
     cbw
     mov al,bl
     mov cl,10
     idiv cl
     
     mov bl,al
     mov dl,ah
     add dl,30h
     push dx
     inc ch
     jmp output
     
     print:
     
     mov bl,var
     cmp bl,2dh
     jne notpush
     push bx
     add ch,1
     
     notpush:
     
     mov ah,2
     mov dl,0ah
     int 21h
     mov dl,0dh
     int 21h
     
     print1:
     
     cmp ch,0
     je end
     pop bx
     mov ah,2
     mov dl,bl
     int 21h
     dec ch
     jmp print1
     
     end:
     mov ah,4ch
     int 21h
     
     main endp
end main