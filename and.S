	.intel_syntax noprefix
	.text
	.global AND_FRAG
AND_FRAG:
	and rax, QWORD PTR[rbx]
	add rbx, 8
	ret
 





