	.intel_syntax noprefix
	.section .text
	.global SUM_FRAG
SUM_FRAG:
        mov rdx, QWORD PTR[rbx]
	add rax, rdx
	add rbx, 8
	cmp rdx, 0
	

      	jge SUM_POS
	jle SUM_NEG	
SUM_POS:
	add QWORD PTR [SUM_POSITIVE], rdx
	ret
SUM_NEG:
	add QWORD PTR [SUM_NEGATIVE], rdx
	ret

	
