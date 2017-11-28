.model small
.stack 100h

.data

var              db '?'
var1             db '?'
var2             db '?'
var3             db '?'
var4             db '?'

previous         db '?'
mprevious        db '?'
printfirst       db '?'
printfirst1      db '?'
printingamount   db '?'
prprintingamount db '?'

str1             db "ENTER A STRING OF LETTERS :",0ah,0dh,0ah,0dh,'$'

str2             db "THE LONGEST CONSECUTIVE INCREASING STRING IS:",0ah,0dh,0ah,0dh,'$'

str3             db "NO LETTER IS IN THE STRING,TRY AGAIN...$"
  
str4             db "NO CONSECUTIVE INCREASING STRING IS IN THE STRING...$"

str5             db "THERE IS NO LARGEST CONSECUTIVE INCREASING STRING BUT THERE ARE",0ah,0dh,0ah,0dh,'$'

str6             db " LARGER SAME SIZE CONSECUTIVE INCREASING STRINGS IN THE STRING, EACH OF SIZE $"

        
.code
main proc
    
    mov ax,@data
    mov ds,ax 
    
    start:
    
    mov ah,9              ;printing string1
    lea dx,str1           ;asking for input
    int 21h
   
    mov var2,0            ;for counting inputs of capital letters var2 is taken 
                          ;and initialized by 0
    mov printingamount,1  ;for counting the characters of highest increasing string
                          ; printingamount is taken and var is for counting characters
                          ; of every increasing string
    mov var,1
    mov var3,1 
    
    input:
    
    mov ah,1              ;taking input
    int 21h 
    mov bl,al
    
    cmp bl,0dh            ;checking that whether the input is a carriage return or not
    je print
    
    cmp bl,'A'            ;checking the input is less than A or not.                    
    jl input              ;if less it's not a capital
                          
    cmp bl,'z'            ;checking the input is greater than Z or not.                     
    jg input 
    
    mov al,'['
    
    mov cx,6
    
    isbetween:
    
    jcxz notbetween
    cmp al,bl
    je input
    inc al
    loop isbetween
                          ;if greater it's not a capital
    notbetween:
    
    inc var2              ;since the input is capital,increasing var2 
    
    cmp var2,1            ;if the input is the first capita goto assign
    je assign
    
    mov bh,previous       ;increasing the previous input by 1 
    add bh,1              ;and it is the modified_previous(mprevious)
    mov mprevious,bh
   
    cmp bl,mprevious      ;if modified_previous is equal to current input
    je increase           ;then goto increase
    mov var,1
    
    mov previous,bl
    jmp input
     
     assign:
     
    mov previous,bl       ;assigning the first capital into privious
    jmp input             ;and going for second capital
    
    increase:
    
    cmp var,1             ;if the input is the second character 
    je printingfirst
                          ;of current increasing string then goto printfirst
    inc var               ;for fixing the first character of the current increasing string
    mov bh,var            ;else increasing the number of characters
    
    cmp bh,printingamount   
    jge printtobe
                          ; of current increasing string
    mov previous,bl
                          ;if the number of characters of current i.s. is more or equal
    jmp input             ;than previous longest i.s then goto print to be 
                          ;and fix new printings
    printingfirst:
    
    mov bh,previous
    mov printfirst,bh
                          ;Fixing previous input as the first character
    inc var               ;of current increasing string
    mov bh ,var
    
    cmp bh,printingamount
    jge printtobe
    
    mov previous,bl
    jmp input
    
    printtobe:
    
    mov bh,var
    cmp bh,printingamount
    
    je equal
    jmp notequal
    
    equal:
    
    mov var4,0 
    
    inc var3 
    
    mov bh,printingamount
    mov prprintingamount,bh
    
    mov bh,printfirst
    mov printfirst1,bh
                           ;fixing new longest increasing string's first character
    mov bh,var             ;and number of characters in the string
    mov printingamount,bh
    
    mov previous,bl
    jmp input
    
    notequal:
    
    cmp var4,0
    je decvar3
    jmp nodec
    
    decvar3:
    
    mov var3,1
    
    nodec:
    
    mov var4,1 
   
    mov bh,printfirst
    mov printfirst1,bh
                           ;fixing new longest increasing string's first character
    mov bh,var             ;and number of characters in the string
    mov printingamount,bh
    
    mov previous,bl
    jmp input
    
    print:
    
    mov ah,2
    mov dl,0ah
    int 21h                ;printing newline
    mov dl,0dh
    int 21h
    
    mov dl,0ah
    int 21h                ;printing newline
    mov dl,0dh
    int 21h
    
    mov bh,var2            ;if the var2 remains same and initial value of
    cmp bh,0               ;var2 does not change,
                           ;that indicates no letter was entered 
    je noletter               ;then go to nocap segement else go to nois
    jmp nois
    
    noletter:
    
    mov ah,9
    lea dx,str3            ;printing the" no capital entered" messege
    int 21h
    
    mov ah,2
    mov dl,0ah
    int 21h                ;printing newline
    mov dl,0dh
    int 21h
    
    mov dl,0ah
    int 21h                ;printing newline
    mov dl,0dh
    int 21h 
    
    jmp start                ;going to end
    
    nois:
    
    mov bh,printingamount  ;if the printingamount remains same and initial value of
    cmp bh,1
                           ;printingamount does not change,
    je  nois1              ;that indicates no increasing string was entered.
                           ;so go to nois1
    jmp is                 ;else goto is
    
    nois1:
    
    mov ah,9               ;printing the "no increasing string entered" string
    lea dx,str4
    int 21h
                           ;going to end
    jmp end
    
    is:
    
    cmp var4,0
    je is1
    
    mov ah,9
    lea dx,str2            ;printing string2
    int 21h 
    
    mov bh,printingamount
    
    top:
   
    cmp bh,0
    je end
    
    top1:
    
    mov ah,2               ;printing the largest increasing string
    mov dl,printfirst1
    int 21h
    
    inc printfirst1 
    dec bh
    
    jmp top
    
    is1:
    
    mov ah,9               
    lea dx,str5
    int 21h
    
    mov ah,2 
    mov bl,var3
    add bl,30h              
    mov dl,bl
    int 21h
    
    mov ah,9               
    lea dx,str6
    int 21h
    
    mov ah,2 
    mov bl,printingamount
    add bl,30h             
    mov dl,bl
    int 21h
    
    end:
    
    mov ah,4ch
    int 21h
    
    main endp
 end main