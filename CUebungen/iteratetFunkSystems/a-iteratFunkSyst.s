	.file	"iteratFunkSyst.c"
	.text
.Ltext0:
	.file 0 "/home/mathieu/CUebungen/iteratetFunkSystems" "./iteratFunkSyst.c"
	.globl	prozent
	.data
	.align 16
	.type	prozent, @object
	.size	prozent, 16
prozent:
	.long	85
	.long	92
	.long	99
	.long	100
	.globl	c
	.align 32
	.type	c, @object
	.size	c, 768
c:
	.long	858993459
	.long	1072378675
	.long	1889785610
	.long	1072106045
	.long	-687194767
	.long	1072525475
	.long	-755914244
	.long	1064329805
	.long	1202590843
	.long	1067743969
	.long	1889785610
	.long	-1079571907
	.long	-1717986918
	.long	1069128089
	.long	-755914244
	.long	1063281229
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1202590843
	.long	-1079739679
	.long	-1717986918
	.long	-1078355559
	.long	-343597384
	.long	1068415057
	.long	-755914244
	.long	1064329805
	.long	858993459
	.long	1072378675
	.long	-1717986918
	.long	1072273817
	.long	-858993459
	.long	1072483532
	.long	-1133871366
	.long	1063818100
	.long	-1717986918
	.long	1073322393
	.long	-858993459
	.long	1073007820
	.long	1717986918
	.long	1073636966
	.long	-1924145349
	.long	1065512599
	.long	858993459
	.long	-1077726413
	.long	-1717986918
	.long	-1076258407
	.long	-343597384
	.long	-1080117167
	.long	1202590843
	.long	1064598241
	.long	515396076
	.long	1070721925
	.long	-1717986918
	.long	1070176665
	.long	0
	.long	1071644672
	.long	-1133871366
	.long	1063818100
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	171798692
	.long	1070638039
	.long	-1717986918
	.long	1069128089
	.long	0
	.long	1071644672
	.long	1202590843
	.long	1064598241
	.long	-343597384
	.long	1070512209
	.long	-1717986918
	.long	1069128089
	.long	0
	.long	1071644672
	.long	-755914244
	.long	1064329805
	.long	-1030792151
	.long	1071393013
	.long	-1717986918
	.long	1069128089
	.long	0
	.long	1073741824
	.long	-755914244
	.long	1065378381
	.long	-1717986918
	.long	1070176665
	.long	-343597384
	.long	1067366481
	.long	-1717986918
	.long	1071225241
	.long	-755914244
	.long	1064329805
	.long	171798692
	.long	-1076845609
	.long	0
	.long	-1075838976
	.long	-343597384
	.long	1066317905
	.long	1202590843
	.long	1064598241
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-687194767
	.long	1070428323
	.long	-1717986918
	.long	1069128089
	.long	0
	.long	1071644672
	.long	824633721
	.long	1064086536
	.long	-1030792151
	.long	1070344437
	.long	-1717986918
	.long	1069128089
	.long	0
	.long	1071644672
	.long	34359738
	.long	1064732459
	.long	-1717986918
	.long	1073322393
	.long	-1717986918
	.long	1069128089
	.long	0
	.long	1073741824
	.long	34359738
	.long	1065781035
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1202590843
	.long	1069841121
	.long	-858993459
	.long	1073007820
	.long	1717986918
	.long	1073636966
	.long	824633721
	.long	1065135112
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.globl	farbe
	.align 32
	.type	farbe, @object
	.size	farbe, 96
farbe:
	.long	110
	.long	90
	.long	110
	.long	0
	.long	0
	.long	0
	.long	50
	.long	0
	.long	35
	.long	64
	.long	255
	.long	-16
	.long	35
	.long	0
	.long	50
	.long	-16
	.long	255
	.long	64
	.long	0
	.long	0
	.long	0
	.long	0
	.long	255
	.long	0
	.globl	calcPoints
	.bss
	.align 32
	.type	calcPoints, @object
	.size	calcPoints, 32000000
