	.intel_syntax noprefix
        .text
        .global OR_FRAG
OR_FRAG:
        or rax, QWORD PTR[rbx]
        add rbx, 8
        ret
