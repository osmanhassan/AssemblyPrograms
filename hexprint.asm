.model small
.stack 100h
.code 
main proc 
    mov ah,1
    int 21h
    
    mov dl,al
    mov cl,dl
    
    shr dl,4
    
    cmp dl,9
    jg print
    
    mov ah,2
    add dl,30h
    int 21h
    
    jmp part2
     
    print:
    
    mov ah,2
    add dl,37h
    int 21h
    
    part2:
    
    ror cl,4
    shr cl,4
    
    cmp cl,9
    jg print1
    
    mov ah,2
    add cl,30h
    mov dl,cl
    int 21h
    
    jmp end
    
    print1:
    
    mov ah,2
    add cl,37h
    mov dl,cl
    int 21h
    
    end:
    
    mov ah,4ch
    int 21h
    
    main endp
end main
     
    