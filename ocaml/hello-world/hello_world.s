	.file ""
	.data
	.globl	_camlHello_world__data_begin
_camlHello_world__data_begin:
	.text
	.globl	_camlHello_world__code_begin
_camlHello_world__code_begin:
	nop
	.data
	.align	3
	.data
	.align	3
	.quad	4087
_camlHello_world__1:
	.quad	_caml_curry2
	.quad	5
	.quad	_camlHello_world__positive_sum_80
	.data
	.align	3
	.quad	1792
	.globl	_camlHello_world
_camlHello_world:
	.quad	1
	.data
	.align	3
	.globl	_camlHello_world__gc_roots
_camlHello_world__gc_roots:
	.quad	_camlHello_world
	.quad	0
	.text
	.align	4
	.globl	_camlHello_world__positive_sum_80
_camlHello_world__positive_sum_80:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
L102:
	movq	%rbx, (%rsp)
	movl	$1, %ebx
	call	_camlStdlib__max_46
L100:
	movq	%rax, 8(%rsp)
	movl	$1, %ebx
	movq	(%rsp), %rax
	call	_camlStdlib__max_46
L101:
	movq	8(%rsp), %rbx
	leaq	-1(%rbx,%rax), %rax
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.text
	.align	4
	.globl	_camlHello_world__entry
_camlHello_world__entry:
	.cfi_startproc
L103:
	leaq	_camlHello_world__1(%rip), %rax
	movq	%rax, _camlHello_world(%rip)
	movl	$1, %eax
	ret
	.cfi_endproc
	.data
	.align	3
	.text
	nop
	.globl	_camlHello_world__code_end
_camlHello_world__code_end:
	.data
				/* relocation table start */
	.align	3
				/* relocation table end */
	.data
	.quad	0
	.globl	_camlHello_world__data_end
_camlHello_world__data_end:
	.quad	0
	.align	3
	.globl	_camlHello_world__frametable
_camlHello_world__frametable:
	.quad	2
	.quad	L101
	.word	33
	.word	1
	.word	8
	.align	2
	.set L$set$1, (L104 - .) + 0
	.long	L$set$1
	.align	3
	.quad	L100
	.word	33
	.word	1
	.word	0
	.align	2
	.set L$set$2, (L105 - .) + 0
	.long	L$set$2
	.align	3
	.align	2
L104:
	.set L$set$3, (L107 - .) + -2080374784
	.long	L$set$3
	.long	8608
	.align	2
L105:
	.set L$set$4, (L107 - .) + 1140850688
	.long	L$set$4
	.long	8352
L106:
	.ascii	"hello_world.ml\0"
	.align	2
L107:
	.set L$set$5, (L106 - .) + 0
	.long	L$set$5
	.ascii	"Hello_world.positive_sum\0"
	.align	3
