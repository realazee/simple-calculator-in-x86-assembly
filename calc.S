	.intel_syntax noprefix
	.section .data 
SUM_POSITIVE:
        .quad 0
        .global SUM_POSITIVE
SUM_NEGATIVE:
        .quad 0
        .global SUM_NEGATIVE
RAX_FINAL:
        .quad 0
    .section .text	
	.global _start

_start: #initializing rax, rbx, rcx to 0 and storing the address of the data to rbx
	xor rax, rax 
	xor rbx, rbx
	xor rcx, rcx
	mov rbx, OFFSET [CALC_DATA_BEGIN]

PARSE: #start of main loop, if cases check for what functions to call, calls the function then increments rbx and loops back
	mov cl, BYTE PTR [rbx]
	cmp cl, 0
	jz EXIT

IF_OR:
	cmp cl, '|' #compares the value in cl and determines if the byte matches "|", and goes on to the next if statement if it doesn't
	jne IF_AND
	add rbx, 8
	call OR_FRAG
	jmp PARSE

IF_AND:
	cmp cl, '&'
	jne IF_SUM
	add rbx, 8
	call AND_FRAG
	jmp PARSE
IF_SUM:
	cmp cl, 'S'
	jne IF_UPPER
	add rbx, 8
	call SUM_FRAG
	jmp PARSE
IF_UPPER:
	cmp cl, 'U'
	jne IF_ARRAYSUM
	add rbx, 8
	call UPPER_FRAG
	jmp PARSE
IF_ARRAYSUM:
	cmp cl, 'a'
	jne EXIT 
	add rbx, 8
	call ARRAYSUM_FRAG
	jmp PARSE

EXIT: #writes the values of rax, SUM_POSITIVE, SUM_NEGATIVE and memory between CALC_DATA_BEGIN and CALC_DATA_END, then exits the program
        mov rdi, 1
        mov QWORD PTR[RAX_FINAL], rax #stores rax into memory location RAX_FINAL
        mov rsi, OFFSET RAX_FINAL
        mov rdx, 8
	mov rax, 1
	syscall 

	mov rax, 1 #tells syscall that we are performing a write operation
	mov rdi, 1 #sets write output to stdout
	mov rsi, OFFSET SUM_POSITIVE #rsi stores the memory location of the items we will write
	mov rdx, 8 #rdx stores the length of the memory we need to write after the symbol specified in rsi
	syscall #performs a systemcall with the above defined parameters

	mov rax, 1
        mov rdi, 1
        mov rsi, OFFSET SUM_NEGATIVE
        mov rdx, 8
        syscall

	mov rcx, OFFSET CALC_DATA_BEGIN #next few lines calculates the distance between memory addresses CALC_DATA_BEGIN and CALC_DATA_END and stores this to rdx 
	mov rbx, OFFSET CALC_DATA_END
	sub rbx, rcx
	mov rax, 1
        mov rdi, 1
        mov rsi, OFFSET CALC_DATA_BEGIN
        mov rdx, rbx
        syscall

	mov rax, 60
	syscall
	
    