calcPoints:
	.zero	32000000
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.file 1 "./iteratFunkSyst.c"
	.loc 1 32 39
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	.loc 1 33 9
	movl	$0, %edi
	call	time@PLT
	.loc 1 33 3
	movl	%eax, %edi
	call	srand@PLT
	.loc 1 34 3
	call	sdlInit@PLT
	.loc 1 36 3
	call	sdlSetBlack@PLT
	.loc 1 38 10
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 38 21
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -56(%rbp)
	.loc 1 39 10
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -48(%rbp)
	.loc 1 39 21
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -40(%rbp)
	.loc 1 41 16
	pxor	%xmm0, %xmm0
	movsd	%xmm0, calcPoints(%rip)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, 8+calcPoints(%rip)
	movl	$0, 16+calcPoints(%rip)
	movl	$0, 20+calcPoints(%rip)
	movl	$0, 24+calcPoints(%rip)
.LBB2:
	.loc 1 43 11
	movl	$1, -80(%rbp)
	.loc 1 43 3
	jmp	.L2
.L17:
.LBB3:
	.loc 1 44 17
	call	rand@PLT
	.loc 1 44 9
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, -68(%rbp)
	movl	-68(%rbp), %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -68(%rbp)
	.loc 1 44 29
	movl	$0, -76(%rbp)
	.loc 1 45 5
	jmp	.L3
