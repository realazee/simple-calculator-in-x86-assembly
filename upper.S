	.intel_syntax noprefix
	.section .text
	.global UPPER_FRAG

UPPER_FRAG:
    mov r8, QWORD PTR [rbx] 
    add rbx, 8
LOOP: #compares data stored in r8 byte by byte, goes to the next byte if not lowercase, converts the byte to uppercase if lowercase then goes to the next byte. 
   cmp BYTE PTR [r8], 0
   je UPPERFRAG_EXIT
   cmp BYTE PTR [r8], 97
   jl INC
   cmp BYTE PTR [r8], 122
   jg INC
   sub BYTE PTR [r8], 32
   jmp INC
 
INC: #increments r8, rax and jumps back to the beginning of the loop
   add r8, 1
   inc rax
   jmp LOOP
    
UPPERFRAG_EXIT:
   ret
    
