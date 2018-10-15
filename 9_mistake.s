	.file	"9_mistake.c"
	.text
	.globl	xor
	.type	xor, @function
xor:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %ecx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	xorl	$1, %ecx
	movl	%ecx, %edx
	movb	%dl, (%rax)
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L3
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	xor, .-xor
	.section	.rodata
.LC0:
	.string	"/home/mistake/password"
.LC1:
	.string	"can't open password %d\n"
.LC2:
	.string	"do not bruteforce..."
.LC3:
	.string	"read error"
.LC4:
	.string	"input password : "
.LC5:
	.string	"%10s"
.LC6:
	.string	"Password OK"
.LC7:
	.string	"/bin/cat flag\n"
.LC8:
	.string	"Wrong Password"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$256, %edx
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	shrl	$31, %eax
	movzbl	%al, %eax
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	je	.L5
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L10
.L5:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, %edi
	movl	$0, %eax
	call	time@PLT
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %edi
	movl	$0, %eax
	call	sleep@PLT
	leaq	-30(%rbp), %rcx
	movl	-40(%rbp), %eax
	movl	$10, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	movl	$0, %eax
	call	read@PLT
	testl	%eax, %eax
	setg	%al
	movzbl	%al, %eax
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jne	.L7
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	movl	$0, %eax
	call	close@PLT
	movl	$0, %eax
	jmp	.L10
.L7:
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-19(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-19(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	xor
	leaq	-19(%rbp), %rcx
	leaq	-30(%rbp), %rax
	movl	$10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L8
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	system@PLT
	jmp	.L9
.L8:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
.L9:
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	movl	$0, %eax
	call	close@PLT
	movl	$0, %eax
.L10:
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
