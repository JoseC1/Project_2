;
; file: asm_main.asm

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data

A: dd 10 ;Declaring my A integer and setting its value to 10
B: dd 5 ;Declaring my B integer and setting its value to 5
C: dd 7 ;Declaring my C integer and setting its value to 7 
D: dd 9 ;Declaring my D integer and setting its value to 9


; uninitialized data is put in the .bss segment
;
segment .bss

;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
; next print out result message as series of steps

mov eax, 0 ; Zeroing out eax before using it 
mov ebx, 0 ; Zeroing out ebx before using it 
mov ecx, 0 ; Zeroing out ecx before using it 

;Going to do the first operation (A-B)
mov eax, DWORD[A] ;Moving the context of my A integer in my eax register
mov ebx, DWORD[B] ;Moving the context of my B integer in my ebx register

sub eax, ebx ; I am subbing eax = A - B and saving it in eax 

;Now im going to do the second operation (answer) + A and add A 
mov ebx,DWORD[A] ; I AM Moving the context of A into ebx register
add eax, ebx ;This eax = (Answer) + A saving our answer in the eax register
;Note Right now eax holds the value of (A-B) + A


;Now im going to do (B-C+D) and break it up into two steps 

mov ebx, DWORD[B] ;Im moving the values of B into my ebx register
mov ecx, DWORD[C] ;Im movng the values of C into my ecx Register
sub ebx,ecx ;This is performing B-C and storing its value in the ebx Register 

;Now im going to add my D value to the ebx register
mov ecx, DWORD[D] ;Im moving the value of D into my ecx register
add ebx, ecx ;This is adding D to the answer I got from the B-C operation 
;Note Right now ebx holds the value of (B-C+D) 


;Last Step is to add eax and ebx together and saving the answer in the A variable
add eax, ebx ;This does (A-B)+A + (B-C+D) and saves it in eax register



mov [A], eax ;This moves what evers in the eax register back into A Completing the assignment

call print_int ; this prints the eax register and also subsequently prints The value A holds 
call print_nl

        popa
        mov     eax, 0            ; return back to C
        leave
        ret
