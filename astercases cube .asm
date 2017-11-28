.model small
.stack 100h
.code

part2 proc
    
 
 mov cx,4
 
 top: 
 
 cmp cx,0
 je return
 mov bh,cl
 mov bl,5
 sub bl,cl
 
 
 top1:
 cmp bl,0
 je print
 
 mov ah,2
 mov dl,20h
 int 21h
 dec bl
 jmp top1
 
 print:
 
 cmp bh,0
 je decri
 
 dec bh
 mov ah,2
 mov dl,'*'
 int 21h
 mov dl,20h
 int 21h
 jmp print
 
 decri:
 
 dec cx
 mov ah,2
 mov dl,0ah
 int 21h
 mov dl,0dh
 int 21h
 jmp top
 
 return:
 ret
 part2 endp
;end part2  
part1 proc
 mov cx,5
 topi: 
 
 cmp cx,0
 je returni
 mov bl,cl
 sub bl,1
 mov bh,5
 sub bh,bl
 
 topi1:
 cmp bl,0
 je printi
 
 mov ah,2
 mov dl,20h
 int 21h
 dec bl
 jmp topi1
 
 printi:
 
 cmp bh,0
 je decrii
 
 dec bh
 mov ah,2
 mov dl,'*'
 int 21h
 mov dl,20h
 int 21h
 jmp printi
 
 decrii:
 
 dec cx
 mov ah,2
 mov dl,0ah
 int 21h
 mov dl,0dh
 int 21h
 jmp topi
 
  returni:
  
  call part2
  ret
  part1 endp 
;end part1


 
main proc
   call part1 
   

 end:
 mov ah,4ch
 int 21h
 main endp
 end main
 