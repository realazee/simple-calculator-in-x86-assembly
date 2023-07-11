	.intel_syntax noprefix
	.section .text
	.global ARRAYSUM_FRAG
ARRAYSUM_FRAG:
	mov r8, QWORD PTR [rbx]
	add rbx, 8
	push rbx
	mov rbx, QWORD PTR [rbx]

COMPUTESUM:
	cmp r8, 0
	je ARRAYSUM_EXIT
	call SUM_FRAG
	dec r8
	jmp COMPUTESUM

ARRAYSUM_EXIT:
	pop rbx
	add rbx, 8
	ret
	