.L6:
	.loc 1 45 37 discriminator 3
	movl	-76(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	prozent(%rip), %rax
	movl	(%rdx,%rax), %eax
	.loc 1 45 29 discriminator 3
	cmpl	%eax, -68(%rbp)
	jg	.L28
	.loc 1 45 23 discriminator 1
	addl	$1, -76(%rbp)
.L3:
	.loc 1 45 15 discriminator 2
	cmpl	$3, -76(%rbp)
	jle	.L6
	jmp	.L5
.L28:
	.loc 1 45 54
	nop
.L5:
	.loc 1 47 22
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$6, %rax
	movq	%rax, %rdx
	leaq	c(%rip), %rax
	movsd	(%rdx,%rax), %xmm1
	.loc 1 47 40
	movl	-80(%rbp), %eax
	subl	$1, %eax
	.loc 1 47 43
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	.loc 1 47 27
	mulsd	%xmm0, %xmm1
	.loc 1 47 57
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$6, %rax
	movq	%rax, %rdx
	leaq	32+c(%rip), %rax
	movsd	(%rdx,%rax), %xmm2
	.loc 1 47 75
	movl	-80(%rbp), %eax
	subl	$1, %eax
	.loc 1 47 78
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	8+calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	.loc 1 47 62
	mulsd	%xmm2, %xmm0
	.loc 1 47 45
	addsd	%xmm0, %xmm1
	.loc 1 47 92
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$6, %rax
	movq	%rax, %rdx
	leaq	64+c(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	.loc 1 47 80
	addsd	%xmm0, %xmm1
	.loc 1 48 22
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$6, %rax
	movq	%rax, %rdx
	leaq	96+c(%rip), %rax
	movsd	(%rdx,%rax), %xmm2
	.loc 1 48 40
	movl	-80(%rbp), %eax
	subl	$1, %eax
	.loc 1 48 43
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	.loc 1 48 27
	mulsd	%xmm0, %xmm2
	.loc 1 48 57
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$6, %rax
	movq	%rax, %rdx
	leaq	128+c(%rip), %rax
	movsd	(%rdx,%rax), %xmm3
	.loc 1 48 75
	movl	-80(%rbp), %eax
	subl	$1, %eax
	.loc 1 48 78
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	8+calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	.loc 1 48 62
	mulsd	%xmm3, %xmm0
	.loc 1 48 45
	addsd	%xmm0, %xmm2
	.loc 1 48 92
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$6, %rax
	movq	%rax, %rdx
	leaq	160+c(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	.loc 1 48 80
	addsd	%xmm2, %xmm0
	.loc 1 46 18
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	%xmm1, (%rdx,%rax)
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	8+calcPoints(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	16+calcPoints(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	20+calcPoints(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	24+calcPoints(%rip), %rax
	movl	$0, (%rdx,%rax)
	.loc 1 50 7
	cmpl	$0, -80(%rbp)
	jle	.L16
	.loc 1 51 23
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	.loc 1 51 9
	comisd	-64(%rbp), %xmm0
	jbe	.L25
	.loc 1 52 13 discriminator 1
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 53 9 discriminator 1
	jmp	.L16
.L25:
	.loc 1 55 23
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm1
	.loc 1 55 9
	movsd	-56(%rbp), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L26
	.loc 1 56 13 discriminator 1
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	movsd	%xmm0, -56(%rbp)
	.loc 1 57 9 discriminator 1
	jmp	.L16
.L26:
	.loc 1 59 23
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	.loc 1 59 9
	comisd	-48(%rbp), %xmm0
	jbe	.L27
	.loc 1 60 13 discriminator 1
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	movsd	%xmm0, -48(%rbp)
	.loc 1 61 9 discriminator 1
	jmp	.L16
.L27:
	.loc 1 63 23
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm1
	.loc 1 63 9
	movsd	-40(%rbp), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L16
	.loc 1 64 13 discriminator 1
	movl	-80(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	movsd	%xmm0, -40(%rbp)
	.loc 1 65 9 discriminator 1
	nop
.L16:
.LBE3:
	.loc 1 43 29 discriminator 2
	addl	$1, -80(%rbp)
.L2:
	.loc 1 43 16 discriminator 1
	cmpl	$999998, -80(%rbp)
	jle	.L17
.LBE2:
.LBB4:
	.loc 1 69 11
	movl	$1, -72(%rbp)
	.loc 1 69 3
	jmp	.L18
.L19:
	.loc 1 71 33 discriminator 3
	movl	-72(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	8+calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	.loc 1 71 35 discriminator 3
	subsd	-48(%rbp), %xmm0
	.loc 1 71 47 discriminator 3
	movsd	-48(%rbp), %xmm1
	movapd	%xmm1, %xmm2
	subsd	-40(%rbp), %xmm2
	.loc 1 71 41 discriminator 3
	movapd	%xmm0, %xmm1
	divsd	%xmm2, %xmm1
	.loc 1 71 54 discriminator 3
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	.loc 1 70 5 discriminator 3
	cvttsd2sil	%xmm0, %esi
	.loc 1 70 33 discriminator 3
	movl	-72(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	calcPoints(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	.loc 1 70 35 discriminator 3
	subsd	-64(%rbp), %xmm0
	.loc 1 70 47 discriminator 3
	movsd	-64(%rbp), %xmm1
	movapd	%xmm1, %xmm2
	subsd	-56(%rbp), %xmm2
	.loc 1 70 41 discriminator 3
	movapd	%xmm0, %xmm1
	divsd	%xmm2, %xmm1
	.loc 1 70 54 discriminator 3
	movsd	.LC4(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	.loc 1 70 5 discriminator 3
	cvttsd2sil	%xmm0, %eax
	movl	$0, %r8d
	movl	$252, %ecx
	movl	$0, %edx
	movl	%eax, %edi
	call	sdlDrawPoint@PLT
	.loc 1 69 26 discriminator 3
	addl	$1, -72(%rbp)
.L18:
	.loc 1 69 16 discriminator 1
	cmpl	$999999, -72(%rbp)
	jle	.L19
.LBE4:
	.loc 1 74 3
	call	sdlUpdate@PLT
	.loc 1 75 3
	movl	$10000, %edi
	call	sdlMilliSleep@PLT
	.loc 1 77 3
	call	sdlExit@PLT
	movl	$0, %eax
	.loc 1 78 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	-2013235812
	.long	2117592124
	.align 8
.LC1:
	.long	-2013235812
	.long	-29891524
	.align 8
.LC3:
	.long	0
	.long	1082308608
	.align 8
.LC4:
	.long	0
	.long	1082718208
	.text
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.file 4 "./ifs-daten-header/farn.h"
	.file 5 "./sdlinterf.h"
	.file 6 "/usr/include/stdlib.h"
	.file 7 "/usr/include/time.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3a7
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x11
	.long	.LASF46
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x12
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x5
	.long	.LASF11
	.byte	0x2
	.byte	0xa0
	.byte	0x12
	.long	0x5f
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x13
	.long	0x72
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF12
	.byte	0x3
	.byte	0xa
	.byte	0x12
	.long	0x66
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0xa
	.long	0x79
	.uleb128 0xb
	.long	.LASF15
	.byte	0x20
	.byte	0x6
	.long	0xdb
	.uleb128 0x6
	.string	"x"
	.byte	0x7
	.byte	0xa
	.long	0xdb
	.byte	0
	.uleb128 0x6
	.string	"y"
	.byte	0x8
	.byte	0xa
	.long	0xdb
	.byte	0x8
	.uleb128 0x6
	.string	"R"
	.byte	0x9
	.byte	0x7
	.long	0x58
	.byte	0x10
	.uleb128 0x6
	.string	"G"
	.byte	0x9
	.byte	0x9
	.long	0x58
	.byte	0x14
	.uleb128 0x6
	.string	"B"
	.byte	0x9
	.byte	0xb
	.long	0x58
	.byte	0x18
	.byte	0
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.long	.LASF14
	.uleb128 0x5
	.long	.LASF15
	.byte	0x1
	.byte	0xa
	.byte	0x3
	.long	0x9d
	.uleb128 0xb
	.long	.LASF16
	.byte	0x20
	.byte	0xc
	.long	0x12a
	.uleb128 0x2
	.long	.LASF17
	.byte	0xd
	.byte	0xa
	.long	0xdb
	.byte	0
	.uleb128 0x2
	.long	.LASF18
	.byte	0xe
	.byte	0xa
	.long	0xdb
	.byte	0x8
	.uleb128 0x2
	.long	.LASF19
	.byte	0xf
	.byte	0xa
	.long	0xdb
	.byte	0x10
	.uleb128 0x2
	.long	.LASF20
	.byte	0x10
	.byte	0xa
	.long	0xdb
	.byte	0x18
	.byte	0
	.uleb128 0x5
	.long	.LASF16
	.byte	0x1
	.byte	0x11
	.byte	0x2
	.long	0xee
	.uleb128 0xb
	.long	.LASF21
	.byte	0x18
	.byte	0x13
	.long	0x18a
	.uleb128 0x2
	.long	.LASF22
	.byte	0x14
	.byte	0x7
	.long	0x58
	.byte	0
	.uleb128 0x2
	.long	.LASF23
	.byte	0x15
	.byte	0x7
	.long	0x58
	.byte	0x4
	.uleb128 0x2
	.long	.LASF24
	.byte	0x16
	.byte	0x7
	.long	0x58
	.byte	0x8
	.uleb128 0x2
	.long	.LASF25
	.byte	0x17
	.byte	0x7
	.long	0x58
	.byte	0xc
	.uleb128 0x2
	.long	.LASF26
	.byte	0x18
	.byte	0x7
	.long	0x58
	.byte	0x10
	.uleb128 0x2
	.long	.LASF27
	.byte	0x19
	.byte	0x7
	.long	0x58
	.byte	0x14
	.byte	0
	.uleb128 0x5
	.long	.LASF21
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.long	0x136
	.uleb128 0x7
	.long	0x58
	.long	0x1a6
	.uleb128 0x8
	.long	0x2e
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	.LASF28
	.byte	0x4
	.byte	0xc
	.byte	0x5
	.long	0x196
	.uleb128 0x9
	.byte	0x3
	.quad	prozent
	.uleb128 0x7
	.long	0x12a
	.long	0x1d2
	.uleb128 0x8
	.long	0x2e
	.byte	0x3
	.uleb128 0x8
	.long	0x2e
	.byte	0x5
	.byte	0
	.uleb128 0x14
	.string	"c"
	.byte	0x4
	.byte	0xf
	.byte	0x7
	.long	0x1bc
	.uleb128 0x9
	.byte	0x3
	.quad	c
	.uleb128 0x7
	.long	0x18a
	.long	0x1f6
	.uleb128 0x8
	.long	0x2e
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	.LASF29
	.byte	0x4
	.byte	0x39
	.byte	0xa
	.long	0x1e6
	.uleb128 0x9
	.byte	0x3
	.quad	farbe
	.uleb128 0x7
	.long	0xe2
	.long	0x21f
	.uleb128 0x15
	.long	0x2e
	.long	0xf423f
	.byte	0
	.uleb128 0xc
	.long	.LASF30
	.byte	0x1
	.byte	0x1e
	.byte	0x7
	.long	0x20c
	.uleb128 0x9
	.byte	0x3
	.quad	calcPoints
	.uleb128 0x9
	.long	.LASF31
	.byte	0x22
	.uleb128 0xd
	.long	.LASF33
	.byte	0x8f
	.long	0x24b
	.uleb128 0x3
	.long	0x58
	.byte	0
	.uleb128 0x9
	.long	.LASF32
	.byte	0x87
	.uleb128 0xd
	.long	.LASF34
	.byte	0x2e
	.long	0x275
	.uleb128 0x3
	.long	0x58
	.uleb128 0x3
	.long	0x58
	.uleb128 0x3
	.long	0x58
	.uleb128 0x3
	.long	0x58
	.uleb128 0x3
	.long	0x58
	.byte	0
	.uleb128 0x16
	.long	.LASF47
	.byte	0x6
	.value	0x1c6
	.byte	0xc
	.long	0x58
	.uleb128 0x9
	.long	.LASF35
	.byte	0x26
	.uleb128 0x9
	.long	.LASF36
	.byte	0x1d
	.uleb128 0x17
	.long	.LASF37
	.byte	0x6
	.value	0x1c8
	.byte	0xd
	.long	0x2a1
	.uleb128 0x3
	.long	0x35
	.byte	0
	.uleb128 0x18
	.long	.LASF48
	.byte	0x7
	.byte	0x4c
	.byte	0xf
	.long	0x85
	.long	0x2b7
	.uleb128 0x3
	.long	0x2b7
	.byte	0
	.uleb128 0xa
	.long	0x85
	.uleb128 0x19
	.long	.LASF49
	.byte	0x1
	.byte	0x20
	.byte	0x5
	.long	0x58
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x3a5
	.uleb128 0xe
	.long	.LASF38
	.byte	0xe
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0xe
	.long	.LASF39
	.byte	0x20
	.long	0x3a5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x4
	.long	.LASF40
	.byte	0x26
	.byte	0xa
	.long	0xdb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x4
	.long	.LASF41
	.byte	0x26
	.byte	0x15
	.long	0xdb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x4
	.long	.LASF42
	.byte	0x27
	.byte	0xa
	.long	0xdb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.long	.LASF43
	.byte	0x27
	.byte	0x15
	.long	0xdb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1a
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x386
	.uleb128 0xf
	.string	"i"
	.byte	0x2b
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x10
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x4
	.long	.LASF44
	.byte	0x2c
	.byte	0x9
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x4
	.long	.LASF45
	.byte	0x2c
	.byte	0x1d
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.byte	0
	.uleb128 0x10
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0xf
	.string	"i"
	.byte	0x45
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x98
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 32
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 11
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF22:
	.string	"proz_rot"
.LASF9:
	.string	"char"
.LASF15:
	.string	"point"
.LASF39:
	.string	"argv"
.LASF17:
	.string	"wert"
.LASF16:
	.string	"koeff"
.LASF33:
	.string	"sdlMilliSleep"
.LASF12:
	.string	"time_t"
.LASF4:
	.string	"unsigned char"
.LASF35:
	.string	"sdlSetBlack"
.LASF2:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF29:
	.string	"farbe"
.LASF46:
	.string	"GNU C17 11.3.0 -mtune=generic -march=x86-64 -g -pedantic-errors -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF18:
	.string	"min_wert"
.LASF11:
	.string	"__time_t"
.LASF48:
	.string	"time"
.LASF14:
	.string	"double"
.LASF24:
	.string	"proz_blau"
.LASF37:
	.string	"srand"
.LASF49:
	.string	"main"
.LASF44:
	.string	"randNum"
.LASF30:
	.string	"calcPoints"
.LASF27:
	.string	"dazu_blau"
.LASF3:
	.string	"unsigned int"
.LASF13:
	.string	"long long unsigned int"
.LASF25:
	.string	"dazu_rot"
.LASF40:
	.string	"xMax"
.LASF26:
	.string	"dazu_guen"
.LASF43:
	.string	"yMin"
.LASF38:
	.string	"argc"
.LASF20:
	.string	"schritt"
.LASF10:
	.string	"long long int"
.LASF31:
	.string	"sdlExit"
.LASF41:
	.string	"xMin"
.LASF23:
	.string	"proz_gruen"
.LASF7:
	.string	"short int"
.LASF34:
	.string	"sdlDrawPoint"
.LASF42:
	.string	"yMax"
.LASF8:
	.string	"long int"
.LASF36:
	.string	"sdlInit"
.LASF21:
	.string	"farbinfo"
.LASF6:
	.string	"signed char"
.LASF45:
	.string	"index"
.LASF19:
	.string	"max_wert"
.LASF32:
	.string	"sdlUpdate"
.LASF28:
	.string	"prozent"
.LASF47:
	.string	"rand"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"./iteratFunkSyst.c"
.LASF1:
	.string	"/home/mathieu/CUebungen/iteratetFunkSystems"
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
