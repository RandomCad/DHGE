	.file	"sdlinterf.c"
	.text
.Ltext0:
	.file 0 "/home/mathieu/CUebungen/iteratetFunkSystems" "./sdlinterf.c"
	.data
	.align 4
	.type	minX, @object
	.size	minX, 4
minX:
	.long	9999
	.align 4
	.type	maxX, @object
	.size	maxX, 4
maxX:
	.long	-1
	.align 4
	.type	minY, @object
	.size	minY, 4
minY:
	.long	9999
	.align 4
	.type	maxY, @object
	.size	maxY, 4
maxY:
	.long	-1
	.local	myWindow
	.comm	myWindow,8,8
	.local	myRenderer
	.comm	myRenderer,8,8
	.local	myTexture
	.comm	myTexture,8,8
	.local	myPixArray
	.comm	myPixArray,1920000,32
	.local	colormap
	.comm	colormap,2304,32
	.section	.rodata
	.align 8
.LC0:
	.string	"Could not initialize SDL: %s.\n"
.LC1:
	.string	"SDL Graphics"
	.align 8
.LC2:
	.string	"Could not create SDL Window: %s\n"
	.align 8
.LC3:
	.string	"Could not create SDL Renderer: %s\n"
	.align 8
.LC4:
	.string	"Could not set SDL blend mode: %s.\n"
	.text
	.globl	sdlInit
	.type	sdlInit, @function
sdlInit:
.LFB4209:
	.file 1 "./sdlinterf.c"
	.loc 1 36 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 37 7
	movl	$32, %edi
	call	SDL_Init@PLT
	.loc 1 37 6
	testl	%eax, %eax
	je	.L2
	.loc 1 38 5
	call	SDL_GetError@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 39 5
	movl	$1, %edi
	call	exit@PLT
.L2:
	.loc 1 41 3
	movq	SDL_Quit@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	atexit@PLT
	.loc 1 43 14
	movl	$0, %r9d
	movl	$600, %r8d
	movl	$800, %ecx
	movl	$536805376, %edx
	movl	$536805376, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	SDL_CreateWindow@PLT
	.loc 1 43 12
	movq	%rax, myWindow(%rip)
	.loc 1 46 16
	movq	myWindow(%rip), %rax
	.loc 1 46 6
	testq	%rax, %rax
	jne	.L3
	.loc 1 47 5
	call	SDL_GetError@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 48 5
	movl	$1, %edi
	call	exit@PLT
.L3:
	.loc 1 50 16
	movq	myWindow(%rip), %rax
	movl	$0, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	SDL_CreateRenderer@PLT
	.loc 1 50 14
	movq	%rax, myRenderer(%rip)
	.loc 1 54 18
	movq	myRenderer(%rip), %rax
	.loc 1 54 6
	testq	%rax, %rax
	jne	.L4
	.loc 1 55 5
	call	SDL_GetError@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 56 5
	movl	$1, %edi
	call	exit@PLT
.L4:
	.loc 1 58 15
	movq	myRenderer(%rip), %rax
	movl	$600, %r8d
	movl	$800, %ecx
	movl	$1, %edx
	movl	$372645892, %esi
	movq	%rax, %rdi
	call	SDL_CreateTexture@PLT
	.loc 1 58 13
	movq	%rax, myTexture(%rip)
	.loc 1 61 17
	movq	myTexture(%rip), %rax
	.loc 1 61 6
	testq	%rax, %rax
	jne	.L5
	.loc 1 62 5
	call	SDL_GetError@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 63 5
	movl	$1, %edi
	call	exit@PLT
.L5:
	.loc 1 65 7
	movq	myTexture(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	SDL_SetTextureBlendMode@PLT
	.loc 1 65 6
	testl	%eax, %eax
	je	.L6
	.loc 1 66 5
	call	SDL_GetError@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 67 5
	movl	$1, %edi
	call	exit@PLT
.L6:
	.loc 1 70 3
	call	sdlSetBlack
.LBB2:
	.loc 1 97 12
	movl	$0, -4(%rbp)
	.loc 1 97 3
	jmp	.L7
.L8:
	.loc 1 98 19 discriminator 3
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	colormap(%rip), %rax
	movl	$255, (%rdx,%rax)
	.loc 1 99 23 discriminator 3
	movl	-4(%rbp), %eax
	leal	0(,%rax,8), %ecx
	.loc 1 99 19 discriminator 3
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	4+colormap(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	.loc 1 100 19 discriminator 3
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	8+colormap(%rip), %rax
	movl	$0, (%rdx,%rax)
	.loc 1 101 34 discriminator 3
	movl	-4(%rbp), %eax
	leal	0(,%rax,8), %edx
	.loc 1 101 17 discriminator 3
	movl	-4(%rbp), %eax
	addl	$32, %eax
	.loc 1 101 30 discriminator 3
	movl	$255, %ecx
	subl	%edx, %ecx
	.loc 1 101 24 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	colormap(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	.loc 1 102 17 discriminator 3
	movl	-4(%rbp), %eax
	addl	$32, %eax
	.loc 1 102 24 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	4+colormap(%rip), %rax
	movl	$255, (%rdx,%rax)
	.loc 1 103 17 discriminator 3
	movl	-4(%rbp), %eax
	addl	$32, %eax
	.loc 1 103 24 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	8+colormap(%rip), %rax
	movl	$0, (%rdx,%rax)
	.loc 1 104 17 discriminator 3
	movl	-4(%rbp), %eax
	addl	$64, %eax
	.loc 1 104 24 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	colormap(%rip), %rax
	movl	$0, (%rdx,%rax)
	.loc 1 105 17 discriminator 3
	movl	-4(%rbp), %eax
	addl	$64, %eax
	.loc 1 105 24 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	4+colormap(%rip), %rax
	movl	$255, (%rdx,%rax)
	.loc 1 106 17 discriminator 3
	movl	-4(%rbp), %eax
	leal	64(%rax), %edx
	.loc 1 106 28 discriminator 3
	movl	-4(%rbp), %eax
	leal	0(,%rax,8), %ecx
	.loc 1 106 24 discriminator 3
	movslq	%edx, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	8+colormap(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	.loc 1 107 17 discriminator 3
	movl	-4(%rbp), %eax
	addl	$96, %eax
	.loc 1 107 24 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	colormap(%rip), %rax
	movl	$0, (%rdx,%rax)
	.loc 1 108 34 discriminator 3
	movl	-4(%rbp), %eax
	leal	0(,%rax,8), %edx
	.loc 1 108 17 discriminator 3
	movl	-4(%rbp), %eax
	addl	$96, %eax
	.loc 1 108 30 discriminator 3
	movl	$255, %ecx
	subl	%edx, %ecx
	.loc 1 108 24 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	4+colormap(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	.loc 1 109 17 discriminator 3
	movl	-4(%rbp), %eax
	addl	$96, %eax
	.loc 1 109 24 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	8+colormap(%rip), %rax
	movl	$255, (%rdx,%rax)
	.loc 1 110 18 discriminator 3
	movl	-4(%rbp), %eax
	leal	128(%rax), %edx
	.loc 1 110 29 discriminator 3
	movl	-4(%rbp), %eax
	leal	0(,%rax,8), %ecx
	.loc 1 110 25 discriminator 3
	movslq	%edx, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	colormap(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	.loc 1 111 18 discriminator 3
	movl	-4(%rbp), %eax
	subl	$-128, %eax
	.loc 1 111 25 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	4+colormap(%rip), %rax
	movl	$0, (%rdx,%rax)
	.loc 1 112 18 discriminator 3
	movl	-4(%rbp), %eax
	subl	$-128, %eax
	.loc 1 112 25 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	8+colormap(%rip), %rax
	movl	$255, (%rdx,%rax)
	.loc 1 113 18 discriminator 3
	movl	-4(%rbp), %eax
	addl	$160, %eax
	.loc 1 113 25 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	colormap(%rip), %rax
	movl	$255, (%rdx,%rax)
	.loc 1 114 18 discriminator 3
	movl	-4(%rbp), %eax
	addl	$160, %eax
	.loc 1 114 25 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	4+colormap(%rip), %rax
	movl	$0, (%rdx,%rax)
	.loc 1 115 35 discriminator 3
	movl	-4(%rbp), %eax
	leal	0(,%rax,8), %edx
	.loc 1 115 18 discriminator 3
	movl	-4(%rbp), %eax
	addl	$160, %eax
	.loc 1 115 31 discriminator 3
	movl	$255, %ecx
	subl	%edx, %ecx
	.loc 1 115 25 discriminator 3
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	8+colormap(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	.loc 1 97 27 discriminator 3
	addl	$1, -4(%rbp)
.L7:
	.loc 1 97 21 discriminator 1
	cmpl	$31, -4(%rbp)
	jle	.L8
.LBE2:
	.loc 1 118 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4209:
	.size	sdlInit, .-sdlInit
	.globl	sdlExit
	.type	sdlExit, @function
sdlExit:
.LFB4210:
	.loc 1 121 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 122 3
	call	SDL_Quit@PLT
	.loc 1 123 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4210:
	.size	sdlExit, .-sdlExit
	.type	getPixVal, @function
getPixVal:
.LFB4211:
	.loc 1 126 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	.loc 1 128 22
	movl	-4(%rbp), %eax
	sall	$16, %eax
	andl	$16711680, %eax
	movl	%eax, %edx
	.loc 1 128 43
	movl	-8(%rbp), %eax
	sall	$8, %eax
	movzwl	%ax, %eax
	.loc 1 128 29
	orl	%eax, %edx
	.loc 1 128 54
	movl	-12(%rbp), %eax
	movzbl	%al, %eax
	.loc 1 128 49
	orl	%edx, %eax
	.loc 1 128 62
	orl	$-16777216, %eax
	.loc 1 129 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4211:
	.size	getPixVal, .-getPixVal
	.type	putPixel, @function
putPixel:
.LFB4212:
	.loc 1 132 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	.loc 1 133 16
	movl	-8(%rbp), %eax
	imull	$800, %eax, %edx
	.loc 1 133 22
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	.loc 1 133 27
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	myPixArray(%rip), %rdx
	movl	-12(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	.loc 1 134 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4212:
	.size	putPixel, .-putPixel
	.globl	sdlSetBlack
	.type	sdlSetBlack, @function
sdlSetBlack:
.LFB4213:
	.loc 1 137 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 138 18
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	getPixVal
	movl	%eax, -12(%rbp)
.LBB3:
	.loc 1 140 16
	leaq	myPixArray(%rip), %rax
	movq	%rax, -8(%rbp)
	.loc 1 140 3
	jmp	.L14
.L15:
	.loc 1 141 8 discriminator 3
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 140 60 discriminator 3
	addq	$4, -8(%rbp)
.L14:
	.loc 1 140 47 discriminator 1
	leaq	1920000+myPixArray(%rip), %rax
	.loc 1 140 34 discriminator 1
	cmpq	%rax, -8(%rbp)
	jb	.L15
.LBE3:
	.loc 1 145 8
	movl	$0, minX(%rip)
	.loc 1 146 8
	movl	$0, minY(%rip)
	.loc 1 147 8
	movl	$799, maxX(%rip)
	.loc 1 148 8
	movl	$599, maxY(%rip)
	.loc 1 149 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4213:
	.size	sdlSetBlack, .-sdlSetBlack
	.section	.rodata
.LC5:
	.string	"Point %d/%d is offscreen\n"
	.text
	.globl	sdlDrawPoint
	.type	sdlDrawPoint, @function
sdlDrawPoint:
.LFB4214:
	.loc 1 152 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	.loc 1 153 6
	cmpl	$0, -4(%rbp)
	js	.L17
	.loc 1 153 15 discriminator 1
	cmpl	$799, -4(%rbp)
	jg	.L17
	.loc 1 153 29 discriminator 2
	cmpl	$0, -8(%rbp)
	js	.L17
	.loc 1 154 15
	cmpl	$599, -8(%rbp)
	jle	.L18
.L17:
	.loc 1 155 5
	movq	stderr(%rip), %rax
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %edx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 156 5
	movl	$1, %edi
	call	exit@PLT
.L18:
	.loc 1 159 3
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	getPixVal
	movl	%eax, %edx
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	putPixel
	.loc 1 162 9
	movl	minX(%rip), %eax
	.loc 1 162 6
	cmpl	%eax, -4(%rbp)
	jge	.L19
	.loc 1 162 22 discriminator 1
	movl	-4(%rbp), %eax
	movl	%eax, minX(%rip)
.L19:
	.loc 1 163 9
	movl	minY(%rip), %eax
	.loc 1 163 6
	cmpl	%eax, -8(%rbp)
	jge	.L20
	.loc 1 163 22 discriminator 1
	movl	-8(%rbp), %eax
	movl	%eax, minY(%rip)
.L20:
	.loc 1 164 9
	movl	maxX(%rip), %eax
	.loc 1 164 6
	cmpl	%eax, -4(%rbp)
	jle	.L21
	.loc 1 164 22 discriminator 1
	movl	-4(%rbp), %eax
	movl	%eax, maxX(%rip)
.L21:
	.loc 1 165 9
	movl	maxY(%rip), %eax
	.loc 1 165 6
	cmpl	%eax, -8(%rbp)
	jle	.L23
	.loc 1 165 22 discriminator 1
	movl	-8(%rbp), %eax
	movl	%eax, maxY(%rip)
.L23:
	.loc 1 166 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4214:
	.size	sdlDrawPoint, .-sdlDrawPoint
	.globl	sdlDrawCyclicPoint
	.type	sdlDrawCyclicPoint, @function
sdlDrawCyclicPoint:
.LFB4215:
	.loc 1 169 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	.loc 1 170 6
	cmpl	$0, -28(%rbp)
	jns	.L25
	.loc 1 171 5
	movl	-24(%rbp), %esi
	movl	-20(%rbp), %eax
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	%eax, %edi
	call	sdlDrawPoint
	.loc 1 176 1
	jmp	.L27
.L25:
.LBB4:
	.loc 1 173 44
	movl	-28(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	sarl	$5, %eax
	movl	%ecx, %esi
	sarl	$31, %esi
	subl	%esi, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$6, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	.loc 1 173 20
	movslq	%edx, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	colormap(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	.loc 1 174 5
	movq	-8(%rbp), %rax
	movl	8(%rax), %edi
	movq	-8(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movl	-24(%rbp), %esi
	movl	-20(%rbp), %eax
	movl	%edi, %r8d
	movl	%eax, %edi
	call	sdlDrawPoint
.L27:
.LBE4:
	.loc 1 176 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4215:
	.size	sdlDrawCyclicPoint, .-sdlDrawCyclicPoint
	.section	.rodata
	.align 8
.LC6:
	.string	"Rect (%d/%d +- %d/%d) offscreen.\n"
	.text
	.globl	sdlDrawRect
	.type	sdlDrawRect, @function
sdlDrawRect:
.LFB4216:
	.loc 1 180 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -68(%rbp)
	movl	%esi, -72(%rbp)
	movl	%edx, -76(%rbp)
	movl	%ecx, -80(%rbp)
	movl	%r8d, -84(%rbp)
	movl	%r9d, -88(%rbp)
	.loc 1 181 7
	movl	-68(%rbp), %eax
	subl	-76(%rbp), %eax
	movl	%eax, -52(%rbp)
	.loc 1 182 7
	movl	-72(%rbp), %eax
	subl	-80(%rbp), %eax
	movl	%eax, -48(%rbp)
	.loc 1 183 7
	movl	-68(%rbp), %edx
	movl	-76(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -44(%rbp)
	.loc 1 184 7
	movl	-72(%rbp), %edx
	movl	-80(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -40(%rbp)
	.loc 1 186 6
	cmpl	$0, -76(%rbp)
	js	.L29
	.loc 1 186 18 discriminator 1
	cmpl	$0, -80(%rbp)
	js	.L29
	.loc 1 186 32 discriminator 2
	cmpl	$0, -52(%rbp)
	js	.L29
	.loc 1 187 20
	cmpl	$0, -48(%rbp)
	js	.L29
	.loc 1 187 36 discriminator 1
	cmpl	$799, -44(%rbp)
	jg	.L29
	.loc 1 188 22
	cmpl	$599, -40(%rbp)
	jle	.L30
.L29:
	.loc 1 189 5
	movq	stderr(%rip), %rax
	movl	-80(%rbp), %edi
	movl	-76(%rbp), %esi
	movl	-72(%rbp), %ecx
	movl	-68(%rbp), %edx
	movl	%edi, %r9d
	movl	%esi, %r8d
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 191 5
	movl	$1, %edi
	call	exit@PLT
.L30:
	.loc 1 194 18
	movl	-88(%rbp), %ecx
	movl	-84(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	getPixVal
	movl	%eax, -36(%rbp)
	.loc 1 197 35
	movl	-40(%rbp), %eax
	imull	$800, %eax, %eax
	.loc 1 197 41
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	.loc 1 197 11
	leaq	myPixArray(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
.LBB5:
	.loc 1 198 41
	movl	-48(%rbp), %eax
	imull	$800, %eax, %eax
	.loc 1 198 47
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	.loc 1 198 16
	leaq	myPixArray(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	.loc 1 198 3
	jmp	.L31
.L34:
.LBB6:
	.loc 1 202 28
	movl	-76(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	.loc 1 202 13
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
.LBB7:
	.loc 1 203 18
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 203 5
	jmp	.L32
.L33:
	.loc 1 204 11 discriminator 3
	movq	-24(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 203 39 discriminator 3
	addq	$4, -24(%rbp)
.L32:
	.loc 1 203 30 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jbe	.L33
.LBE7:
.LBE6:
	.loc 1 200 11
	addq	$3200, -32(%rbp)
.L31:
	.loc 1 199 11
	movq	-32(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jbe	.L34
.LBE5:
	.loc 1 209 14
	movl	minX(%rip), %eax
	.loc 1 209 6
	cmpl	%eax, -52(%rbp)
	jge	.L35
	.loc 1 209 27 discriminator 1
	movl	-52(%rbp), %eax
	movl	%eax, minX(%rip)
.L35:
	.loc 1 210 14
	movl	minY(%rip), %eax
	.loc 1 210 6
	cmpl	%eax, -48(%rbp)
	jge	.L36
	.loc 1 210 27 discriminator 1
	movl	-48(%rbp), %eax
	movl	%eax, minY(%rip)
.L36:
	.loc 1 211 13
	movl	maxX(%rip), %eax
	.loc 1 211 6
	cmpl	%eax, -44(%rbp)
	jle	.L37
	.loc 1 211 26 discriminator 1
	movl	-44(%rbp), %eax
	movl	%eax, maxX(%rip)
.L37:
	.loc 1 212 13
	movl	maxY(%rip), %eax
	.loc 1 212 6
	cmpl	%eax, -40(%rbp)
	jle	.L39
	.loc 1 212 26 discriminator 1
	movl	-40(%rbp), %eax
	movl	%eax, maxY(%rip)
.L39:
	.loc 1 213 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4216:
	.size	sdlDrawRect, .-sdlDrawRect
	.section	.rodata
	.align 8
.LC7:
	.string	"Rect (%d/%d ... %d/%d) offscreen.\n"
	.text
	.globl	sdlDrawRectFromTo
	.type	sdlDrawRectFromTo, @function
sdlDrawRectFromTo:
.LFB4217:
	.loc 1 217 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -68(%rbp)
	movl	%esi, -72(%rbp)
	movl	%edx, -76(%rbp)
	movl	%ecx, -80(%rbp)
	movl	%r8d, -84(%rbp)
	movl	%r9d, -88(%rbp)
	.loc 1 218 7
	movl	-76(%rbp), %edx
	movl	-68(%rbp), %eax
	cmpl	%eax, %edx
	cmovle	%edx, %eax
	movl	%eax, -52(%rbp)
	.loc 1 219 7
	movl	-80(%rbp), %edx
	movl	-72(%rbp), %eax
	cmpl	%eax, %edx
	cmovle	%edx, %eax
	movl	%eax, -48(%rbp)
	.loc 1 220 7
	movl	-68(%rbp), %edx
	movl	-76(%rbp), %eax
	cmpl	%eax, %edx
	cmovge	%edx, %eax
	movl	%eax, -44(%rbp)
	.loc 1 221 7
	movl	-72(%rbp), %edx
	movl	-80(%rbp), %eax
	cmpl	%eax, %edx
	cmovge	%edx, %eax
	movl	%eax, -40(%rbp)
	.loc 1 223 6
	cmpl	$0, -52(%rbp)
	js	.L41
	.loc 1 223 20 discriminator 1
	cmpl	$0, -48(%rbp)
	js	.L41
	.loc 1 223 36 discriminator 2
	cmpl	$799, -44(%rbp)
	jg	.L41
	.loc 1 224 22
	cmpl	$599, -40(%rbp)
	jle	.L42
.L41:
	.loc 1 225 5
	movq	stderr(%rip), %rax
	movl	-80(%rbp), %edi
	movl	-76(%rbp), %esi
	movl	-72(%rbp), %ecx
	movl	-68(%rbp), %edx
	movl	%edi, %r9d
	movl	%esi, %r8d
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 226 5
	movl	$1, %edi
	call	exit@PLT
.L42:
	.loc 1 229 18
	movl	-88(%rbp), %ecx
	movl	-84(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	getPixVal
	movl	%eax, -36(%rbp)
	.loc 1 232 35
	movl	-40(%rbp), %eax
	imull	$800, %eax, %eax
	.loc 1 232 41
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	.loc 1 232 11
	leaq	myPixArray(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
.LBB8:
	.loc 1 233 41
	movl	-48(%rbp), %eax
	imull	$800, %eax, %eax
	.loc 1 233 47
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	.loc 1 233 16
	leaq	myPixArray(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	.loc 1 233 3
	jmp	.L43
.L46:
.LBB9:
	.loc 1 237 30
	movl	-44(%rbp), %eax
	subl	-52(%rbp), %eax
	cltq
	.loc 1 237 21
	leaq	0(,%rax,4), %rdx
	.loc 1 237 13
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
.LBB10:
	.loc 1 238 18
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 238 5
	jmp	.L44
.L45:
	.loc 1 239 11 discriminator 3
	movq	-24(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 238 39 discriminator 3
	addq	$4, -24(%rbp)
.L44:
	.loc 1 238 30 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jbe	.L45
.LBE10:
.LBE9:
	.loc 1 235 11
	addq	$3200, -32(%rbp)
.L43:
	.loc 1 234 11
	movq	-32(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jbe	.L46
.LBE8:
	.loc 1 244 14
	movl	minX(%rip), %eax
	.loc 1 244 6
	cmpl	%eax, -52(%rbp)
	jge	.L47
	.loc 1 244 27 discriminator 1
	movl	-52(%rbp), %eax
	movl	%eax, minX(%rip)
.L47:
	.loc 1 245 14
	movl	minY(%rip), %eax
	.loc 1 245 6
	cmpl	%eax, -48(%rbp)
	jge	.L48
	.loc 1 245 27 discriminator 1
	movl	-48(%rbp), %eax
	movl	%eax, minY(%rip)
.L48:
	.loc 1 246 13
	movl	maxX(%rip), %eax
	.loc 1 246 6
	cmpl	%eax, -44(%rbp)
	jle	.L49
	.loc 1 246 26 discriminator 1
	movl	-44(%rbp), %eax
	movl	%eax, maxX(%rip)
.L49:
	.loc 1 247 13
	movl	maxY(%rip), %eax
	.loc 1 247 6
	cmpl	%eax, -40(%rbp)
	jle	.L51
	.loc 1 247 26 discriminator 1
	movl	-40(%rbp), %eax
	movl	%eax, maxY(%rip)
.L51:
	.loc 1 248 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4217:
	.size	sdlDrawRectFromTo, .-sdlDrawRectFromTo
	.section	.rodata
	.align 8
.LC8:
	.string	"Line %d/%d  - %d/%d is offscreen\n"
	.text
	.globl	sdlDrawLine
	.type	sdlDrawLine, @function
sdlDrawLine:
.LFB4218:
	.loc 1 251 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	%edx, -60(%rbp)
	movl	%ecx, -64(%rbp)
	movl	%r8d, -68(%rbp)
	movl	%r9d, -72(%rbp)
	.loc 1 252 6
	cmpl	$0, -52(%rbp)
	js	.L53
	.loc 1 252 16 discriminator 1
	cmpl	$799, -52(%rbp)
	jg	.L53
	.loc 1 252 31 discriminator 2
	cmpl	$0, -56(%rbp)
	js	.L53
	.loc 1 253 16
	cmpl	$599, -56(%rbp)
	jg	.L53
	.loc 1 253 31 discriminator 1
	cmpl	$0, -60(%rbp)
	js	.L53
	.loc 1 254 16
	cmpl	$799, -60(%rbp)
	jg	.L53
	.loc 1 254 31 discriminator 1
	cmpl	$0, -64(%rbp)
	js	.L53
	.loc 1 255 16
	cmpl	$599, -64(%rbp)
	jle	.L54
.L53:
	.loc 1 256 5
	movq	stderr(%rip), %rax
	movl	-64(%rbp), %edi
	movl	-60(%rbp), %esi
	movl	-56(%rbp), %ecx
	movl	-52(%rbp), %edx
	movl	%edi, %r9d
	movl	%esi, %r8d
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 258 5
	movl	$1, %edi
	call	exit@PLT
.L54:
	.loc 1 263 6
	movl	-52(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jg	.L55
	.loc 1 264 12
	movl	minX(%rip), %eax
	.loc 1 264 8
	cmpl	%eax, -52(%rbp)
	jge	.L56
	.loc 1 264 25 discriminator 1
	movl	-52(%rbp), %eax
	movl	%eax, minX(%rip)
.L56:
	.loc 1 265 12
	movl	maxX(%rip), %eax
	.loc 1 265 8
	cmpl	%eax, -60(%rbp)
	jle	.L57
	.loc 1 265 25 discriminator 1
	movl	-60(%rbp), %eax
	movl	%eax, maxX(%rip)
	jmp	.L57
.L55:
	.loc 1 267 12
	movl	minX(%rip), %eax
	.loc 1 267 8
	cmpl	%eax, -60(%rbp)
	jge	.L58
	.loc 1 267 25 discriminator 1
	movl	-60(%rbp), %eax
	movl	%eax, minX(%rip)
.L58:
	.loc 1 268 12
	movl	maxX(%rip), %eax
	.loc 1 268 8
	cmpl	%eax, -52(%rbp)
	jle	.L57
	.loc 1 268 25 discriminator 1
	movl	-52(%rbp), %eax
	movl	%eax, maxX(%rip)
.L57:
	.loc 1 270 6
	movl	-56(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jg	.L59
	.loc 1 271 12
	movl	minY(%rip), %eax
	.loc 1 271 8
	cmpl	%eax, -56(%rbp)
	jge	.L60
	.loc 1 271 25 discriminator 1
	movl	-56(%rbp), %eax
	movl	%eax, minY(%rip)
.L60:
	.loc 1 272 12
	movl	maxY(%rip), %eax
	.loc 1 272 8
	cmpl	%eax, -64(%rbp)
	jle	.L61
	.loc 1 272 25 discriminator 1
	movl	-64(%rbp), %eax
	movl	%eax, maxY(%rip)
	jmp	.L61
.L59:
	.loc 1 274 12
	movl	minY(%rip), %eax
	.loc 1 274 8
	cmpl	%eax, -64(%rbp)
	jge	.L62
	.loc 1 274 25 discriminator 1
	movl	-64(%rbp), %eax
	movl	%eax, minY(%rip)
.L62:
	.loc 1 275 12
	movl	maxY(%rip), %eax
	.loc 1 275 8
	cmpl	%eax, -56(%rbp)
	jle	.L61
	.loc 1 275 25 discriminator 1
	movl	-56(%rbp), %eax
	movl	%eax, maxY(%rip)
.L61:
	.loc 1 278 18
	movl	-72(%rbp), %ecx
	movl	-68(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	getPixVal
	movl	%eax, -24(%rbp)
	.loc 1 280 27
	movl	-64(%rbp), %eax
	subl	-56(%rbp), %eax
	.loc 1 280 20
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	.loc 1 280 42
	movl	-60(%rbp), %eax
	subl	-52(%rbp), %eax
	.loc 1 280 35
	movl	%eax, %ecx
	negl	%ecx
	cmovns	%ecx, %eax
	.loc 1 280 7
	cmpl	%eax, %edx
	setg	%al
	movb	%al, -37(%rbp)
	.loc 1 281 6
	cmpb	$0, -37(%rbp)
	je	.L63
.LBB11:
	.loc 1 283 7
	movl	-52(%rbp), %eax
	movl	%eax, -20(%rbp)
	.loc 1 283 16
	movl	-56(%rbp), %eax
	movl	%eax, -52(%rbp)
	.loc 1 283 25
	movl	-20(%rbp), %eax
	movl	%eax, -56(%rbp)
	.loc 1 284 7
	movl	-60(%rbp), %eax
	movl	%eax, -20(%rbp)
	.loc 1 284 16
	movl	-64(%rbp), %eax
	movl	%eax, -60(%rbp)
	.loc 1 284 25
	movl	-20(%rbp), %eax
	movl	%eax, -64(%rbp)
.L63:
.LBE11:
	.loc 1 286 6
	movl	-52(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jle	.L64
.LBB12:
	.loc 1 288 7
	movl	-52(%rbp), %eax
	movl	%eax, -16(%rbp)
	.loc 1 288 16
	movl	-60(%rbp), %eax
	movl	%eax, -52(%rbp)
	.loc 1 288 25
	movl	-16(%rbp), %eax
	movl	%eax, -60(%rbp)
	.loc 1 289 7
	movl	-56(%rbp), %eax
	movl	%eax, -16(%rbp)
	.loc 1 289 16
	movl	-64(%rbp), %eax
	movl	%eax, -56(%rbp)
	.loc 1 289 25
	movl	-16(%rbp), %eax
	movl	%eax, -64(%rbp)
.L64:
.LBE12:
	.loc 1 291 7
	movl	-60(%rbp), %eax
	subl	-52(%rbp), %eax
	movl	%eax, -12(%rbp)
	.loc 1 292 23
	movl	-64(%rbp), %eax
	subl	-56(%rbp), %eax
	.loc 1 292 7
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	movl	%eax, -8(%rbp)
	.loc 1 293 7
	movl	-12(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -36(%rbp)
	.loc 1 294 7
	movl	-56(%rbp), %eax
	movl	%eax, -32(%rbp)
	.loc 1 295 29
	movl	-56(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jge	.L65
	.loc 1 295 29 is_stmt 0 discriminator 1
	movl	$1, %eax
	jmp	.L66
.L65:
	.loc 1 295 29 discriminator 2
	movl	$-1, %eax
.L66:
	.loc 1 295 7 is_stmt 1 discriminator 4
	movl	%eax, -4(%rbp)
.LBB13:
	.loc 1 296 12 discriminator 4
	movl	-52(%rbp), %eax
	movl	%eax, -28(%rbp)
	.loc 1 296 3 discriminator 4
	jmp	.L67
.L71:
	.loc 1 297 9
	cmpb	$0, -37(%rbp)
	je	.L68
	.loc 1 297 21 discriminator 1
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %ecx
	movl	-32(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	putPixel
	jmp	.L69
.L68:
	.loc 1 298 11
	movl	-24(%rbp), %edx
	movl	-32(%rbp), %ecx
	movl	-28(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	putPixel
.L69:
	.loc 1 299 12
	movl	-8(%rbp), %eax
	subl	%eax, -36(%rbp)
	.loc 1 300 9
	cmpl	$0, -36(%rbp)
	jns	.L70
	.loc 1 301 10
	movl	-4(%rbp), %eax
	addl	%eax, -32(%rbp)
	.loc 1 302 14
	movl	-12(%rbp), %eax
	addl	%eax, -36(%rbp)
.L70:
	.loc 1 296 29 discriminator 2
	addl	$1, -28(%rbp)
.L67:
	.loc 1 296 22 discriminator 1
	movl	-28(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jle	.L71
.LBE13:
	.loc 1 305 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4218:
	.size	sdlDrawLine, .-sdlDrawLine
	.type	drawCircLine, @function
drawCircLine:
.LFB4219:
	.loc 1 309 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$40, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movl	%r9d, -40(%rbp)
	.loc 1 310 6
	cmpl	$0, -28(%rbp)
	jns	.L73
	.loc 1 310 18 discriminator 1
	movl	$0, -28(%rbp)
.L73:
	.loc 1 311 6
	cmpl	$0, -36(%rbp)
	jns	.L74
	.loc 1 311 16 discriminator 1
	movl	$0, -36(%rbp)
.L74:
	.loc 1 312 7
	movl	-24(%rbp), %eax
	subl	-36(%rbp), %eax
	movl	%eax, -8(%rbp)
	.loc 1 313 7
	movl	-24(%rbp), %edx
	movl	-36(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	.loc 1 314 12
	movl	16(%rbp), %eax
	andl	$1, %eax
	.loc 1 314 6
	testl	%eax, %eax
	je	.L75
	.loc 1 315 8
	movl	$0, -32(%rbp)
	jmp	.L76
.L75:
	.loc 1 316 13
	movl	-32(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jle	.L76
	.loc 1 317 8
	movl	-28(%rbp), %eax
	movl	%eax, -32(%rbp)
.L76:
.LBB14:
	.loc 1 320 12
	movl	-28(%rbp), %eax
	movl	%eax, -12(%rbp)
	.loc 1 320 3
	jmp	.L77
.L82:
	.loc 1 321 14
	movl	16(%rbp), %eax
	andl	$8, %eax
	.loc 1 321 8
	testl	%eax, %eax
	je	.L78
	.loc 1 322 7
	movl	-20(%rbp), %eax
	subl	-12(%rbp), %eax
	movl	-40(%rbp), %edx
	movl	-8(%rbp), %ecx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	putPixel
.L78:
	.loc 1 323 14
	movl	16(%rbp), %eax
	andl	$2, %eax
	.loc 1 323 8
	testl	%eax, %eax
	je	.L79
	.loc 1 324 7
	movl	-20(%rbp), %edx
	movl	-12(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-40(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	%ecx, %edi
	call	putPixel
.L79:
	.loc 1 325 14
	movl	16(%rbp), %eax
	andl	$16, %eax
	.loc 1 325 8
	testl	%eax, %eax
	je	.L80
	.loc 1 326 7
	movl	-20(%rbp), %eax
	subl	-12(%rbp), %eax
	movl	-40(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	putPixel
.L80:
	.loc 1 327 14
	movl	16(%rbp), %eax
	andl	$4, %eax
	.loc 1 327 8
	testl	%eax, %eax
	je	.L81
	.loc 1 328 7
	movl	-20(%rbp), %edx
	movl	-12(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-40(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	%ecx, %edi
	call	putPixel
.L81:
	.loc 1 320 29 discriminator 2
	subl	$1, -12(%rbp)
.L77:
	.loc 1 320 22 discriminator 1
	movl	-12(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jge	.L82
.LBE14:
	.loc 1 330 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4219:
	.size	drawCircLine, .-drawCircLine
	.globl	sdlDrawCirc
	.type	sdlDrawCirc, @function
sdlDrawCirc:
.LFB4220:
	.loc 1 334 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	movl	%r9d, -24(%rbp)
	.loc 1 335 3
	movl	-24(%rbp), %r9d
	movl	-20(%rbp), %r8d
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %eax
	pushq	$31
	movl	16(%rbp), %edi
	pushq	%rdi
	movl	%eax, %edi
	call	sdlDrawCircPart
	addq	$16, %rsp
	.loc 1 337 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4220:
	.size	sdlDrawCirc, .-sdlDrawCirc
	.section	.rodata
	.align 8
.LC9:
	.string	"Circ %d/%d +- %d/%d is offscreen\n"
	.text
	.globl	sdlDrawCircPart
	.type	sdlDrawCircPart, @function
sdlDrawCircPart:
.LFB4221:
	.loc 1 341 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movl	%edi, -84(%rbp)
	movl	%esi, -88(%rbp)
	movl	%edx, -92(%rbp)
	movl	%ecx, -96(%rbp)
	movl	%r8d, -100(%rbp)
	movl	%r9d, -104(%rbp)
	.loc 1 342 32
	movl	24(%rbp), %eax
	andl	$24, %eax
	.loc 1 342 51
	testl	%eax, %eax
	je	.L85
	.loc 1 342 51 is_stmt 0 discriminator 1
	movl	-92(%rbp), %edx
	jmp	.L86
.L85:
	.loc 1 342 51 discriminator 2
	movl	$0, %edx
.L86:
	.loc 1 342 7 is_stmt 1 discriminator 4
	movl	-84(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, -28(%rbp)
	.loc 1 343 33 discriminator 4
	movl	24(%rbp), %eax
	andl	$10, %eax
	.loc 1 343 51 discriminator 4
	testl	%eax, %eax
	je	.L87
	.loc 1 343 51 is_stmt 0 discriminator 1
	movl	-96(%rbp), %edx
	jmp	.L88
.L87:
	.loc 1 343 51 discriminator 2
	movl	$0, %edx
.L88:
	.loc 1 343 7 is_stmt 1 discriminator 4
	movl	-88(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, -24(%rbp)
	.loc 1 344 33 discriminator 4
	movl	24(%rbp), %eax
	andl	$6, %eax
	.loc 1 344 51 discriminator 4
	testl	%eax, %eax
	je	.L89
	.loc 1 344 51 is_stmt 0 discriminator 1
	movl	-92(%rbp), %eax
	jmp	.L90
.L89:
	.loc 1 344 51 discriminator 2
	movl	$0, %eax
.L90:
	.loc 1 344 7 is_stmt 1 discriminator 4
	movl	-84(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
	.loc 1 345 33 discriminator 4
	movl	24(%rbp), %eax
	andl	$20, %eax
	.loc 1 345 52 discriminator 4
	testl	%eax, %eax
	je	.L91
	.loc 1 345 52 is_stmt 0 discriminator 1
	movl	-96(%rbp), %eax
	jmp	.L92
.L91:
	.loc 1 345 52 discriminator 2
	movl	$0, %eax
.L92:
	.loc 1 345 7 is_stmt 1 discriminator 4
	movl	-88(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -16(%rbp)
	.loc 1 346 6 discriminator 4
	cmpl	$0, -92(%rbp)
	js	.L93
	.loc 1 346 18 discriminator 1
	cmpl	$0, -96(%rbp)
	js	.L93
	.loc 1 346 32 discriminator 2
	cmpl	$0, -28(%rbp)
	js	.L93
	.loc 1 347 19
	cmpl	$0, -24(%rbp)
	js	.L93
	.loc 1 347 35 discriminator 1
	cmpl	$799, -20(%rbp)
	jg	.L93
	.loc 1 348 23
	cmpl	$599, -16(%rbp)
	jle	.L94
.L93:
	.loc 1 349 5
	movq	stderr(%rip), %rax
	movl	-96(%rbp), %edi
	movl	-92(%rbp), %esi
	movl	-88(%rbp), %ecx
	movl	-84(%rbp), %edx
	movl	%edi, %r9d
	movl	%esi, %r8d
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 351 5
	movl	$1, %edi
	call	exit@PLT
.L94:
	.loc 1 354 18
	movl	-104(%rbp), %ecx
	movl	-100(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	getPixVal
	movl	%eax, -12(%rbp)
	.loc 1 357 6
	cmpl	$0, -92(%rbp)
	jne	.L95
	.loc 1 357 19 discriminator 1
	cmpl	$0, -96(%rbp)
	jne	.L95
	.loc 1 358 5
	movl	-12(%rbp), %edx
	movl	-88(%rbp), %ecx
	movl	-84(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	putPixel
	jmp	.L96
.L95:
.LBB15:
	.loc 1 360 25
	movl	-92(%rbp), %eax
	imull	%eax, %eax
	.loc 1 360 9
	addl	%eax, %eax
	movl	%eax, -8(%rbp)
	.loc 1 361 25
	movl	-96(%rbp), %eax
	imull	%eax, %eax
	.loc 1 361 9
	addl	%eax, %eax
	movl	%eax, -4(%rbp)
	.loc 1 362 9
	movl	-92(%rbp), %eax
	movl	%eax, -68(%rbp)
	.loc 1 363 9
	movl	$0, -64(%rbp)
	.loc 1 364 21
	movl	-96(%rbp), %eax
	imull	%eax, %eax
	.loc 1 364 37
	movl	-92(%rbp), %edx
	leal	(%rdx,%rdx), %ecx
	.loc 1 364 33
	movl	$1, %edx
	subl	%ecx, %edx
	.loc 1 364 9
	imull	%edx, %eax
	movl	%eax, -60(%rbp)
	.loc 1 365 9
	movl	-92(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, -56(%rbp)
	.loc 1 366 9
	movl	$0, -52(%rbp)
	.loc 1 367 9
	movl	-4(%rbp), %eax
	imull	-92(%rbp), %eax
	movl	%eax, -48(%rbp)
	.loc 1 368 9
	movl	$0, -44(%rbp)
	.loc 1 369 9
	movl	$0, -40(%rbp)
	.loc 1 370 9
	movl	$0, -36(%rbp)
	.loc 1 371 9
	movl	$0, -32(%rbp)
	.loc 1 373 11
	jmp	.L97
.L98:
	.loc 1 374 7
	movl	-12(%rbp), %r9d
	movl	-64(%rbp), %r8d
	movl	-68(%rbp), %ecx
	movl	-68(%rbp), %edx
	movl	-88(%rbp), %esi
	movl	-84(%rbp), %eax
	subq	$8, %rsp
	movl	24(%rbp), %edi
	pushq	%rdi
	movl	%eax, %edi
	call	drawCircLine
	addq	$16, %rsp
	.loc 1 375 13
	movl	-68(%rbp), %eax
	movl	%eax, -40(%rbp)
	.loc 1 375 24
	movl	-64(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 376 7
	addl	$1, -64(%rbp)
	.loc 1 377 13
	movl	-8(%rbp), %eax
	addl	%eax, -44(%rbp)
	.loc 1 378 11
	movl	-56(%rbp), %eax
	addl	%eax, -52(%rbp)
	.loc 1 379 12
	movl	-8(%rbp), %eax
	addl	%eax, -56(%rbp)
	.loc 1 380 13
	movl	-52(%rbp), %eax
	leal	(%rax,%rax), %edx
	.loc 1 380 19
	movl	-60(%rbp), %eax
	addl	%edx, %eax
	.loc 1 380 10
	testl	%eax, %eax
	jle	.L97
	.loc 1 381 9
	subl	$1, -68(%rbp)
	.loc 1 382 15
	movl	-4(%rbp), %eax
	subl	%eax, -48(%rbp)
	.loc 1 383 13
	movl	-60(%rbp), %eax
	addl	%eax, -52(%rbp)
	.loc 1 384 14
	movl	-4(%rbp), %eax
	addl	%eax, -60(%rbp)
.L97:
	.loc 1 373 18
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jge	.L98
	.loc 1 388 7
	movl	$0, -68(%rbp)
	.loc 1 389 7
	movl	-96(%rbp), %eax
	movl	%eax, -64(%rbp)
	.loc 1 390 10
	movl	-96(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, -60(%rbp)
	.loc 1 391 17
	movl	-92(%rbp), %eax
	imull	%eax, %eax
	.loc 1 391 33
	movl	-96(%rbp), %edx
	leal	(%rdx,%rdx), %ecx
	.loc 1 391 29
	movl	$1, %edx
	subl	%ecx, %edx
	.loc 1 391 10
	imull	%edx, %eax
	movl	%eax, -56(%rbp)
	.loc 1 392 9
	movl	$0, -52(%rbp)
	.loc 1 393 11
	movl	$0, -48(%rbp)
	.loc 1 394 11
	movl	-8(%rbp), %eax
	imull	-96(%rbp), %eax
	movl	%eax, -44(%rbp)
	.loc 1 396 11
	jmp	.L99
.L100:
	.loc 1 397 7
	addl	$1, -68(%rbp)
	.loc 1 398 13
	movl	-4(%rbp), %eax
	addl	%eax, -48(%rbp)
	.loc 1 399 11
	movl	-60(%rbp), %eax
	addl	%eax, -52(%rbp)
	.loc 1 400 12
	movl	-4(%rbp), %eax
	addl	%eax, -60(%rbp)
	.loc 1 401 13
	movl	-52(%rbp), %eax
	leal	(%rax,%rax), %edx
	.loc 1 401 19
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	.loc 1 401 10
	testl	%eax, %eax
	jle	.L99
	.loc 1 402 9
	movl	-68(%rbp), %eax
	leal	-1(%rax), %edi
	movl	-12(%rbp), %r9d
	movl	-64(%rbp), %r8d
	movl	-32(%rbp), %edx
	movl	-88(%rbp), %esi
	movl	-84(%rbp), %eax
	subq	$8, %rsp
	movl	24(%rbp), %ecx
	pushq	%rcx
	movl	%edx, %ecx
	movl	%edi, %edx
	movl	%eax, %edi
	call	drawCircLine
	addq	$16, %rsp
	.loc 1 403 14
	movl	-68(%rbp), %eax
	movl	%eax, -32(%rbp)
	.loc 1 404 9
	subl	$1, -64(%rbp)
	.loc 1 405 15
	movl	-8(%rbp), %eax
	subl	%eax, -44(%rbp)
	.loc 1 406 13
	movl	-56(%rbp), %eax
	addl	%eax, -52(%rbp)
	.loc 1 407 14
	movl	-8(%rbp), %eax
	addl	%eax, -56(%rbp)
.L99:
	.loc 1 396 18
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle	.L100
	.loc 1 413 5
	jmp	.L101
.L102:
	.loc 1 414 7 discriminator 2
	movl	-68(%rbp), %eax
	leal	-1(%rax), %edi
	movl	-12(%rbp), %r9d
	movl	-64(%rbp), %r8d
	movl	-32(%rbp), %edx
	movl	-88(%rbp), %esi
	movl	-84(%rbp), %eax
	subq	$8, %rsp
	movl	24(%rbp), %ecx
	pushq	%rcx
	movl	%edx, %ecx
	movl	%edi, %edx
	movl	%eax, %edi
	call	drawCircLine
	addq	$16, %rsp
	.loc 1 413 24 discriminator 2
	subl	$1, -64(%rbp)
.L101:
	.loc 1 413 15 discriminator 1
	movl	-64(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jg	.L102
	.loc 1 416 8
	movl	-40(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jle	.L96
	.loc 1 416 31 discriminator 1
	movl	24(%rbp), %eax
	andl	$1, %eax
	.loc 1 416 21 discriminator 1
	testl	%eax, %eax
	jne	.L96
	.loc 1 417 7
	movl	-40(%rbp), %eax
	leal	-1(%rax), %edi
	movl	-12(%rbp), %r9d
	movl	-36(%rbp), %r8d
	movl	-68(%rbp), %edx
	movl	-88(%rbp), %esi
	movl	-84(%rbp), %eax
	subq	$8, %rsp
	movl	24(%rbp), %ecx
	pushq	%rcx
	movl	%edx, %ecx
	movl	%edi, %edx
	movl	%eax, %edi
	call	drawCircLine
	addq	$16, %rsp
.L96:
.LBE15:
	.loc 1 422 13
	movl	minX(%rip), %eax
	.loc 1 422 6
	cmpl	%eax, -28(%rbp)
	jge	.L103
	.loc 1 422 26 discriminator 1
	movl	-28(%rbp), %eax
	movl	%eax, minX(%rip)
.L103:
	.loc 1 423 14
	movl	minY(%rip), %eax
	.loc 1 423 6
	cmpl	%eax, -24(%rbp)
	jge	.L104
	.loc 1 423 27 discriminator 1
	movl	-24(%rbp), %eax
	movl	%eax, minY(%rip)
.L104:
	.loc 1 424 14
	movl	maxX(%rip), %eax
	.loc 1 424 6
	cmpl	%eax, -20(%rbp)
	jle	.L105
	.loc 1 424 27 discriminator 1
	movl	-20(%rbp), %eax
	movl	%eax, maxX(%rip)
.L105:
	.loc 1 425 14
	movl	maxY(%rip), %eax
	.loc 1 425 6
	cmpl	%eax, -16(%rbp)
	jle	.L107
	.loc 1 425 27 discriminator 1
	movl	-16(%rbp), %eax
	movl	%eax, maxY(%rip)
.L107:
	.loc 1 426 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4221:
	.size	sdlDrawCircPart, .-sdlDrawCircPart
	.type	sdlQuitOnEvent, @function
sdlQuitOnEvent:
.LFB4222:
	.loc 1 429 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	.loc 1 429 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 431 9
	jmp	.L109
.L110:
	.loc 1 432 14
	movl	-64(%rbp), %eax
	.loc 1 432 8
	cmpl	$256, %eax
	jne	.L109
	.loc 1 433 7
	movl	$1, %edi
	call	exit@PLT
.L109:
	.loc 1 431 10
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	SDL_PollEvent@PLT
	testl	%eax, %eax
	jne	.L110
	.loc 1 436 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L111
	call	__stack_chk_fail@PLT
.L111:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4222:
	.size	sdlQuitOnEvent, .-sdlQuitOnEvent
	.section	.rodata
	.align 8
.LC10:
	.string	"Could not update SDL texture: %s.\n"
	.align 8
.LC11:
	.string	"Could not display SDL texture: %s.\n"
	.text
	.globl	sdlUpdate
	.type	sdlUpdate, @function
sdlUpdate:
.LFB4223:
	.loc 1 439 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 439 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 440 3
	call	sdlQuitOnEvent
	.loc 1 442 12
	movl	maxX(%rip), %eax
	.loc 1 442 6
	testl	%eax, %eax
	js	.L120
.LBB16:
	.loc 1 445 15
	movl	minX(%rip), %eax
	movl	%eax, -32(%rbp)
	.loc 1 446 15
	movl	minY(%rip), %eax
	movl	%eax, -28(%rbp)
	.loc 1 447 23
	movl	maxX(%rip), %eax
	movl	minX(%rip), %edx
	subl	%edx, %eax
	.loc 1 447 31
	addl	$1, %eax
	.loc 1 447 15
	movl	%eax, -24(%rbp)
	.loc 1 448 23
	movl	maxY(%rip), %eax
	movl	minY(%rip), %edx
	subl	%edx, %eax
	.loc 1 448 31
	addl	$1, %eax
	.loc 1 448 15
	movl	%eax, -20(%rbp)
	.loc 1 450 17
	movl	-24(%rbp), %eax
	.loc 1 450 8
	cmpl	$800, %eax
	jne	.L114
	.loc 1 450 39 discriminator 1
	movl	-20(%rbp), %eax
	.loc 1 450 28 discriminator 1
	cmpl	$600, %eax
	jne	.L114
	.loc 1 452 11
	movq	myTexture(%rip), %rax
	movl	$3200, %ecx
	leaq	myPixArray(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	SDL_UpdateTexture@PLT
	.loc 1 452 10
	testl	%eax, %eax
	je	.L115
	.loc 1 454 9
	call	SDL_GetError@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 455 9
	movl	$1, %edi
	call	exit@PLT
.L115:
	.loc 1 457 11
	movq	myTexture(%rip), %rsi
	movq	myRenderer(%rip), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SDL_RenderCopy@PLT
	.loc 1 457 10
	testl	%eax, %eax
	je	.L117
	.loc 1 458 9
	call	SDL_GetError@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 459 9
	movl	$1, %edi
	call	exit@PLT
.L114:
	.loc 1 463 47
	movl	minY(%rip), %eax
	imull	$800, %eax, %eax
	.loc 1 463 53
	movslq	%eax, %rdx
	movl	minX(%rip), %eax
	cltq
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	.loc 1 462 11
	leaq	myPixArray(%rip), %rax
	addq	%rax, %rdx
	movq	myTexture(%rip), %rax
	leaq	-32(%rbp), %rsi
	movl	$3200, %ecx
	movq	%rax, %rdi
	call	SDL_UpdateTexture@PLT
	.loc 1 462 10
	testl	%eax, %eax
	je	.L118
	.loc 1 465 9
	call	SDL_GetError@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 466 9
	movl	$1, %edi
	call	exit@PLT
.L118:
	.loc 1 468 11
	movq	myTexture(%rip), %rsi
	movq	myRenderer(%rip), %rax
	leaq	-32(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	movq	%rax, %rdi
	call	SDL_RenderCopy@PLT
	.loc 1 468 10
	testl	%eax, %eax
	je	.L117
	.loc 1 469 9
	call	SDL_GetError@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 470 9
	movl	$1, %edi
	call	exit@PLT
.L117:
	.loc 1 473 5 discriminator 1
	movq	myRenderer(%rip), %rax
	movq	%rax, %rdi
	call	SDL_RenderPresent@PLT
	.loc 1 476 10 discriminator 1
	movl	$9999, minX(%rip)
	.loc 1 477 10 discriminator 1
	movl	$-1, maxX(%rip)
	.loc 1 478 10 discriminator 1
	movl	$9999, minY(%rip)
	.loc 1 479 10 discriminator 1
	movl	$-1, maxY(%rip)
.L120:
.LBE16:
	.loc 1 481 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L119
	call	__stack_chk_fail@PLT
.L119:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4223:
	.size	sdlUpdate, .-sdlUpdate
	.globl	sdlMilliSleep
	.type	sdlMilliSleep, @function
sdlMilliSleep:
.LFB4224:
	.loc 1 484 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 485 3
	call	sdlQuitOnEvent
	.loc 1 486 3
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	SDL_Delay@PLT
	.loc 1 487 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4224:
	.size	sdlMilliSleep, .-sdlMilliSleep
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 8 "/usr/include/SDL2/SDL_stdinc.h"
	.file 9 "/usr/include/SDL2/SDL_pixels.h"
	.file 10 "/usr/include/SDL2/SDL_rect.h"
	.file 11 "/usr/include/SDL2/SDL_blendmode.h"
	.file 12 "/usr/include/SDL2/SDL_video.h"
	.file 13 "/usr/include/SDL2/SDL_scancode.h"
	.file 14 "/usr/include/SDL2/SDL_keycode.h"
	.file 15 "/usr/include/SDL2/SDL_keyboard.h"
	.file 16 "/usr/include/SDL2/SDL_joystick.h"
	.file 17 "/usr/include/SDL2/SDL_touch.h"
	.file 18 "/usr/include/SDL2/SDL_gesture.h"
	.file 19 "/usr/include/SDL2/SDL_events.h"
	.file 20 "/usr/include/SDL2/SDL_messagebox.h"
	.file 21 "/usr/include/SDL2/SDL_render.h"
	.file 22 "/usr/include/SDL2/SDL_timer.h"
	.file 23 "/usr/include/stdlib.h"
	.file 24 "/usr/include/stdio.h"
	.file 25 "/usr/include/SDL2/SDL.h"
	.file 26 "/usr/include/SDL2/SDL_error.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2986
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x25
	.long	.LASF654
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x6
	.long	.LASF7
	.byte	0x2
	.byte	0xd1
	.byte	0x1b
	.long	0x3a
	.uleb128 0x10
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x10
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x26
	.byte	0x8
	.uleb128 0x10
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x10
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x10
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x6
	.long	.LASF8
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4a
	.uleb128 0x6
	.long	.LASF9
	.byte	0x3
	.byte	0x27
	.byte	0x1a
	.long	0x77
	.uleb128 0x10
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x6
	.long	.LASF11
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x51
	.uleb128 0x6
	.long	.LASF12
	.byte	0x3
	.byte	0x29
	.byte	0x14
	.long	0x96
	.uleb128 0x27
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.long	.LASF13
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0x6
	.long	.LASF14
	.byte	0x3
	.byte	0x2c
	.byte	0x19
	.long	0xb5
	.uleb128 0x10
	.byte	0x8
	.byte	0x5
	.long	.LASF15
	.uleb128 0x6
	.long	.LASF16
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0xb5
	.uleb128 0x6
	.long	.LASF17
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0xb5
	.uleb128 0xe
	.long	0xd9
	.uleb128 0x10
	.byte	0x1
	.byte	0x6
	.long	.LASF18
	.uleb128 0x20
	.long	0xd9
	.uleb128 0x14
	.long	.LASF159
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x26c
	.uleb128 0x4
	.long	.LASF19
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x96
	.byte	0
	.uleb128 0x4
	.long	.LASF20
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xd4
	.byte	0x8
	.uleb128 0x4
	.long	.LASF21
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xd4
	.byte	0x10
	.uleb128 0x4
	.long	.LASF22
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xd4
	.byte	0x18
	.uleb128 0x4
	.long	.LASF23
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xd4
	.byte	0x20
	.uleb128 0x4
	.long	.LASF24
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xd4
	.byte	0x28
	.uleb128 0x4
	.long	.LASF25
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xd4
	.byte	0x30
	.uleb128 0x4
	.long	.LASF26
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xd4
	.byte	0x38
	.uleb128 0x4
	.long	.LASF27
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xd4
	.byte	0x40
	.uleb128 0x4
	.long	.LASF28
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xd4
	.byte	0x48
	.uleb128 0x4
	.long	.LASF29
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xd4
	.byte	0x50
	.uleb128 0x4
	.long	.LASF30
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xd4
	.byte	0x58
	.uleb128 0x4
	.long	.LASF31
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x285
	.byte	0x60
	.uleb128 0x4
	.long	.LASF32
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x28a
	.byte	0x68
	.uleb128 0x4
	.long	.LASF33
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x96
	.byte	0x70
	.uleb128 0x4
	.long	.LASF34
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x96
	.byte	0x74
	.uleb128 0x4
	.long	.LASF35
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0xbc
	.byte	0x78
	.uleb128 0x4
	.long	.LASF36
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x51
	.byte	0x80
	.uleb128 0x4
	.long	.LASF37
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x58
	.byte	0x82
	.uleb128 0x4
	.long	.LASF38
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x28f
	.byte	0x83
	.uleb128 0x4
	.long	.LASF39
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x29f
	.byte	0x88
	.uleb128 0x4
	.long	.LASF40
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xc8
	.byte	0x90
	.uleb128 0x4
	.long	.LASF41
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2a9
	.byte	0x98
	.uleb128 0x4
	.long	.LASF42
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2b3
	.byte	0xa0
	.uleb128 0x4
	.long	.LASF43
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x28a
	.byte	0xa8
	.uleb128 0x4
	.long	.LASF44
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x4
	.long	.LASF45
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2e
	.byte	0xb8
	.uleb128 0x4
	.long	.LASF46
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x96
	.byte	0xc0
	.uleb128 0x4
	.long	.LASF47
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2b8
	.byte	0xc4
	.byte	0
	.uleb128 0x6
	.long	.LASF48
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xe5
	.uleb128 0x28
	.long	.LASF655
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x1b
	.long	.LASF49
	.uleb128 0xe
	.long	0x280
	.uleb128 0xe
	.long	0xe5
	.uleb128 0x19
	.long	0xd9
	.long	0x29f
	.uleb128 0x1c
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0x278
	.uleb128 0x1b
	.long	.LASF50
	.uleb128 0xe
	.long	0x2a4
	.uleb128 0x1b
	.long	.LASF51
	.uleb128 0xe
	.long	0x2ae
	.uleb128 0x19
	.long	0xd9
	.long	0x2c8
	.uleb128 0x1c
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	0x26c
	.uleb128 0x21
	.long	0x2c8
	.uleb128 0x29
	.long	.LASF656
	.byte	0x18
	.byte	0x91
	.byte	0xe
	.long	0x2c8
	.uleb128 0x10
	.byte	0x8
	.byte	0x5
	.long	.LASF52
	.uleb128 0x6
	.long	.LASF53
	.byte	0x6
	.byte	0x19
	.byte	0x13
	.long	0x6b
	.uleb128 0x6
	.long	.LASF54
	.byte	0x6
	.byte	0x1a
	.byte	0x13
	.long	0x8a
	.uleb128 0x6
	.long	.LASF55
	.byte	0x6
	.byte	0x1b
	.byte	0x13
	.long	0xa9
	.uleb128 0x10
	.byte	0x8
	.byte	0x7
	.long	.LASF56
	.uleb128 0x19
	.long	0xd9
	.long	0x320
	.uleb128 0x1c
	.long	0x3a
	.byte	0x1f
	.byte	0
	.uleb128 0xe
	.long	0x325
	.uleb128 0x2a
	.uleb128 0x10
	.byte	0x10
	.byte	0x4
	.long	.LASF57
	.uleb128 0xe
	.long	0xe0
	.uleb128 0x21
	.long	0x32d
	.uleb128 0x6
	.long	.LASF58
	.byte	0x7
	.byte	0x18
	.byte	0x13
	.long	0x5f
	.uleb128 0x6
	.long	.LASF59
	.byte	0x7
	.byte	0x19
	.byte	0x14
	.long	0x7e
	.uleb128 0x6
	.long	.LASF60
	.byte	0x7
	.byte	0x1a
	.byte	0x14
	.long	0x9d
	.uleb128 0x10
	.byte	0x4
	.byte	0x4
	.long	.LASF61
	.uleb128 0x10
	.byte	0x8
	.byte	0x4
	.long	.LASF62
	.uleb128 0x6
	.long	.LASF63
	.byte	0x8
	.byte	0xc4
	.byte	0x11
	.long	0x337
	.uleb128 0x6
	.long	.LASF64
	.byte	0x8
	.byte	0xca
	.byte	0x11
	.long	0x2e5
	.uleb128 0x6
	.long	.LASF65
	.byte	0x8
	.byte	0xd0
	.byte	0x12
	.long	0x343
	.uleb128 0x6
	.long	.LASF66
	.byte	0x8
	.byte	0xd6
	.byte	0x11
	.long	0x2f1
	.uleb128 0x6
	.long	.LASF67
	.byte	0x8
	.byte	0xdc
	.byte	0x12
	.long	0x34f
	.uleb128 0x6
	.long	.LASF68
	.byte	0x8
	.byte	0xe3
	.byte	0x11
	.long	0x2fd
	.uleb128 0x13
	.long	0x41
	.byte	0x9
	.byte	0x34
	.long	0x405
	.uleb128 0x1
	.long	.LASF69
	.byte	0
	.uleb128 0x1
	.long	.LASF70
	.byte	0x1
	.uleb128 0x1
	.long	.LASF71
	.byte	0x2
	.uleb128 0x1
	.long	.LASF72
	.byte	0x3
	.uleb128 0x1
	.long	.LASF73
	.byte	0x4
	.uleb128 0x1
	.long	.LASF74
	.byte	0x5
	.uleb128 0x1
	.long	.LASF75
	.byte	0x6
	.uleb128 0x1
	.long	.LASF76
	.byte	0x7
	.uleb128 0x1
	.long	.LASF77
	.byte	0x8
	.uleb128 0x1
	.long	.LASF78
	.byte	0x9
	.uleb128 0x1
	.long	.LASF79
	.byte	0xa
	.uleb128 0x1
	.long	.LASF80
	.byte	0xb
	.byte	0
	.uleb128 0x13
	.long	0x41
	.byte	0x9
	.byte	0x45
	.long	0x423
	.uleb128 0x1
	.long	.LASF81
	.byte	0
	.uleb128 0x1
	.long	.LASF82
	.byte	0x1
	.uleb128 0x1
	.long	.LASF83
	.byte	0x2
	.byte	0
	.uleb128 0x13
	.long	0x41
	.byte	0x9
	.byte	0x4d
	.long	0x465
	.uleb128 0x1
	.long	.LASF84
	.byte	0
	.uleb128 0x1
	.long	.LASF85
	.byte	0x1
	.uleb128 0x1
	.long	.LASF86
	.byte	0x2
	.uleb128 0x1
	.long	.LASF87
	.byte	0x3
	.uleb128 0x1
	.long	.LASF88
	.byte	0x4
	.uleb128 0x1
	.long	.LASF89
	.byte	0x5
	.uleb128 0x1
	.long	.LASF90
	.byte	0x6
	.uleb128 0x1
	.long	.LASF91
	.byte	0x7
	.uleb128 0x1
	.long	.LASF92
	.byte	0x8
	.byte	0
	.uleb128 0x13
	.long	0x41
	.byte	0x9
	.byte	0x5d
	.long	0x49b
	.uleb128 0x1
	.long	.LASF93
	.byte	0
	.uleb128 0x1
	.long	.LASF94
	.byte	0x1
	.uleb128 0x1
	.long	.LASF95
	.byte	0x2
	.uleb128 0x1
	.long	.LASF96
	.byte	0x3
	.uleb128 0x1
	.long	.LASF97
	.byte	0x4
	.uleb128 0x1
	.long	.LASF98
	.byte	0x5
	.uleb128 0x1
	.long	.LASF99
	.byte	0x6
	.byte	0
	.uleb128 0x13
	.long	0x41
	.byte	0x9
	.byte	0x69
	.long	0x4dd
	.uleb128 0x1
	.long	.LASF100
	.byte	0
	.uleb128 0x1
	.long	.LASF101
	.byte	0x1
	.uleb128 0x1
	.long	.LASF102
	.byte	0x2
	.uleb128 0x1
	.long	.LASF103
	.byte	0x3
	.uleb128 0x1
	.long	.LASF104
	.byte	0x4
	.uleb128 0x1
	.long	.LASF105
	.byte	0x5
	.uleb128 0x1
	.long	.LASF106
	.byte	0x6
	.uleb128 0x1
	.long	.LASF107
	.byte	0x7
	.uleb128 0x1
	.long	.LASF108
	.byte	0x8
	.byte	0
	.uleb128 0x13
	.long	0x41
	.byte	0x9
	.byte	0xac
	.long	0x6a8
	.uleb128 0x1
	.long	.LASF109
	.byte	0
	.uleb128 0x5
	.long	.LASF110
	.long	0x11100100
	.uleb128 0x5
	.long	.LASF111
	.long	0x11200100
	.uleb128 0x5
	.long	.LASF112
	.long	0x12100400
	.uleb128 0x5
	.long	.LASF113
	.long	0x12200400
	.uleb128 0x5
	.long	.LASF114
	.long	0x13000801
	.uleb128 0x5
	.long	.LASF115
	.long	0x14110801
	.uleb128 0x5
	.long	.LASF116
	.long	0x15120c02
	.uleb128 0x5
	.long	.LASF117
	.long	0x15120c02
	.uleb128 0x5
	.long	.LASF118
	.long	0x15520c02
	.uleb128 0x5
	.long	.LASF119
	.long	0x15520c02
	.uleb128 0x5
	.long	.LASF120
	.long	0x15130f02
	.uleb128 0x5
	.long	.LASF121
	.long	0x15130f02
	.uleb128 0x5
	.long	.LASF122
	.long	0x15530f02
	.uleb128 0x5
	.long	.LASF123
	.long	0x15530f02
	.uleb128 0x5
	.long	.LASF124
	.long	0x15321002
	.uleb128 0x5
	.long	.LASF125
	.long	0x15421002
	.uleb128 0x5
	.long	.LASF126
	.long	0x15721002
	.uleb128 0x5
	.long	.LASF127
	.long	0x15821002
	.uleb128 0x5
	.long	.LASF128
	.long	0x15331002
	.uleb128 0x5
	.long	.LASF129
	.long	0x15441002
	.uleb128 0x5
	.long	.LASF130
	.long	0x15731002
	.uleb128 0x5
	.long	.LASF131
	.long	0x15841002
	.uleb128 0x5
	.long	.LASF132
	.long	0x15151002
	.uleb128 0x5
	.long	.LASF133
	.long	0x15551002
	.uleb128 0x5
	.long	.LASF134
	.long	0x17101803
	.uleb128 0x5
	.long	.LASF135
	.long	0x17401803
	.uleb128 0x5
	.long	.LASF136
	.long	0x16161804
	.uleb128 0x5
	.long	.LASF137
	.long	0x16161804
	.uleb128 0x5
	.long	.LASF138
	.long	0x16261804
	.uleb128 0x5
	.long	.LASF139
	.long	0x16561804
	.uleb128 0x5
	.long	.LASF140
	.long	0x16561804
	.uleb128 0x5
	.long	.LASF141
	.long	0x16661804
	.uleb128 0x5
	.long	.LASF142
	.long	0x16362004
	.uleb128 0x5
	.long	.LASF143
	.long	0x16462004
	.uleb128 0x5
	.long	.LASF144
	.long	0x16762004
	.uleb128 0x5
	.long	.LASF145
	.long	0x16862004
	.uleb128 0x5
	.long	.LASF146
	.long	0x16372004
	.uleb128 0x5
	.long	.LASF147
	.long	0x16762004
	.uleb128 0x5
	.long	.LASF148
	.long	0x16862004
	.uleb128 0x5
	.long	.LASF149
	.long	0x16362004
	.uleb128 0x5
	.long	.LASF150
	.long	0x16462004
	.uleb128 0x5
	.long	.LASF151
	.long	0x32315659
	.uleb128 0x5
	.long	.LASF152
	.long	0x56555949
	.uleb128 0x5
	.long	.LASF153
	.long	0x32595559
	.uleb128 0x5
	.long	.LASF154
	.long	0x59565955
	.uleb128 0x5
	.long	.LASF155
	.long	0x55595659
	.uleb128 0x5
	.long	.LASF156
	.long	0x3231564e
	.uleb128 0x5
	.long	.LASF157
	.long	0x3132564e
	.uleb128 0x5
	.long	.LASF158
	.long	0x2053454f
	.byte	0
	.uleb128 0x14
	.long	.LASF160
	.byte	0x10
	.byte	0xa
	.byte	0x4d
	.byte	0x10
	.long	0x6e2
	.uleb128 0x18
	.string	"x"
	.byte	0xa
	.byte	0x4f
	.byte	0x9
	.long	0x96
	.byte	0
	.uleb128 0x18
	.string	"y"
	.byte	0xa
	.byte	0x4f
	.byte	0xc
	.long	0x96
	.byte	0x4
	.uleb128 0x18
	.string	"w"
	.byte	0xa
	.byte	0x50
	.byte	0x9
	.long	0x96
	.byte	0x8
	.uleb128 0x18
	.string	"h"
	.byte	0xa
	.byte	0x50
	.byte	0xc
	.long	0x96
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.long	.LASF160
	.byte	0xa
	.byte	0x51
	.byte	0x3
	.long	0x6a8
	.uleb128 0x20
	.long	0x6e2
	.uleb128 0x13
	.long	0x41
	.byte	0xb
	.byte	0x29
	.long	0x726
	.uleb128 0x1
	.long	.LASF161
	.byte	0
	.uleb128 0x1
	.long	.LASF162
	.byte	0x1
	.uleb128 0x1
	.long	.LASF163
	.byte	0x2
	.uleb128 0x1
	.long	.LASF164
	.byte	0x4
	.uleb128 0x1
	.long	.LASF165
	.byte	0x8
	.uleb128 0x5
	.long	.LASF166
	.long	0x7fffffff
	.byte	0
	.uleb128 0x6
	.long	.LASF167
	.byte	0xb
	.byte	0x3c
	.byte	0x3
	.long	0x6f3
	.uleb128 0x6
	.long	.LASF168
	.byte	0xc
	.byte	0x5f
	.byte	0x1b
	.long	0x73e
	.uleb128 0x1b
	.long	.LASF168
	.uleb128 0xe
	.long	0x732
	.uleb128 0x13
	.long	0x41
	.byte	0xd
	.byte	0x2c
	.long	0xd2b
	.uleb128 0x1
	.long	.LASF169
	.byte	0
	.uleb128 0x1
	.long	.LASF170
	.byte	0x4
	.uleb128 0x1
	.long	.LASF171
	.byte	0x5
	.uleb128 0x1
	.long	.LASF172
	.byte	0x6
	.uleb128 0x1
	.long	.LASF173
	.byte	0x7
	.uleb128 0x1
	.long	.LASF174
	.byte	0x8
	.uleb128 0x1
	.long	.LASF175
	.byte	0x9
	.uleb128 0x1
	.long	.LASF176
	.byte	0xa
	.uleb128 0x1
	.long	.LASF177
	.byte	0xb
	.uleb128 0x1
	.long	.LASF178
	.byte	0xc
	.uleb128 0x1
	.long	.LASF179
	.byte	0xd
	.uleb128 0x1
	.long	.LASF180
	.byte	0xe
	.uleb128 0x1
	.long	.LASF181
	.byte	0xf
	.uleb128 0x1
	.long	.LASF182
	.byte	0x10
	.uleb128 0x1
	.long	.LASF183
	.byte	0x11
	.uleb128 0x1
	.long	.LASF184
	.byte	0x12
	.uleb128 0x1
	.long	.LASF185
	.byte	0x13
	.uleb128 0x1
	.long	.LASF186
	.byte	0x14
	.uleb128 0x1
	.long	.LASF187
	.byte	0x15
	.uleb128 0x1
	.long	.LASF188
	.byte	0x16
	.uleb128 0x1
	.long	.LASF189
	.byte	0x17
	.uleb128 0x1
	.long	.LASF190
	.byte	0x18
	.uleb128 0x1
	.long	.LASF191
	.byte	0x19
	.uleb128 0x1
	.long	.LASF192
	.byte	0x1a
	.uleb128 0x1
	.long	.LASF193
	.byte	0x1b
	.uleb128 0x1
	.long	.LASF194
	.byte	0x1c
	.uleb128 0x1
	.long	.LASF195
	.byte	0x1d
	.uleb128 0x1
	.long	.LASF196
	.byte	0x1e
	.uleb128 0x1
	.long	.LASF197
	.byte	0x1f
	.uleb128 0x1
	.long	.LASF198
	.byte	0x20
	.uleb128 0x1
	.long	.LASF199
	.byte	0x21
	.uleb128 0x1
	.long	.LASF200
	.byte	0x22
	.uleb128 0x1
	.long	.LASF201
	.byte	0x23
	.uleb128 0x1
	.long	.LASF202
	.byte	0x24
	.uleb128 0x1
	.long	.LASF203
	.byte	0x25
	.uleb128 0x1
	.long	.LASF204
	.byte	0x26
	.uleb128 0x1
	.long	.LASF205
	.byte	0x27
	.uleb128 0x1
	.long	.LASF206
	.byte	0x28
	.uleb128 0x1
	.long	.LASF207
	.byte	0x29
	.uleb128 0x1
	.long	.LASF208
	.byte	0x2a
	.uleb128 0x1
	.long	.LASF209
	.byte	0x2b
	.uleb128 0x1
	.long	.LASF210
	.byte	0x2c
	.uleb128 0x1
	.long	.LASF211
	.byte	0x2d
	.uleb128 0x1
	.long	.LASF212
	.byte	0x2e
	.uleb128 0x1
	.long	.LASF213
	.byte	0x2f
	.uleb128 0x1
	.long	.LASF214
	.byte	0x30
	.uleb128 0x1
	.long	.LASF215
	.byte	0x31
	.uleb128 0x1
	.long	.LASF216
	.byte	0x32
	.uleb128 0x1
	.long	.LASF217
	.byte	0x33
	.uleb128 0x1
	.long	.LASF218
	.byte	0x34
	.uleb128 0x1
	.long	.LASF219
	.byte	0x35
	.uleb128 0x1
	.long	.LASF220
	.byte	0x36
	.uleb128 0x1
	.long	.LASF221
	.byte	0x37
	.uleb128 0x1
	.long	.LASF222
	.byte	0x38
	.uleb128 0x1
	.long	.LASF223
	.byte	0x39
	.uleb128 0x1
	.long	.LASF224
	.byte	0x3a
	.uleb128 0x1
	.long	.LASF225
	.byte	0x3b
	.uleb128 0x1
	.long	.LASF226
	.byte	0x3c
	.uleb128 0x1
	.long	.LASF227
	.byte	0x3d
	.uleb128 0x1
	.long	.LASF228
	.byte	0x3e
	.uleb128 0x1
	.long	.LASF229
	.byte	0x3f
	.uleb128 0x1
	.long	.LASF230
	.byte	0x40
	.uleb128 0x1
	.long	.LASF231
	.byte	0x41
	.uleb128 0x1
	.long	.LASF232
	.byte	0x42
	.uleb128 0x1
	.long	.LASF233
	.byte	0x43
	.uleb128 0x1
	.long	.LASF234
	.byte	0x44
	.uleb128 0x1
	.long	.LASF235
	.byte	0x45
	.uleb128 0x1
	.long	.LASF236
	.byte	0x46
	.uleb128 0x1
	.long	.LASF237
	.byte	0x47
	.uleb128 0x1
	.long	.LASF238
	.byte	0x48
	.uleb128 0x1
	.long	.LASF239
	.byte	0x49
	.uleb128 0x1
	.long	.LASF240
	.byte	0x4a
	.uleb128 0x1
	.long	.LASF241
	.byte	0x4b
	.uleb128 0x1
	.long	.LASF242
	.byte	0x4c
	.uleb128 0x1
	.long	.LASF243
	.byte	0x4d
	.uleb128 0x1
	.long	.LASF244
	.byte	0x4e
	.uleb128 0x1
	.long	.LASF245
	.byte	0x4f
	.uleb128 0x1
	.long	.LASF246
	.byte	0x50
	.uleb128 0x1
	.long	.LASF247
	.byte	0x51
	.uleb128 0x1
	.long	.LASF248
	.byte	0x52
	.uleb128 0x1
	.long	.LASF249
	.byte	0x53
	.uleb128 0x1
	.long	.LASF250
	.byte	0x54
	.uleb128 0x1
	.long	.LASF251
	.byte	0x55
	.uleb128 0x1
	.long	.LASF252
	.byte	0x56
	.uleb128 0x1
	.long	.LASF253
	.byte	0x57
	.uleb128 0x1
	.long	.LASF254
	.byte	0x58
	.uleb128 0x1
	.long	.LASF255
	.byte	0x59
	.uleb128 0x1
	.long	.LASF256
	.byte	0x5a
	.uleb128 0x1
	.long	.LASF257
	.byte	0x5b
	.uleb128 0x1
	.long	.LASF258
	.byte	0x5c
	.uleb128 0x1
	.long	.LASF259
	.byte	0x5d
	.uleb128 0x1
	.long	.LASF260
	.byte	0x5e
	.uleb128 0x1
	.long	.LASF261
	.byte	0x5f
	.uleb128 0x1
	.long	.LASF262
	.byte	0x60
	.uleb128 0x1
	.long	.LASF263
	.byte	0x61
	.uleb128 0x1
	.long	.LASF264
	.byte	0x62
	.uleb128 0x1
	.long	.LASF265
	.byte	0x63
	.uleb128 0x1
	.long	.LASF266
	.byte	0x64
	.uleb128 0x1
	.long	.LASF267
	.byte	0x65
	.uleb128 0x1
	.long	.LASF268
	.byte	0x66
	.uleb128 0x1
	.long	.LASF269
	.byte	0x67
	.uleb128 0x1
	.long	.LASF270
	.byte	0x68
	.uleb128 0x1
	.long	.LASF271
	.byte	0x69
	.uleb128 0x1
	.long	.LASF272
	.byte	0x6a
	.uleb128 0x1
	.long	.LASF273
	.byte	0x6b
	.uleb128 0x1
	.long	.LASF274
	.byte	0x6c
	.uleb128 0x1
	.long	.LASF275
	.byte	0x6d
	.uleb128 0x1
	.long	.LASF276
	.byte	0x6e
	.uleb128 0x1
	.long	.LASF277
	.byte	0x6f
	.uleb128 0x1
	.long	.LASF278
	.byte	0x70
	.uleb128 0x1
	.long	.LASF279
	.byte	0x71
	.uleb128 0x1
	.long	.LASF280
	.byte	0x72
	.uleb128 0x1
	.long	.LASF281
	.byte	0x73
	.uleb128 0x1
	.long	.LASF282
	.byte	0x74
	.uleb128 0x1
	.long	.LASF283
	.byte	0x75
	.uleb128 0x1
	.long	.LASF284
	.byte	0x76
	.uleb128 0x1
	.long	.LASF285
	.byte	0x77
	.uleb128 0x1
	.long	.LASF286
	.byte	0x78
	.uleb128 0x1
	.long	.LASF287
	.byte	0x79
	.uleb128 0x1
	.long	.LASF288
	.byte	0x7a
	.uleb128 0x1
	.long	.LASF289
	.byte	0x7b
	.uleb128 0x1
	.long	.LASF290
	.byte	0x7c
	.uleb128 0x1
	.long	.LASF291
	.byte	0x7d
	.uleb128 0x1
	.long	.LASF292
	.byte	0x7e
	.uleb128 0x1
	.long	.LASF293
	.byte	0x7f
	.uleb128 0x1
	.long	.LASF294
	.byte	0x80
	.uleb128 0x1
	.long	.LASF295
	.byte	0x81
	.uleb128 0x1
	.long	.LASF296
	.byte	0x85
	.uleb128 0x1
	.long	.LASF297
	.byte	0x86
	.uleb128 0x1
	.long	.LASF298
	.byte	0x87
	.uleb128 0x1
	.long	.LASF299
	.byte	0x88
	.uleb128 0x1
	.long	.LASF300
	.byte	0x89
	.uleb128 0x1
	.long	.LASF301
	.byte	0x8a
	.uleb128 0x1
	.long	.LASF302
	.byte	0x8b
	.uleb128 0x1
	.long	.LASF303
	.byte	0x8c
	.uleb128 0x1
	.long	.LASF304
	.byte	0x8d
	.uleb128 0x1
	.long	.LASF305
	.byte	0x8e
	.uleb128 0x1
	.long	.LASF306
	.byte	0x8f
	.uleb128 0x1
	.long	.LASF307
	.byte	0x90
	.uleb128 0x1
	.long	.LASF308
	.byte	0x91
	.uleb128 0x1
	.long	.LASF309
	.byte	0x92
	.uleb128 0x1
	.long	.LASF310
	.byte	0x93
	.uleb128 0x1
	.long	.LASF311
	.byte	0x94
	.uleb128 0x1
	.long	.LASF312
	.byte	0x95
	.uleb128 0x1
	.long	.LASF313
	.byte	0x96
	.uleb128 0x1
	.long	.LASF314
	.byte	0x97
	.uleb128 0x1
	.long	.LASF315
	.byte	0x98
	.uleb128 0x1
	.long	.LASF316
	.byte	0x99
	.uleb128 0x1
	.long	.LASF317
	.byte	0x9a
	.uleb128 0x1
	.long	.LASF318
	.byte	0x9b
	.uleb128 0x1
	.long	.LASF319
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF320
	.byte	0x9d
	.uleb128 0x1
	.long	.LASF321
	.byte	0x9e
	.uleb128 0x1
	.long	.LASF322
	.byte	0x9f
	.uleb128 0x1
	.long	.LASF323
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF324
	.byte	0xa1
	.uleb128 0x1
	.long	.LASF325
	.byte	0xa2
	.uleb128 0x1
	.long	.LASF326
	.byte	0xa3
	.uleb128 0x1
	.long	.LASF327
	.byte	0xa4
	.uleb128 0x1
	.long	.LASF328
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF329
	.byte	0xb1
	.uleb128 0x1
	.long	.LASF330
	.byte	0xb2
	.uleb128 0x1
	.long	.LASF331
	.byte	0xb3
	.uleb128 0x1
	.long	.LASF332
	.byte	0xb4
	.uleb128 0x1
	.long	.LASF333
	.byte	0xb5
	.uleb128 0x1
	.long	.LASF334
	.byte	0xb6
	.uleb128 0x1
	.long	.LASF335
	.byte	0xb7
	.uleb128 0x1
	.long	.LASF336
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF337
	.byte	0xb9
	.uleb128 0x1
	.long	.LASF338
	.byte	0xba
	.uleb128 0x1
	.long	.LASF339
	.byte	0xbb
	.uleb128 0x1
	.long	.LASF340
	.byte	0xbc
	.uleb128 0x1
	.long	.LASF341
	.byte	0xbd
	.uleb128 0x1
	.long	.LASF342
	.byte	0xbe
	.uleb128 0x1
	.long	.LASF343
	.byte	0xbf
	.uleb128 0x1
	.long	.LASF344
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF345
	.byte	0xc1
	.uleb128 0x1
	.long	.LASF346
	.byte	0xc2
	.uleb128 0x1
	.long	.LASF347
	.byte	0xc3
	.uleb128 0x1
	.long	.LASF348
	.byte	0xc4
	.uleb128 0x1
	.long	.LASF349
	.byte	0xc5
	.uleb128 0x1
	.long	.LASF350
	.byte	0xc6
	.uleb128 0x1
	.long	.LASF351
	.byte	0xc7
	.uleb128 0x1
	.long	.LASF352
	.byte	0xc8
	.uleb128 0x1
	.long	.LASF353
	.byte	0xc9
	.uleb128 0x1
	.long	.LASF354
	.byte	0xca
	.uleb128 0x1
	.long	.LASF355
	.byte	0xcb
	.uleb128 0x1
	.long	.LASF356
	.byte	0xcc
	.uleb128 0x1
	.long	.LASF357
	.byte	0xcd
	.uleb128 0x1
	.long	.LASF358
	.byte	0xce
	.uleb128 0x1
	.long	.LASF359
	.byte	0xcf
	.uleb128 0x1
	.long	.LASF360
	.byte	0xd0
	.uleb128 0x1
	.long	.LASF361
	.byte	0xd1
	.uleb128 0x1
	.long	.LASF362
	.byte	0xd2
	.uleb128 0x1
	.long	.LASF363
	.byte	0xd3
	.uleb128 0x1
	.long	.LASF364
	.byte	0xd4
	.uleb128 0x1
	.long	.LASF365
	.byte	0xd5
	.uleb128 0x1
	.long	.LASF366
	.byte	0xd6
	.uleb128 0x1
	.long	.LASF367
	.byte	0xd7
	.uleb128 0x1
	.long	.LASF368
	.byte	0xd8
	.uleb128 0x1
	.long	.LASF369
	.byte	0xd9
	.uleb128 0x1
	.long	.LASF370
	.byte	0xda
	.uleb128 0x1
	.long	.LASF371
	.byte	0xdb
	.uleb128 0x1
	.long	.LASF372
	.byte	0xdc
	.uleb128 0x1
	.long	.LASF373
	.byte	0xdd
	.uleb128 0x1
	.long	.LASF374
	.byte	0xe0
	.uleb128 0x1
	.long	.LASF375
	.byte	0xe1
	.uleb128 0x1
	.long	.LASF376
	.byte	0xe2
	.uleb128 0x1
	.long	.LASF377
	.byte	0xe3
	.uleb128 0x1
	.long	.LASF378
	.byte	0xe4
	.uleb128 0x1
	.long	.LASF379
	.byte	0xe5
	.uleb128 0x1
	.long	.LASF380
	.byte	0xe6
	.uleb128 0x1
	.long	.LASF381
	.byte	0xe7
	.uleb128 0x3
	.long	.LASF382
	.value	0x101
	.uleb128 0x3
	.long	.LASF383
	.value	0x102
	.uleb128 0x3
	.long	.LASF384
	.value	0x103
	.uleb128 0x3
	.long	.LASF385
	.value	0x104
	.uleb128 0x3
	.long	.LASF386
	.value	0x105
	.uleb128 0x3
	.long	.LASF387
	.value	0x106
	.uleb128 0x3
	.long	.LASF388
	.value	0x107
	.uleb128 0x3
	.long	.LASF389
	.value	0x108
	.uleb128 0x3
	.long	.LASF390
	.value	0x109
	.uleb128 0x3
	.long	.LASF391
	.value	0x10a
	.uleb128 0x3
	.long	.LASF392
	.value	0x10b
	.uleb128 0x3
	.long	.LASF393
	.value	0x10c
	.uleb128 0x3
	.long	.LASF394
	.value	0x10d
	.uleb128 0x3
	.long	.LASF395
	.value	0x10e
	.uleb128 0x3
	.long	.LASF396
	.value	0x10f
	.uleb128 0x3
	.long	.LASF397
	.value	0x110
	.uleb128 0x3
	.long	.LASF398
	.value	0x111
	.uleb128 0x3
	.long	.LASF399
	.value	0x112
	.uleb128 0x3
	.long	.LASF400
	.value	0x113
	.uleb128 0x3
	.long	.LASF401
	.value	0x114
	.uleb128 0x3
	.long	.LASF402
	.value	0x115
	.uleb128 0x3
	.long	.LASF403
	.value	0x116
	.uleb128 0x3
	.long	.LASF404
	.value	0x117
	.uleb128 0x3
	.long	.LASF405
	.value	0x118
	.uleb128 0x3
	.long	.LASF406
	.value	0x119
	.uleb128 0x3
	.long	.LASF407
	.value	0x11a
	.uleb128 0x3
	.long	.LASF408
	.value	0x11b
	.uleb128 0x3
	.long	.LASF409
	.value	0x11c
	.uleb128 0x3
	.long	.LASF410
	.value	0x11d
	.uleb128 0x3
	.long	.LASF411
	.value	0x11e
	.uleb128 0x3
	.long	.LASF412
	.value	0x200
	.byte	0
	.uleb128 0xa
	.long	.LASF413
	.byte	0xd
	.value	0x199
	.byte	0x3
	.long	0x748
	.uleb128 0x6
	.long	.LASF414
	.byte	0xe
	.byte	0x2d
	.byte	0x10
	.long	0x38d
	.uleb128 0x14
	.long	.LASF415
	.byte	0x10
	.byte	0xf
	.byte	0x2f
	.byte	0x10
	.long	0xd86
	.uleb128 0x4
	.long	.LASF416
	.byte	0xf
	.byte	0x31
	.byte	0x12
	.long	0xd2b
	.byte	0
	.uleb128 0x18
	.string	"sym"
	.byte	0xf
	.byte	0x32
	.byte	0x11
	.long	0xd38
	.byte	0x4
	.uleb128 0x18
	.string	"mod"
	.byte	0xf
	.byte	0x33
	.byte	0xc
	.long	0x381
	.byte	0x8
	.uleb128 0x4
	.long	.LASF417
	.byte	0xf
	.byte	0x34
	.byte	0xc
	.long	0x399
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.long	.LASF415
	.byte	0xf
	.byte	0x35
	.byte	0x3
	.long	0xd44
	.uleb128 0x6
	.long	.LASF418
	.byte	0x10
	.byte	0x53
	.byte	0x10
	.long	0x38d
	.uleb128 0x6
	.long	.LASF419
	.byte	0x11
	.byte	0x29
	.byte	0x10
	.long	0x3a5
	.uleb128 0x6
	.long	.LASF420
	.byte	0x11
	.byte	0x2a
	.byte	0x10
	.long	0x3a5
	.uleb128 0x6
	.long	.LASF421
	.byte	0x12
	.byte	0x2c
	.byte	0x10
	.long	0x3a5
	.uleb128 0x13
	.long	0x41
	.byte	0x13
	.byte	0x38
	.long	0xf5c
	.uleb128 0x1
	.long	.LASF422
	.byte	0
	.uleb128 0x3
	.long	.LASF423
	.value	0x100
	.uleb128 0x3
	.long	.LASF424
	.value	0x101
	.uleb128 0x3
	.long	.LASF425
	.value	0x102
	.uleb128 0x3
	.long	.LASF426
	.value	0x103
	.uleb128 0x3
	.long	.LASF427
	.value	0x104
	.uleb128 0x3
	.long	.LASF428
	.value	0x105
	.uleb128 0x3
	.long	.LASF429
	.value	0x106
	.uleb128 0x3
	.long	.LASF430
	.value	0x107
	.uleb128 0x3
	.long	.LASF431
	.value	0x150
	.uleb128 0x3
	.long	.LASF432
	.value	0x200
	.uleb128 0x3
	.long	.LASF433
	.value	0x201
	.uleb128 0x3
	.long	.LASF434
	.value	0x300
	.uleb128 0x3
	.long	.LASF435
	.value	0x301
	.uleb128 0x3
	.long	.LASF436
	.value	0x302
	.uleb128 0x3
	.long	.LASF437
	.value	0x303
	.uleb128 0x3
	.long	.LASF438
	.value	0x304
	.uleb128 0x3
	.long	.LASF439
	.value	0x400
	.uleb128 0x3
	.long	.LASF440
	.value	0x401
	.uleb128 0x3
	.long	.LASF441
	.value	0x402
	.uleb128 0x3
	.long	.LASF442
	.value	0x403
	.uleb128 0x3
	.long	.LASF443
	.value	0x600
	.uleb128 0x3
	.long	.LASF444
	.value	0x601
	.uleb128 0x3
	.long	.LASF445
	.value	0x602
	.uleb128 0x3
	.long	.LASF446
	.value	0x603
	.uleb128 0x3
	.long	.LASF447
	.value	0x604
	.uleb128 0x3
	.long	.LASF448
	.value	0x605
	.uleb128 0x3
	.long	.LASF449
	.value	0x606
	.uleb128 0x3
	.long	.LASF450
	.value	0x650
	.uleb128 0x3
	.long	.LASF451
	.value	0x651
	.uleb128 0x3
	.long	.LASF452
	.value	0x652
	.uleb128 0x3
	.long	.LASF453
	.value	0x653
	.uleb128 0x3
	.long	.LASF454
	.value	0x654
	.uleb128 0x3
	.long	.LASF455
	.value	0x655
	.uleb128 0x3
	.long	.LASF456
	.value	0x656
	.uleb128 0x3
	.long	.LASF457
	.value	0x657
	.uleb128 0x3
	.long	.LASF458
	.value	0x658
	.uleb128 0x3
	.long	.LASF459
	.value	0x659
	.uleb128 0x3
	.long	.LASF460
	.value	0x700
	.uleb128 0x3
	.long	.LASF461
	.value	0x701
	.uleb128 0x3
	.long	.LASF462
	.value	0x702
	.uleb128 0x3
	.long	.LASF463
	.value	0x800
	.uleb128 0x3
	.long	.LASF464
	.value	0x801
	.uleb128 0x3
	.long	.LASF465
	.value	0x802
	.uleb128 0x3
	.long	.LASF466
	.value	0x900
	.uleb128 0x3
	.long	.LASF467
	.value	0x1000
	.uleb128 0x3
	.long	.LASF468
	.value	0x1001
	.uleb128 0x3
	.long	.LASF469
	.value	0x1002
	.uleb128 0x3
	.long	.LASF470
	.value	0x1003
	.uleb128 0x3
	.long	.LASF471
	.value	0x1100
	.uleb128 0x3
	.long	.LASF472
	.value	0x1101
	.uleb128 0x3
	.long	.LASF473
	.value	0x1200
	.uleb128 0x3
	.long	.LASF474
	.value	0x2000
	.uleb128 0x3
	.long	.LASF475
	.value	0x2001
	.uleb128 0x3
	.long	.LASF476
	.value	0x7f00
	.uleb128 0x3
	.long	.LASF477
	.value	0x8000
	.uleb128 0x3
	.long	.LASF478
	.value	0xffff
	.byte	0
	.uleb128 0x14
	.long	.LASF479
	.byte	0x8
	.byte	0x13
	.byte	0xb4
	.byte	0x10
	.long	0xf84
	.uleb128 0x4
	.long	.LASF480
	.byte	0x13
	.byte	0xb6
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x4
	.long	.LASF481
	.byte	0x13
	.byte	0xb7
	.byte	0xc
	.long	0x399
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.long	.LASF479
	.byte	0x13
	.byte	0xb8
	.byte	0x3
	.long	0xf5c
	.uleb128 0x14
	.long	.LASF482
	.byte	0x14
	.byte	0x13
	.byte	0xbd
	.byte	0x10
	.long	0x1006
	.uleb128 0x4
	.long	.LASF480
	.byte	0x13
	.byte	0xbf
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x4
	.long	.LASF481
	.byte	0x13
	.byte	0xc0
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x4
	.long	.LASF483
	.byte	0x13
	.byte	0xc1
	.byte	0xc
	.long	0x399
	.byte	0x8
	.uleb128 0x4
	.long	.LASF484
	.byte	0x13
	.byte	0xc2
	.byte	0xb
	.long	0x369
	.byte	0xc
	.uleb128 0x4
	.long	.LASF485
	.byte	0x13
	.byte	0xc3
	.byte	0xb
	.long	0x369
	.byte	0xd
	.uleb128 0x4
	.long	.LASF486
	.byte	0x13
	.byte	0xc4
	.byte	0xb
	.long	0x369
	.byte	0xe
	.uleb128 0x4
	.long	.LASF487
	.byte	0x13
	.byte	0xc5
	.byte	0xb
	.long	0x369
	.byte	0xf
	.uleb128 0x4
	.long	.LASF488
	.byte	0x13
	.byte	0xc6
	.byte	0xc
	.long	0x38d
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.long	.LASF482
	.byte	0x13
	.byte	0xc7
	.byte	0x3
	.long	0xf90
	.uleb128 0x14
	.long	.LASF489
	.byte	0x18
	.byte	0x13
	.byte	0xcc
	.byte	0x10
	.long	0x1095
	.uleb128 0x4
	.long	.LASF480
	.byte	0x13
	.byte	0xce
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x4
	.long	.LASF481
	.byte	0x13
	.byte	0xcf
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x4
	.long	.LASF490
	.byte	0x13
	.byte	0xd0
	.byte	0xc
	.long	0x399
	.byte	0x8
	.uleb128 0x4
	.long	.LASF484
	.byte	0x13
	.byte	0xd1
	.byte	0xb
	.long	0x369
	.byte	0xc
	.uleb128 0x4
	.long	.LASF485
	.byte	0x13
	.byte	0xd2
	.byte	0xb
	.long	0x369
	.byte	0xd
	.uleb128 0x4
	.long	.LASF486
	.byte	0x13
	.byte	0xd3
	.byte	0xb
	.long	0x369
	.byte	0xe
	.uleb128 0x4
	.long	.LASF487
	.byte	0x13
	.byte	0xd4
	.byte	0xb
	.long	0x369
	.byte	0xf
	.uleb128 0x4
	.long	.LASF488
	.byte	0x13
	.byte	0xd5
	.byte	0xc
	.long	0x38d
	.byte	0x10
	.uleb128 0x4
	.long	.LASF491
	.byte	0x13
	.byte	0xd6
	.byte	0xc
	.long	0x38d
	.byte	0x14
	.byte	0
	.uleb128 0x6
	.long	.LASF489
	.byte	0x13
	.byte	0xd7
	.byte	0x3
	.long	0x1012
	.uleb128 0x14
	.long	.LASF492
	.byte	0x20
	.byte	0x13
	.byte	0xdc
	.byte	0x10
	.long	0x1117
	.uleb128 0x4
	.long	.LASF480
	.byte	0x13
	.byte	0xde
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x4
	.long	.LASF481
	.byte	0x13
	.byte	0xdf
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x4
	.long	.LASF490
	.byte	0x13
	.byte	0xe0
	.byte	0xc
	.long	0x399
	.byte	0x8
	.uleb128 0x4
	.long	.LASF493
	.byte	0x13
	.byte	0xe1
	.byte	0xb
	.long	0x369
	.byte	0xc
	.uleb128 0x4
	.long	.LASF494
	.byte	0x13
	.byte	0xe2
	.byte	0xb
	.long	0x369
	.byte	0xd
	.uleb128 0x4
	.long	.LASF486
	.byte	0x13
	.byte	0xe3
	.byte	0xb
	.long	0x369
	.byte	0xe
	.uleb128 0x4
	.long	.LASF487
	.byte	0x13
	.byte	0xe4
	.byte	0xb
	.long	0x369
	.byte	0xf
	.uleb128 0x4
	.long	.LASF495
	.byte	0x13
	.byte	0xe5
	.byte	0x10
	.long	0xd86
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.long	.LASF492
	.byte	0x13
	.byte	0xe6
	.byte	0x3
	.long	0x10a1
	.uleb128 0x14
	.long	.LASF496
	.byte	0x34
	.byte	0x13
	.byte	0xec
	.byte	0x10
	.long	0x117f
	.uleb128 0x4
	.long	.LASF480
	.byte	0x13
	.byte	0xee
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x4
	.long	.LASF481
	.byte	0x13
	.byte	0xef
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x4
	.long	.LASF490
	.byte	0x13
	.byte	0xf0
	.byte	0xc
	.long	0x399
	.byte	0x8
	.uleb128 0x4
	.long	.LASF497
	.byte	0x13
	.byte	0xf1
	.byte	0xa
	.long	0x310
	.byte	0xc
	.uleb128 0x4
	.long	.LASF498
	.byte	0x13
	.byte	0xf2
	.byte	0xc
	.long	0x38d
	.byte	0x2c
	.uleb128 0x4
	.long	.LASF499
	.byte	0x13
	.byte	0xf3
	.byte	0xc
	.long	0x38d
	.byte	0x30
	.byte	0
	.uleb128 0x6
	.long	.LASF496
	.byte	0x13
	.byte	0xf4
	.byte	0x3
	.long	0x1123
	.uleb128 0x14
	.long	.LASF500
	.byte	0x2c
	.byte	0x13
	.byte	0xfb
	.byte	0x10
	.long	0x11cd
	.uleb128 0x4
	.long	.LASF480
	.byte	0x13
	.byte	0xfd
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x4
	.long	.LASF481
	.byte	0x13
	.byte	0xfe
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x4
	.long	.LASF490
	.byte	0x13
	.byte	0xff
	.byte	0xc
	.long	0x399
	.byte	0x8
	.uleb128 0x2
	.long	.LASF497
	.value	0x100
	.byte	0xa
	.long	0x310
	.byte	0xc
	.byte	0
	.uleb128 0xa
	.long	.LASF500
	.byte	0x13
	.value	0x101
	.byte	0x3
	.long	0x118b
	.uleb128 0xb
	.long	.LASF501
	.byte	0x24
	.value	0x106
	.long	0x1258
	.uleb128 0x2
	.long	.LASF480
	.value	0x108
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x109
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF490
	.value	0x10a
	.byte	0xc
	.long	0x399
	.byte	0x8
	.uleb128 0x2
	.long	.LASF502
	.value	0x10b
	.byte	0xc
	.long	0x399
	.byte	0xc
	.uleb128 0x2
	.long	.LASF493
	.value	0x10c
	.byte	0xc
	.long	0x399
	.byte	0x10
	.uleb128 0xf
	.string	"x"
	.value	0x10d
	.byte	0xc
	.long	0x38d
	.byte	0x14
	.uleb128 0xf
	.string	"y"
	.value	0x10e
	.byte	0xc
	.long	0x38d
	.byte	0x18
	.uleb128 0x2
	.long	.LASF503
	.value	0x10f
	.byte	0xc
	.long	0x38d
	.byte	0x1c
	.uleb128 0x2
	.long	.LASF504
	.value	0x110
	.byte	0xc
	.long	0x38d
	.byte	0x20
	.byte	0
	.uleb128 0xa
	.long	.LASF501
	.byte	0x13
	.value	0x111
	.byte	0x3
	.long	0x11da
	.uleb128 0xb
	.long	.LASF505
	.byte	0x1c
	.value	0x116
	.long	0x12f0
	.uleb128 0x2
	.long	.LASF480
	.value	0x118
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x119
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF490
	.value	0x11a
	.byte	0xc
	.long	0x399
	.byte	0x8
	.uleb128 0x2
	.long	.LASF502
	.value	0x11b
	.byte	0xc
	.long	0x399
	.byte	0xc
	.uleb128 0x2
	.long	.LASF506
	.value	0x11c
	.byte	0xb
	.long	0x369
	.byte	0x10
	.uleb128 0x2
	.long	.LASF493
	.value	0x11d
	.byte	0xb
	.long	0x369
	.byte	0x11
	.uleb128 0x2
	.long	.LASF507
	.value	0x11e
	.byte	0xb
	.long	0x369
	.byte	0x12
	.uleb128 0x2
	.long	.LASF485
	.value	0x11f
	.byte	0xb
	.long	0x369
	.byte	0x13
	.uleb128 0xf
	.string	"x"
	.value	0x120
	.byte	0xc
	.long	0x38d
	.byte	0x14
	.uleb128 0xf
	.string	"y"
	.value	0x121
	.byte	0xc
	.long	0x38d
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.long	.LASF505
	.byte	0x13
	.value	0x122
	.byte	0x3
	.long	0x1265
	.uleb128 0xb
	.long	.LASF508
	.byte	0x24
	.value	0x127
	.long	0x137b
	.uleb128 0x2
	.long	.LASF480
	.value	0x129
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x12a
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF490
	.value	0x12b
	.byte	0xc
	.long	0x399
	.byte	0x8
	.uleb128 0x2
	.long	.LASF502
	.value	0x12c
	.byte	0xc
	.long	0x399
	.byte	0xc
	.uleb128 0xf
	.string	"x"
	.value	0x12d
	.byte	0xc
	.long	0x38d
	.byte	0x10
	.uleb128 0xf
	.string	"y"
	.value	0x12e
	.byte	0xc
	.long	0x38d
	.byte	0x14
	.uleb128 0x2
	.long	.LASF509
	.value	0x12f
	.byte	0xc
	.long	0x399
	.byte	0x18
	.uleb128 0x2
	.long	.LASF510
	.value	0x130
	.byte	0xb
	.long	0x35b
	.byte	0x1c
	.uleb128 0x2
	.long	.LASF511
	.value	0x131
	.byte	0xb
	.long	0x35b
	.byte	0x20
	.byte	0
	.uleb128 0xa
	.long	.LASF508
	.byte	0x13
	.value	0x132
	.byte	0x3
	.long	0x12fd
	.uleb128 0xb
	.long	.LASF512
	.byte	0x14
	.value	0x137
	.long	0x140a
	.uleb128 0x2
	.long	.LASF480
	.value	0x139
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x13a
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x13b
	.byte	0x14
	.long	0xd92
	.byte	0x8
	.uleb128 0x2
	.long	.LASF513
	.value	0x13c
	.byte	0xb
	.long	0x369
	.byte	0xc
	.uleb128 0x2
	.long	.LASF485
	.value	0x13d
	.byte	0xb
	.long	0x369
	.byte	0xd
	.uleb128 0x2
	.long	.LASF486
	.value	0x13e
	.byte	0xb
	.long	0x369
	.byte	0xe
	.uleb128 0x2
	.long	.LASF487
	.value	0x13f
	.byte	0xb
	.long	0x369
	.byte	0xf
	.uleb128 0x2
	.long	.LASF514
	.value	0x140
	.byte	0xc
	.long	0x375
	.byte	0x10
	.uleb128 0x2
	.long	.LASF515
	.value	0x141
	.byte	0xc
	.long	0x381
	.byte	0x12
	.byte	0
	.uleb128 0xa
	.long	.LASF512
	.byte	0x13
	.value	0x142
	.byte	0x3
	.long	0x1388
	.uleb128 0xb
	.long	.LASF516
	.byte	0x14
	.value	0x147
	.long	0x1499
	.uleb128 0x2
	.long	.LASF480
	.value	0x149
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x14a
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x14b
	.byte	0x14
	.long	0xd92
	.byte	0x8
	.uleb128 0x2
	.long	.LASF517
	.value	0x14c
	.byte	0xb
	.long	0x369
	.byte	0xc
	.uleb128 0x2
	.long	.LASF485
	.value	0x14d
	.byte	0xb
	.long	0x369
	.byte	0xd
	.uleb128 0x2
	.long	.LASF486
	.value	0x14e
	.byte	0xb
	.long	0x369
	.byte	0xe
	.uleb128 0x2
	.long	.LASF487
	.value	0x14f
	.byte	0xb
	.long	0x369
	.byte	0xf
	.uleb128 0x2
	.long	.LASF503
	.value	0x150
	.byte	0xc
	.long	0x375
	.byte	0x10
	.uleb128 0x2
	.long	.LASF504
	.value	0x151
	.byte	0xc
	.long	0x375
	.byte	0x12
	.byte	0
	.uleb128 0xa
	.long	.LASF516
	.byte	0x13
	.value	0x152
	.byte	0x3
	.long	0x1417
	.uleb128 0xb
	.long	.LASF518
	.byte	0x10
	.value	0x157
	.long	0x150e
	.uleb128 0x2
	.long	.LASF480
	.value	0x159
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x15a
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x15b
	.byte	0x14
	.long	0xd92
	.byte	0x8
	.uleb128 0xf
	.string	"hat"
	.value	0x15c
	.byte	0xb
	.long	0x369
	.byte	0xc
	.uleb128 0x2
	.long	.LASF514
	.value	0x15d
	.byte	0xb
	.long	0x369
	.byte	0xd
	.uleb128 0x2
	.long	.LASF485
	.value	0x164
	.byte	0xb
	.long	0x369
	.byte	0xe
	.uleb128 0x2
	.long	.LASF486
	.value	0x165
	.byte	0xb
	.long	0x369
	.byte	0xf
	.byte	0
	.uleb128 0xa
	.long	.LASF518
	.byte	0x13
	.value	0x166
	.byte	0x3
	.long	0x14a6
	.uleb128 0xb
	.long	.LASF519
	.byte	0x10
	.value	0x16b
	.long	0x1583
	.uleb128 0x2
	.long	.LASF480
	.value	0x16d
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x16e
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x16f
	.byte	0x14
	.long	0xd92
	.byte	0x8
	.uleb128 0x2
	.long	.LASF506
	.value	0x170
	.byte	0xb
	.long	0x369
	.byte	0xc
	.uleb128 0x2
	.long	.LASF493
	.value	0x171
	.byte	0xb
	.long	0x369
	.byte	0xd
	.uleb128 0x2
	.long	.LASF485
	.value	0x172
	.byte	0xb
	.long	0x369
	.byte	0xe
	.uleb128 0x2
	.long	.LASF486
	.value	0x173
	.byte	0xb
	.long	0x369
	.byte	0xf
	.byte	0
	.uleb128 0xa
	.long	.LASF519
	.byte	0x13
	.value	0x174
	.byte	0x3
	.long	0x151b
	.uleb128 0xb
	.long	.LASF520
	.byte	0xc
	.value	0x179
	.long	0x15c4
	.uleb128 0x2
	.long	.LASF480
	.value	0x17b
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x17c
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x17d
	.byte	0xc
	.long	0x38d
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.long	.LASF520
	.byte	0x13
	.value	0x17e
	.byte	0x3
	.long	0x1590
	.uleb128 0xb
	.long	.LASF521
	.byte	0x14
	.value	0x184
	.long	0x1653
	.uleb128 0x2
	.long	.LASF480
	.value	0x186
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x187
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x188
	.byte	0x14
	.long	0xd92
	.byte	0x8
	.uleb128 0x2
	.long	.LASF513
	.value	0x189
	.byte	0xb
	.long	0x369
	.byte	0xc
	.uleb128 0x2
	.long	.LASF485
	.value	0x18a
	.byte	0xb
	.long	0x369
	.byte	0xd
	.uleb128 0x2
	.long	.LASF486
	.value	0x18b
	.byte	0xb
	.long	0x369
	.byte	0xe
	.uleb128 0x2
	.long	.LASF487
	.value	0x18c
	.byte	0xb
	.long	0x369
	.byte	0xf
	.uleb128 0x2
	.long	.LASF514
	.value	0x18d
	.byte	0xc
	.long	0x375
	.byte	0x10
	.uleb128 0x2
	.long	.LASF515
	.value	0x18e
	.byte	0xc
	.long	0x381
	.byte	0x12
	.byte	0
	.uleb128 0xa
	.long	.LASF521
	.byte	0x13
	.value	0x18f
	.byte	0x3
	.long	0x15d1
	.uleb128 0xb
	.long	.LASF522
	.byte	0x10
	.value	0x195
	.long	0x16c8
	.uleb128 0x2
	.long	.LASF480
	.value	0x197
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x198
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x199
	.byte	0x14
	.long	0xd92
	.byte	0x8
	.uleb128 0x2
	.long	.LASF506
	.value	0x19a
	.byte	0xb
	.long	0x369
	.byte	0xc
	.uleb128 0x2
	.long	.LASF493
	.value	0x19b
	.byte	0xb
	.long	0x369
	.byte	0xd
	.uleb128 0x2
	.long	.LASF485
	.value	0x19c
	.byte	0xb
	.long	0x369
	.byte	0xe
	.uleb128 0x2
	.long	.LASF486
	.value	0x19d
	.byte	0xb
	.long	0x369
	.byte	0xf
	.byte	0
	.uleb128 0xa
	.long	.LASF522
	.byte	0x13
	.value	0x19e
	.byte	0x3
	.long	0x1660
	.uleb128 0xb
	.long	.LASF523
	.byte	0xc
	.value	0x1a4
	.long	0x1709
	.uleb128 0x2
	.long	.LASF480
	.value	0x1a6
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x1a7
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x1a8
	.byte	0xc
	.long	0x38d
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.long	.LASF523
	.byte	0x13
	.value	0x1a9
	.byte	0x3
	.long	0x16d5
	.uleb128 0xb
	.long	.LASF524
	.byte	0x20
	.value	0x1ae
	.long	0x1787
	.uleb128 0x2
	.long	.LASF480
	.value	0x1b0
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x1b1
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x1b2
	.byte	0x14
	.long	0xd92
	.byte	0x8
	.uleb128 0x2
	.long	.LASF525
	.value	0x1b3
	.byte	0xc
	.long	0x38d
	.byte	0xc
	.uleb128 0x2
	.long	.LASF526
	.value	0x1b4
	.byte	0xc
	.long	0x38d
	.byte	0x10
	.uleb128 0xf
	.string	"x"
	.value	0x1b5
	.byte	0xb
	.long	0x35b
	.byte	0x14
	.uleb128 0xf
	.string	"y"
	.value	0x1b6
	.byte	0xb
	.long	0x35b
	.byte	0x18
	.uleb128 0x2
	.long	.LASF527
	.value	0x1b7
	.byte	0xb
	.long	0x35b
	.byte	0x1c
	.byte	0
	.uleb128 0xa
	.long	.LASF524
	.byte	0x13
	.value	0x1b8
	.byte	0x3
	.long	0x1716
	.uleb128 0xb
	.long	.LASF528
	.byte	0x1c
	.value	0x1bd
	.long	0x17e2
	.uleb128 0x2
	.long	.LASF480
	.value	0x1bf
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x1c0
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x1c1
	.byte	0x14
	.long	0xd92
	.byte	0x8
	.uleb128 0x2
	.long	.LASF529
	.value	0x1c2
	.byte	0xc
	.long	0x38d
	.byte	0xc
	.uleb128 0x2
	.long	.LASF530
	.value	0x1c3
	.byte	0xb
	.long	0x17e2
	.byte	0x10
	.byte	0
	.uleb128 0x19
	.long	0x35b
	.long	0x17f2
	.uleb128 0x1c
	.long	0x3a
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	.LASF528
	.byte	0x13
	.value	0x1c4
	.byte	0x3
	.long	0x1794
	.uleb128 0xb
	.long	.LASF531
	.byte	0x10
	.value	0x1c9
	.long	0x1867
	.uleb128 0x2
	.long	.LASF480
	.value	0x1cb
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x1cc
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x1cd
	.byte	0xc
	.long	0x399
	.byte	0x8
	.uleb128 0x2
	.long	.LASF532
	.value	0x1ce
	.byte	0xb
	.long	0x369
	.byte	0xc
	.uleb128 0x2
	.long	.LASF485
	.value	0x1cf
	.byte	0xb
	.long	0x369
	.byte	0xd
	.uleb128 0x2
	.long	.LASF486
	.value	0x1d0
	.byte	0xb
	.long	0x369
	.byte	0xe
	.uleb128 0x2
	.long	.LASF487
	.value	0x1d1
	.byte	0xb
	.long	0x369
	.byte	0xf
	.byte	0
	.uleb128 0xa
	.long	.LASF531
	.byte	0x13
	.value	0x1d2
	.byte	0x3
	.long	0x17ff
	.uleb128 0xb
	.long	.LASF533
	.byte	0x30
	.value	0x1d8
	.long	0x18fd
	.uleb128 0x2
	.long	.LASF480
	.value	0x1da
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x1db
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF534
	.value	0x1dc
	.byte	0x11
	.long	0xd9e
	.byte	0x8
	.uleb128 0x2
	.long	.LASF535
	.value	0x1dd
	.byte	0x12
	.long	0xdaa
	.byte	0x10
	.uleb128 0xf
	.string	"x"
	.value	0x1de
	.byte	0xb
	.long	0x35b
	.byte	0x18
	.uleb128 0xf
	.string	"y"
	.value	0x1df
	.byte	0xb
	.long	0x35b
	.byte	0x1c
	.uleb128 0xf
	.string	"dx"
	.value	0x1e0
	.byte	0xb
	.long	0x35b
	.byte	0x20
	.uleb128 0xf
	.string	"dy"
	.value	0x1e1
	.byte	0xb
	.long	0x35b
	.byte	0x24
	.uleb128 0x2
	.long	.LASF527
	.value	0x1e2
	.byte	0xb
	.long	0x35b
	.byte	0x28
	.uleb128 0x2
	.long	.LASF490
	.value	0x1e3
	.byte	0xc
	.long	0x399
	.byte	0x2c
	.byte	0
	.uleb128 0xa
	.long	.LASF533
	.byte	0x13
	.value	0x1e4
	.byte	0x3
	.long	0x1874
	.uleb128 0xb
	.long	.LASF536
	.byte	0x28
	.value	0x1ea
	.long	0x1988
	.uleb128 0x2
	.long	.LASF480
	.value	0x1ec
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x1ed
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF534
	.value	0x1ee
	.byte	0x11
	.long	0xd9e
	.byte	0x8
	.uleb128 0x2
	.long	.LASF537
	.value	0x1ef
	.byte	0xb
	.long	0x35b
	.byte	0x10
	.uleb128 0x2
	.long	.LASF538
	.value	0x1f0
	.byte	0xb
	.long	0x35b
	.byte	0x14
	.uleb128 0xf
	.string	"x"
	.value	0x1f1
	.byte	0xb
	.long	0x35b
	.byte	0x18
	.uleb128 0xf
	.string	"y"
	.value	0x1f2
	.byte	0xb
	.long	0x35b
	.byte	0x1c
	.uleb128 0x2
	.long	.LASF539
	.value	0x1f3
	.byte	0xc
	.long	0x381
	.byte	0x20
	.uleb128 0x2
	.long	.LASF540
	.value	0x1f4
	.byte	0xc
	.long	0x381
	.byte	0x22
	.byte	0
	.uleb128 0xa
	.long	.LASF536
	.byte	0x13
	.value	0x1f5
	.byte	0x3
	.long	0x190a
	.uleb128 0xb
	.long	.LASF541
	.byte	0x28
	.value	0x1fb
	.long	0x1a06
	.uleb128 0x2
	.long	.LASF480
	.value	0x1fd
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x1fe
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF534
	.value	0x1ff
	.byte	0x11
	.long	0xd9e
	.byte	0x8
	.uleb128 0x2
	.long	.LASF542
	.value	0x200
	.byte	0x13
	.long	0xdb6
	.byte	0x10
	.uleb128 0x2
	.long	.LASF539
	.value	0x201
	.byte	0xc
	.long	0x399
	.byte	0x18
	.uleb128 0x2
	.long	.LASF543
	.value	0x202
	.byte	0xb
	.long	0x35b
	.byte	0x1c
	.uleb128 0xf
	.string	"x"
	.value	0x203
	.byte	0xb
	.long	0x35b
	.byte	0x20
	.uleb128 0xf
	.string	"y"
	.value	0x204
	.byte	0xb
	.long	0x35b
	.byte	0x24
	.byte	0
	.uleb128 0xa
	.long	.LASF541
	.byte	0x13
	.value	0x205
	.byte	0x3
	.long	0x1995
	.uleb128 0xb
	.long	.LASF544
	.byte	0x18
	.value	0x20d
	.long	0x1a54
	.uleb128 0x2
	.long	.LASF480
	.value	0x20f
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x210
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF545
	.value	0x211
	.byte	0xb
	.long	0xd4
	.byte	0x8
	.uleb128 0x2
	.long	.LASF490
	.value	0x212
	.byte	0xc
	.long	0x399
	.byte	0x10
	.byte	0
	.uleb128 0xa
	.long	.LASF544
	.byte	0x13
	.value	0x213
	.byte	0x3
	.long	0x1a13
	.uleb128 0xb
	.long	.LASF546
	.byte	0x24
	.value	0x219
	.long	0x1aa2
	.uleb128 0x2
	.long	.LASF480
	.value	0x21b
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x21c
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF502
	.value	0x21d
	.byte	0xc
	.long	0x38d
	.byte	0x8
	.uleb128 0x2
	.long	.LASF530
	.value	0x21e
	.byte	0xb
	.long	0x1aa2
	.byte	0xc
	.byte	0
	.uleb128 0x19
	.long	0x35b
	.long	0x1ab2
	.uleb128 0x1c
	.long	0x3a
	.byte	0x5
	.byte	0
	.uleb128 0xa
	.long	.LASF546
	.byte	0x13
	.value	0x21f
	.byte	0x3
	.long	0x1a61
	.uleb128 0xb
	.long	.LASF547
	.byte	0x8
	.value	0x224
	.long	0x1ae6
	.uleb128 0x2
	.long	.LASF480
	.value	0x226
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x227
	.byte	0xc
	.long	0x399
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.long	.LASF547
	.byte	0x13
	.value	0x228
	.byte	0x3
	.long	0x1abf
	.uleb128 0xb
	.long	.LASF548
	.byte	0x20
	.value	0x236
	.long	0x1b4e
	.uleb128 0x2
	.long	.LASF480
	.value	0x238
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x239
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0x2
	.long	.LASF490
	.value	0x23a
	.byte	0xc
	.long	0x399
	.byte	0x8
	.uleb128 0x2
	.long	.LASF549
	.value	0x23b
	.byte	0xc
	.long	0x38d
	.byte	0xc
	.uleb128 0x2
	.long	.LASF488
	.value	0x23c
	.byte	0xb
	.long	0x48
	.byte	0x10
	.uleb128 0x2
	.long	.LASF491
	.value	0x23d
	.byte	0xb
	.long	0x48
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.long	.LASF548
	.byte	0x13
	.value	0x23e
	.byte	0x3
	.long	0x1af3
	.uleb128 0xa
	.long	.LASF550
	.byte	0x13
	.value	0x242
	.byte	0x1d
	.long	0x1b68
	.uleb128 0x1b
	.long	.LASF550
	.uleb128 0xb
	.long	.LASF551
	.byte	0x10
	.value	0x24a
	.long	0x1ba1
	.uleb128 0x2
	.long	.LASF480
	.value	0x24c
	.byte	0xc
	.long	0x399
	.byte	0
	.uleb128 0x2
	.long	.LASF481
	.value	0x24d
	.byte	0xc
	.long	0x399
	.byte	0x4
	.uleb128 0xf
	.string	"msg"
	.value	0x24e
	.byte	0x13
	.long	0x1ba1
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.long	0x1b5b
	.uleb128 0xa
	.long	.LASF551
	.byte	0x13
	.value	0x24f
	.byte	0x3
	.long	0x1b6d
	.uleb128 0x2b
	.long	.LASF575
	.byte	0x38
	.byte	0x13
	.value	0x254
	.byte	0xf
	.long	0x1d2b
	.uleb128 0x8
	.long	.LASF480
	.value	0x256
	.byte	0xc
	.long	0x399
	.uleb128 0x8
	.long	.LASF552
	.value	0x257
	.byte	0x15
	.long	0xf84
	.uleb128 0x8
	.long	.LASF483
	.value	0x258
	.byte	0x16
	.long	0x1006
	.uleb128 0x8
	.long	.LASF553
	.value	0x259
	.byte	0x15
	.long	0x1095
	.uleb128 0x2c
	.string	"key"
	.byte	0x13
	.value	0x25a
	.byte	0x17
	.long	0x1117
	.uleb128 0x8
	.long	.LASF554
	.value	0x25b
	.byte	0x1a
	.long	0x117f
	.uleb128 0x8
	.long	.LASF497
	.value	0x25c
	.byte	0x18
	.long	0x11cd
	.uleb128 0x8
	.long	.LASF555
	.value	0x25d
	.byte	0x1a
	.long	0x1258
	.uleb128 0x8
	.long	.LASF506
	.value	0x25e
	.byte	0x1a
	.long	0x12f0
	.uleb128 0x8
	.long	.LASF556
	.value	0x25f
	.byte	0x19
	.long	0x137b
	.uleb128 0x8
	.long	.LASF557
	.value	0x260
	.byte	0x16
	.long	0x140a
	.uleb128 0x8
	.long	.LASF558
	.value	0x261
	.byte	0x16
	.long	0x1499
	.uleb128 0x8
	.long	.LASF559
	.value	0x262
	.byte	0x15
	.long	0x150e
	.uleb128 0x8
	.long	.LASF560
	.value	0x263
	.byte	0x18
	.long	0x1583
	.uleb128 0x8
	.long	.LASF561
	.value	0x264
	.byte	0x18
	.long	0x15c4
	.uleb128 0x8
	.long	.LASF562
	.value	0x265
	.byte	0x1d
	.long	0x1653
	.uleb128 0x8
	.long	.LASF563
	.value	0x266
	.byte	0x1f
	.long	0x16c8
	.uleb128 0x8
	.long	.LASF564
	.value	0x267
	.byte	0x1f
	.long	0x1709
	.uleb128 0x8
	.long	.LASF565
	.value	0x268
	.byte	0x21
	.long	0x1787
	.uleb128 0x8
	.long	.LASF566
	.value	0x269
	.byte	0x1f
	.long	0x17f2
	.uleb128 0x8
	.long	.LASF567
	.value	0x26a
	.byte	0x1a
	.long	0x1867
	.uleb128 0x8
	.long	.LASF529
	.value	0x26b
	.byte	0x15
	.long	0x1ab2
	.uleb128 0x8
	.long	.LASF568
	.value	0x26c
	.byte	0x13
	.long	0x1ae6
	.uleb128 0x8
	.long	.LASF569
	.value	0x26d
	.byte	0x13
	.long	0x1b4e
	.uleb128 0x8
	.long	.LASF570
	.value	0x26e
	.byte	0x14
	.long	0x1ba6
	.uleb128 0x8
	.long	.LASF571
	.value	0x26f
	.byte	0x1a
	.long	0x18fd
	.uleb128 0x8
	.long	.LASF572
	.value	0x270
	.byte	0x1b
	.long	0x1988
	.uleb128 0x8
	.long	.LASF573
	.value	0x271
	.byte	0x1c
	.long	0x1a06
	.uleb128 0x8
	.long	.LASF574
	.value	0x272
	.byte	0x13
	.long	0x1a54
	.uleb128 0x8
	.long	.LASF540
	.value	0x281
	.byte	0xb
	.long	0x1d2b
	.byte	0
	.uleb128 0x19
	.long	0x369
	.long	0x1d3b
	.uleb128 0x1c
	.long	0x3a
	.byte	0x37
	.byte	0
	.uleb128 0xa
	.long	.LASF575
	.byte	0x13
	.value	0x282
	.byte	0x3
	.long	0x1bb3
	.uleb128 0xe
	.long	0x1d3b
	.uleb128 0x13
	.long	0x41
	.byte	0x14
	.byte	0x4a
	.long	0x1d7d
	.uleb128 0x1
	.long	.LASF576
	.byte	0
	.uleb128 0x1
	.long	.LASF577
	.byte	0x1
	.uleb128 0x1
	.long	.LASF578
	.byte	0x2
	.uleb128 0x1
	.long	.LASF579
	.byte	0x3
	.uleb128 0x1
	.long	.LASF580
	.byte	0x4
	.uleb128 0x1
	.long	.LASF581
	.byte	0x5
	.byte	0
	.uleb128 0x13
	.long	0x41
	.byte	0x15
	.byte	0x70
	.long	0x1d9b
	.uleb128 0x1
	.long	.LASF582
	.byte	0
	.uleb128 0x1
	.long	.LASF583
	.byte	0x1
	.uleb128 0x1
	.long	.LASF584
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.long	.LASF585
	.byte	0x15
	.byte	0x8e
	.byte	0x1d
	.long	0x1da7
	.uleb128 0x1b
	.long	.LASF585
	.uleb128 0x6
	.long	.LASF586
	.byte	0x15
	.byte	0x94
	.byte	0x1c
	.long	0x1db8
	.uleb128 0x1b
	.long	.LASF586
	.uleb128 0xd
	.long	.LASF587
	.byte	0x16
	.byte	0xc
	.long	0x96
	.uleb128 0x9
	.byte	0x3
	.quad	minX
	.uleb128 0xd
	.long	.LASF588
	.byte	0x16
	.byte	0x19
	.long	0x96
	.uleb128 0x9
	.byte	0x3
	.quad	maxX
	.uleb128 0xd
	.long	.LASF589
	.byte	0x16
	.byte	0x24
	.long	0x96
	.uleb128 0x9
	.byte	0x3
	.quad	minY
	.uleb128 0xd
	.long	.LASF590
	.byte	0x16
	.byte	0x31
	.long	0x96
	.uleb128 0x9
	.byte	0x3
	.quad	maxY
	.uleb128 0xd
	.long	.LASF591
	.byte	0x18
	.byte	0x14
	.long	0x743
	.uleb128 0x9
	.byte	0x3
	.quad	myWindow
	.uleb128 0xd
	.long	.LASF592
	.byte	0x19
	.byte	0x16
	.long	0x1e3b
	.uleb128 0x9
	.byte	0x3
	.quad	myRenderer
	.uleb128 0xe
	.long	0x1d9b
	.uleb128 0xd
	.long	.LASF593
	.byte	0x1a
	.byte	0x15
	.long	0x1e55
	.uleb128 0x9
	.byte	0x3
	.quad	myTexture
	.uleb128 0xe
	.long	0x1dac
	.uleb128 0x19
	.long	0x399
	.long	0x1e6d
	.uleb128 0x2d
	.long	0x3a
	.long	0x752ff
	.byte	0
	.uleb128 0xd
	.long	.LASF594
	.byte	0x1c
	.byte	0xf
	.long	0x1e5a
	.uleb128 0x9
	.byte	0x3
	.quad	myPixArray
	.uleb128 0x14
	.long	.LASF595
	.byte	0xc
	.byte	0x1
	.byte	0x1f
	.byte	0xf
	.long	0x1eb1
	.uleb128 0x18
	.string	"r"
	.byte	0x1
	.byte	0x20
	.byte	0x7
	.long	0x96
	.byte	0
	.uleb128 0x18
	.string	"g"
	.byte	0x1
	.byte	0x20
	.byte	0xa
	.long	0x96
	.byte	0x4
	.uleb128 0x18
	.string	"b"
	.byte	0x1
	.byte	0x20
	.byte	0xd
	.long	0x96
	.byte	0x8
	.byte	0
	.uleb128 0x19
	.long	0x1e82
	.long	0x1ec1
	.uleb128 0x1c
	.long	0x3a
	.byte	0xbf
	.byte	0
	.uleb128 0xd
	.long	.LASF596
	.byte	0x21
	.byte	0x3
	.long	0x1eb1
	.uleb128 0x9
	.byte	0x3
	.quad	colormap
	.uleb128 0x2e
	.long	.LASF597
	.byte	0x16
	.byte	0x93
	.byte	0x35
	.long	0x1ee8
	.uleb128 0x7
	.long	0x399
	.byte	0
	.uleb128 0x2f
	.long	.LASF598
	.byte	0x15
	.value	0x6ba
	.byte	0x35
	.long	0x1efb
	.uleb128 0x7
	.long	0x1e3b
	.byte	0
	.uleb128 0x1a
	.long	.LASF599
	.byte	0x15
	.value	0x56a
	.byte	0x34
	.long	0x96
	.long	0x1f21
	.uleb128 0x7
	.long	0x1e3b
	.uleb128 0x7
	.long	0x1e55
	.uleb128 0x7
	.long	0x1f21
	.uleb128 0x7
	.long	0x1f21
	.byte	0
	.uleb128 0xe
	.long	0x6ee
	.uleb128 0x1a
	.long	.LASF600
	.byte	0x15
	.value	0x246
	.byte	0x34
	.long	0x96
	.long	0x1f4c
	.uleb128 0x7
	.long	0x1e55
	.uleb128 0x7
	.long	0x1f21
	.uleb128 0x7
	.long	0x320
	.uleb128 0x7
	.long	0x96
	.byte	0
	.uleb128 0x1a
	.long	.LASF601
	.byte	0x13
	.value	0x354
	.byte	0x34
	.long	0x96
	.long	0x1f63
	.uleb128 0x7
	.long	0x1d48
	.byte	0
	.uleb128 0x1a
	.long	.LASF602
	.byte	0x15
	.value	0x1de
	.byte	0x34
	.long	0x96
	.long	0x1f7f
	.uleb128 0x7
	.long	0x1e55
	.uleb128 0x7
	.long	0x726
	.byte	0
	.uleb128 0x1a
	.long	.LASF603
	.byte	0x15
	.value	0x142
	.byte	0x3e
	.long	0x1e55
	.long	0x1faa
	.uleb128 0x7
	.long	0x1e3b
	.uleb128 0x7
	.long	0x399
	.uleb128 0x7
	.long	0x96
	.uleb128 0x7
	.long	0x96
	.uleb128 0x7
	.long	0x96
	.byte	0
	.uleb128 0x22
	.long	.LASF604
	.byte	0x15
	.byte	0xe3
	.byte	0x3f
	.long	0x1e3b
	.long	0x1fca
	.uleb128 0x7
	.long	0x743
	.uleb128 0x7
	.long	0x96
	.uleb128 0x7
	.long	0x399
	.byte	0
	.uleb128 0x1a
	.long	.LASF605
	.byte	0xc
	.value	0x2e2
	.byte	0x3d
	.long	0x743
	.long	0x1ffa
	.uleb128 0x7
	.long	0x32d
	.uleb128 0x7
	.long	0x96
	.uleb128 0x7
	.long	0x96
	.uleb128 0x7
	.long	0x96
	.uleb128 0x7
	.long	0x96
	.uleb128 0x7
	.long	0x399
	.byte	0
	.uleb128 0x30
	.long	.LASF657
	.byte	0x19
	.byte	0xde
	.byte	0x35
	.uleb128 0x1a
	.long	.LASF606
	.byte	0x17
	.value	0x25a
	.byte	0xc
	.long	0x96
	.long	0x2019
	.uleb128 0x7
	.long	0x2019
	.byte	0
	.uleb128 0xe
	.long	0x201e
	.uleb128 0x31
	.uleb128 0x32
	.long	.LASF607
	.byte	0x17
	.value	0x270
	.byte	0xd
	.long	0x2032
	.uleb128 0x7
	.long	0x96
	.byte	0
	.uleb128 0x1a
	.long	.LASF608
	.byte	0x18
	.value	0x15e
	.byte	0xc
	.long	0x96
	.long	0x204f
	.uleb128 0x7
	.long	0x2cd
	.uleb128 0x7
	.long	0x332
	.uleb128 0x33
	.byte	0
	.uleb128 0x34
	.long	.LASF658
	.byte	0x1a
	.byte	0x67
	.byte	0x3d
	.long	0x32d
	.uleb128 0x22
	.long	.LASF609
	.byte	0x19
	.byte	0x8f
	.byte	0x34
	.long	0x96
	.long	0x2071
	.uleb128 0x7
	.long	0x399
	.byte	0
	.uleb128 0x1f
	.long	.LASF610
	.value	0x1e3
	.quad	.LFB4224
	.quad	.LFE4224-.LFB4224
	.uleb128 0x1
	.byte	0x9c
	.long	0x209d
	.uleb128 0x15
	.string	"ms"
	.value	0x1e3
	.byte	0x18
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1f
	.long	.LASF611
	.value	0x1b6
	.quad	.LFB4223
	.quad	.LFE4223-.LFB4223
	.uleb128 0x1
	.byte	0x9c
	.long	0x20dc
	.uleb128 0x11
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.uleb128 0xc
	.long	.LASF612
	.value	0x1bc
	.byte	0xe
	.long	0x6e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF634
	.value	0x1ac
	.quad	.LFB4222
	.quad	.LFE4222-.LFB4222
	.uleb128 0x1
	.byte	0x9c
	.long	0x210a
	.uleb128 0xc
	.long	.LASF484
	.value	0x1ae
	.byte	0xd
	.long	0x1d3b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x1f
	.long	.LASF613
	.value	0x153
	.quad	.LFB4221
	.quad	.LFE4221-.LFB4221
	.uleb128 0x1
	.byte	0x9c
	.long	0x22b2
	.uleb128 0x12
	.long	.LASF614
	.value	0x153
	.byte	0x1a
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x12
	.long	.LASF615
	.value	0x153
	.byte	0x27
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x12
	.long	.LASF616
	.value	0x153
	.byte	0x34
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x12
	.long	.LASF617
	.value	0x153
	.byte	0x3e
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x15
	.string	"r"
	.value	0x154
	.byte	0x1a
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x15
	.string	"g"
	.value	0x154
	.byte	0x21
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x15
	.string	"b"
	.value	0x154
	.byte	0x28
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.long	.LASF618
	.value	0x154
	.byte	0x2f
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xc
	.long	.LASF619
	.value	0x156
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xc
	.long	.LASF620
	.value	0x157
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF621
	.value	0x158
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.long	.LASF622
	.value	0x159
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.long	.LASF623
	.value	0x162
	.byte	0xa
	.long	0x399
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0xc
	.long	.LASF624
	.value	0x168
	.byte	0x9
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF625
	.value	0x169
	.byte	0x9
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.string	"x"
	.value	0x16a
	.byte	0x9
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x16
	.string	"y"
	.value	0x16b
	.byte	0x9
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xc
	.long	.LASF626
	.value	0x16c
	.byte	0x9
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0xc
	.long	.LASF627
	.value	0x16d
	.byte	0x9
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x16
	.string	"err"
	.value	0x16e
	.byte	0x9
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xc
	.long	.LASF628
	.value	0x16f
	.byte	0x9
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xc
	.long	.LASF629
	.value	0x170
	.byte	0x9
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xc
	.long	.LASF630
	.value	0x171
	.byte	0x9
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.long	.LASF631
	.value	0x172
	.byte	0x9
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xc
	.long	.LASF632
	.value	0x173
	.byte	0x9
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF633
	.value	0x14c
	.quad	.LFB4220
	.quad	.LFE4220-.LFB4220
	.uleb128 0x1
	.byte	0x9c
	.long	0x2333
	.uleb128 0x12
	.long	.LASF614
	.value	0x14c
	.byte	0x16
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.long	.LASF615
	.value	0x14c
	.byte	0x23
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.long	.LASF616
	.value	0x14c
	.byte	0x30
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.long	.LASF617
	.value	0x14c
	.byte	0x3a
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.string	"r"
	.value	0x14d
	.byte	0x16
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.string	"g"
	.value	0x14d
	.byte	0x1d
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.string	"b"
	.value	0x14d
	.byte	0x24
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.long	.LASF635
	.value	0x133
	.quad	.LFB4219
	.quad	.LFE4219-.LFB4219
	.uleb128 0x1
	.byte	0x9c
	.long	0x23f1
	.uleb128 0x12
	.long	.LASF614
	.value	0x133
	.byte	0x1e
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.long	.LASF615
	.value	0x133
	.byte	0x2b
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.string	"x1"
	.value	0x133
	.byte	0x38
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x15
	.string	"x2"
	.value	0x133
	.byte	0x40
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.string	"y"
	.value	0x133
	.byte	0x48
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x12
	.long	.LASF623
	.value	0x134
	.byte	0x21
	.long	0x399
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x12
	.long	.LASF618
	.value	0x134
	.byte	0x2c
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.string	"mY"
	.value	0x138
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.string	"pY"
	.value	0x139
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x16
	.string	"i"
	.value	0x140
	.byte	0xc
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	.LASF636
	.byte	0xfa
	.quad	.LFB4218
	.quad	.LFE4218-.LFB4218
	.uleb128 0x1
	.byte	0x9c
	.long	0x2538
	.uleb128 0x9
	.string	"x1"
	.byte	0xfa
	.byte	0x16
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x9
	.string	"y1"
	.byte	0xfa
	.byte	0x1e
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x9
	.string	"x2"
	.byte	0xfa
	.byte	0x26
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x9
	.string	"y2"
	.byte	0xfa
	.byte	0x2e
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x9
	.string	"r"
	.byte	0xfa
	.byte	0x36
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x9
	.string	"g"
	.byte	0xfa
	.byte	0x3d
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x9
	.string	"b"
	.byte	0xfa
	.byte	0x44
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xc
	.long	.LASF623
	.value	0x116
	.byte	0xa
	.long	0x399
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF637
	.value	0x118
	.byte	0x7
	.long	0x2538
	.uleb128 0x2
	.byte	0x91
	.sleb128 -53
	.uleb128 0xc
	.long	.LASF638
	.value	0x123
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.long	.LASF639
	.value	0x124
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF543
	.value	0x125
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x16
	.string	"y"
	.value	0x126
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.long	.LASF640
	.value	0x127
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x24
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x24f5
	.uleb128 0x16
	.string	"t"
	.value	0x11a
	.byte	0x9
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x24
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x2518
	.uleb128 0x16
	.string	"t"
	.value	0x11f
	.byte	0x9
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x11
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x16
	.string	"x"
	.value	0x128
	.byte	0xc
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.byte	0x2
	.long	.LASF641
	.uleb128 0x1d
	.long	.LASF642
	.byte	0xd7
	.quad	.LFB4217
	.quad	.LFE4217-.LFB4217
	.uleb128 0x1
	.byte	0x9c
	.long	0x266b
	.uleb128 0x9
	.string	"X1"
	.byte	0xd7
	.byte	0x1c
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x9
	.string	"Y1"
	.byte	0xd7
	.byte	0x24
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x9
	.string	"X2"
	.byte	0xd7
	.byte	0x2c
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x9
	.string	"Y2"
	.byte	0xd7
	.byte	0x34
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x9
	.string	"r"
	.byte	0xd8
	.byte	0x1c
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x9
	.string	"g"
	.byte	0xd8
	.byte	0x23
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x9
	.string	"b"
	.byte	0xd8
	.byte	0x2a
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.long	.LASF643
	.byte	0xda
	.byte	0x7
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xd
	.long	.LASF644
	.byte	0xdb
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xd
	.long	.LASF630
	.byte	0xdc
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xd
	.long	.LASF631
	.byte	0xdd
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xd
	.long	.LASF623
	.byte	0xe5
	.byte	0xa
	.long	0x399
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x17
	.string	"e1"
	.byte	0xe8
	.byte	0xb
	.long	0x266b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x17
	.string	"p1"
	.byte	0xe9
	.byte	0x10
	.long	0x266b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x17
	.string	"e2"
	.byte	0xed
	.byte	0xd
	.long	0x266b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x17
	.string	"p2"
	.byte	0xee
	.byte	0x12
	.long	0x266b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0x399
	.uleb128 0x1d
	.long	.LASF645
	.byte	0xb2
	.quad	.LFB4216
	.quad	.LFE4216-.LFB4216
	.uleb128 0x1
	.byte	0x9c
	.long	0x27a0
	.uleb128 0x1e
	.long	.LASF614
	.byte	0xb2
	.byte	0x16
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1e
	.long	.LASF615
	.byte	0xb2
	.byte	0x23
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1e
	.long	.LASF646
	.byte	0xb2
	.byte	0x30
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x1e
	.long	.LASF647
	.byte	0xb2
	.byte	0x3a
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x9
	.string	"r"
	.byte	0xb3
	.byte	0x16
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x9
	.string	"g"
	.byte	0xb3
	.byte	0x1d
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x9
	.string	"b"
	.byte	0xb3
	.byte	0x24
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.long	.LASF643
	.byte	0xb5
	.byte	0x7
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xd
	.long	.LASF644
	.byte	0xb6
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xd
	.long	.LASF630
	.byte	0xb7
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xd
	.long	.LASF631
	.byte	0xb8
	.byte	0x7
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xd
	.long	.LASF623
	.byte	0xc2
	.byte	0xa
	.long	0x399
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x17
	.string	"e1"
	.byte	0xc5
	.byte	0xb
	.long	0x266b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x17
	.string	"p1"
	.byte	0xc6
	.byte	0x10
	.long	0x266b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x17
	.string	"e2"
	.byte	0xca
	.byte	0xd
	.long	0x266b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x17
	.string	"p2"
	.byte	0xcb
	.byte	0x12
	.long	0x266b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	.LASF648
	.byte	0xa8
	.quad	.LFB4215
	.quad	.LFE4215-.LFB4215
	.uleb128 0x1
	.byte	0x9c
	.long	0x2803
	.uleb128 0x9
	.string	"x"
	.byte	0xa8
	.byte	0x1d
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x9
	.string	"y"
	.byte	0xa8
	.byte	0x24
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.long	.LASF649
	.byte	0xa8
	.byte	0x2b
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0xd
	.long	.LASF650
	.byte	0xad
	.byte	0x14
	.long	0x2803
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0x1e82
	.uleb128 0x1d
	.long	.LASF651
	.byte	0x97
	.quad	.LFB4214
	.quad	.LFE4214-.LFB4214
	.uleb128 0x1
	.byte	0x9c
	.long	0x2861
	.uleb128 0x9
	.string	"x"
	.byte	0x97
	.byte	0x17
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.string	"y"
	.byte	0x97
	.byte	0x1e
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.string	"r"
	.byte	0x97
	.byte	0x25
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x9
	.string	"g"
	.byte	0x97
	.byte	0x2c
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.string	"b"
	.byte	0x97
	.byte	0x33
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x1d
	.long	.LASF652
	.byte	0x88
	.quad	.LFB4213
	.quad	.LFE4213-.LFB4213
	.uleb128 0x1
	.byte	0x9c
	.long	0x28aa
	.uleb128 0xd
	.long	.LASF623
	.byte	0x8a
	.byte	0xa
	.long	0x399
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x17
	.string	"p"
	.byte	0x8c
	.byte	0x10
	.long	0x266b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	.LASF653
	.byte	0x1
	.byte	0x83
	.byte	0x14
	.quad	.LFB4212
	.quad	.LFE4212-.LFB4212
	.uleb128 0x1
	.byte	0x9c
	.long	0x28ef
	.uleb128 0x9
	.string	"x"
	.byte	0x83
	.byte	0x21
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.string	"y"
	.byte	0x83
	.byte	0x28
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.long	.LASF623
	.byte	0x83
	.byte	0x32
	.long	0x399
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x36
	.long	.LASF659
	.byte	0x1
	.byte	0x7d
	.byte	0x16
	.long	0x399
	.quad	.LFB4211
	.quad	.LFE4211-.LFB4211
	.uleb128 0x1
	.byte	0x9c
	.long	0x2936
	.uleb128 0x9
	.string	"r"
	.byte	0x7d
	.byte	0x24
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.string	"g"
	.byte	0x7d
	.byte	0x2b
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.string	"b"
	.byte	0x7d
	.byte	0x32
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x37
	.long	.LASF660
	.byte	0x1
	.byte	0x78
	.byte	0x6
	.quad	.LFB4210
	.quad	.LFE4210-.LFB4210
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x38
	.long	.LASF661
	.byte	0x1
	.byte	0x23
	.byte	0x6
	.quad	.LFB4209
	.quad	.LFE4209-.LFB4209
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x17
	.string	"i"
	.byte	0x61
	.byte	0xc
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 19
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 19
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
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
	.sleb128 19
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 19
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0x21
	.sleb128 7
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x1e
	.uleb128 0x5
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
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x20
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x32
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
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x38
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
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
.LASF318:
	.string	"SDL_SCANCODE_CANCEL"
.LASF111:
	.string	"SDL_PIXELFORMAT_INDEX1MSB"
.LASF161:
	.string	"SDL_BLENDMODE_NONE"
.LASF484:
	.string	"event"
.LASF214:
	.string	"SDL_SCANCODE_RIGHTBRACKET"
.LASF47:
	.string	"_unused2"
.LASF562:
	.string	"caxis"
.LASF33:
	.string	"_fileno"
.LASF612:
	.string	"updRect"
.LASF593:
	.string	"myTexture"
.LASF578:
	.string	"SDL_MESSAGEBOX_COLOR_BUTTON_BORDER"
.LASF294:
	.string	"SDL_SCANCODE_VOLUMEUP"
.LASF479:
	.string	"SDL_CommonEvent"
.LASF658:
	.string	"SDL_GetError"
.LASF533:
	.string	"SDL_TouchFingerEvent"
.LASF374:
	.string	"SDL_SCANCODE_LCTRL"
.LASF8:
	.string	"__uint8_t"
.LASF74:
	.string	"SDL_PIXELTYPE_PACKED16"
.LASF641:
	.string	"_Bool"
.LASF411:
	.string	"SDL_SCANCODE_AUDIOFASTFORWARD"
.LASF357:
	.string	"SDL_SCANCODE_KP_SPACE"
.LASF169:
	.string	"SDL_SCANCODE_UNKNOWN"
.LASF336:
	.string	"SDL_SCANCODE_KP_LEFTBRACE"
.LASF447:
	.string	"SDL_JOYBUTTONUP"
.LASF552:
	.string	"common"
.LASF38:
	.string	"_shortbuf"
.LASF118:
	.string	"SDL_PIXELFORMAT_XBGR4444"
.LASF538:
	.string	"dDist"
.LASF427:
	.string	"SDL_APP_DIDENTERBACKGROUND"
.LASF124:
	.string	"SDL_PIXELFORMAT_ARGB4444"
.LASF559:
	.string	"jhat"
.LASF586:
	.string	"SDL_Texture"
.LASF302:
	.string	"SDL_SCANCODE_INTERNATIONAL5"
.LASF560:
	.string	"jbutton"
.LASF75:
	.string	"SDL_PIXELTYPE_PACKED32"
.LASF59:
	.string	"uint16_t"
.LASF119:
	.string	"SDL_PIXELFORMAT_BGR444"
.LASF381:
	.string	"SDL_SCANCODE_RGUI"
.LASF19:
	.string	"_flags"
.LASF70:
	.string	"SDL_PIXELTYPE_INDEX1"
.LASF71:
	.string	"SDL_PIXELTYPE_INDEX4"
.LASF72:
	.string	"SDL_PIXELTYPE_INDEX8"
.LASF206:
	.string	"SDL_SCANCODE_RETURN"
.LASF471:
	.string	"SDL_AUDIODEVICEADDED"
.LASF16:
	.string	"__off_t"
.LASF267:
	.string	"SDL_SCANCODE_APPLICATION"
.LASF350:
	.string	"SDL_SCANCODE_KP_GREATER"
.LASF422:
	.string	"SDL_FIRSTEVENT"
.LASF601:
	.string	"SDL_PollEvent"
.LASF413:
	.string	"SDL_Scancode"
.LASF39:
	.string	"_lock"
.LASF438:
	.string	"SDL_KEYMAPCHANGED"
.LASF108:
	.string	"SDL_PACKEDLAYOUT_1010102"
.LASF388:
	.string	"SDL_SCANCODE_MEDIASELECT"
.LASF553:
	.string	"window"
.LASF54:
	.string	"int32_t"
.LASF79:
	.string	"SDL_PIXELTYPE_ARRAYF16"
.LASF236:
	.string	"SDL_SCANCODE_PRINTSCREEN"
.LASF148:
	.string	"SDL_PIXELFORMAT_ARGB32"
.LASF474:
	.string	"SDL_RENDER_TARGETS_RESET"
.LASF247:
	.string	"SDL_SCANCODE_DOWN"
.LASF82:
	.string	"SDL_BITMAPORDER_4321"
.LASF396:
	.string	"SDL_SCANCODE_AC_FORWARD"
.LASF433:
	.string	"SDL_SYSWMEVENT"
.LASF385:
	.string	"SDL_SCANCODE_AUDIOSTOP"
.LASF326:
	.string	"SDL_SCANCODE_CRSEL"
.LASF243:
	.string	"SDL_SCANCODE_END"
.LASF69:
	.string	"SDL_PIXELTYPE_UNKNOWN"
.LASF282:
	.string	"SDL_SCANCODE_EXECUTE"
.LASF653:
	.string	"putPixel"
.LASF507:
	.string	"clicks"
.LASF268:
	.string	"SDL_SCANCODE_POWER"
.LASF25:
	.string	"_IO_write_end"
.LASF80:
	.string	"SDL_PIXELTYPE_ARRAYF32"
.LASF352:
	.string	"SDL_SCANCODE_KP_DBLAMPERSAND"
.LASF382:
	.string	"SDL_SCANCODE_MODE"
.LASF657:
	.string	"SDL_Quit"
.LASF561:
	.string	"jdevice"
.LASF141:
	.string	"SDL_PIXELFORMAT_BGRX8888"
.LASF611:
	.string	"sdlUpdate"
.LASF224:
	.string	"SDL_SCANCODE_F1"
.LASF131:
	.string	"SDL_PIXELFORMAT_BGRA5551"
.LASF226:
	.string	"SDL_SCANCODE_F3"
.LASF227:
	.string	"SDL_SCANCODE_F4"
.LASF228:
	.string	"SDL_SCANCODE_F5"
.LASF229:
	.string	"SDL_SCANCODE_F6"
.LASF230:
	.string	"SDL_SCANCODE_F7"
.LASF231:
	.string	"SDL_SCANCODE_F8"
.LASF232:
	.string	"SDL_SCANCODE_F9"
.LASF348:
	.string	"SDL_SCANCODE_KP_PERCENT"
.LASF473:
	.string	"SDL_SENSORUPDATE"
.LASF377:
	.string	"SDL_SCANCODE_LGUI"
.LASF123:
	.string	"SDL_PIXELFORMAT_BGR555"
.LASF100:
	.string	"SDL_PACKEDLAYOUT_NONE"
.LASF532:
	.string	"iscapture"
.LASF405:
	.string	"SDL_SCANCODE_KBDILLUMUP"
.LASF87:
	.string	"SDL_PACKEDORDER_ARGB"
.LASF392:
	.string	"SDL_SCANCODE_COMPUTER"
.LASF619:
	.string	"leftX"
.LASF115:
	.string	"SDL_PIXELFORMAT_RGB332"
.LASF167:
	.string	"SDL_BlendMode"
.LASF295:
	.string	"SDL_SCANCODE_VOLUMEDOWN"
.LASF585:
	.string	"SDL_Renderer"
.LASF104:
	.string	"SDL_PACKEDLAYOUT_5551"
.LASF391:
	.string	"SDL_SCANCODE_CALCULATOR"
.LASF588:
	.string	"maxX"
.LASF590:
	.string	"maxY"
.LASF133:
	.string	"SDL_PIXELFORMAT_BGR565"
.LASF557:
	.string	"jaxis"
.LASF480:
	.string	"type"
.LASF534:
	.string	"touchId"
.LASF9:
	.string	"__int16_t"
.LASF11:
	.string	"__uint16_t"
.LASF237:
	.string	"SDL_SCANCODE_SCROLLLOCK"
.LASF501:
	.string	"SDL_MouseMotionEvent"
.LASF203:
	.string	"SDL_SCANCODE_8"
.LASF126:
	.string	"SDL_PIXELFORMAT_ABGR4444"
.LASF450:
	.string	"SDL_CONTROLLERAXISMOTION"
.LASF607:
	.string	"exit"
.LASF253:
	.string	"SDL_SCANCODE_KP_PLUS"
.LASF512:
	.string	"SDL_JoyAxisEvent"
.LASF171:
	.string	"SDL_SCANCODE_B"
.LASF470:
	.string	"SDL_DROPCOMPLETE"
.LASF415:
	.string	"SDL_Keysym"
.LASF540:
	.string	"padding"
.LASF220:
	.string	"SDL_SCANCODE_COMMA"
.LASF542:
	.string	"gestureId"
.LASF32:
	.string	"_chain"
.LASF324:
	.string	"SDL_SCANCODE_OPER"
.LASF143:
	.string	"SDL_PIXELFORMAT_RGBA8888"
.LASF194:
	.string	"SDL_SCANCODE_Y"
.LASF338:
	.string	"SDL_SCANCODE_KP_TAB"
.LASF636:
	.string	"sdlDrawLine"
.LASF88:
	.string	"SDL_PACKEDORDER_RGBA"
.LASF373:
	.string	"SDL_SCANCODE_KP_HEXADECIMAL"
.LASF575:
	.string	"SDL_Event"
.LASF509:
	.string	"direction"
.LASF223:
	.string	"SDL_SCANCODE_CAPSLOCK"
.LASF449:
	.string	"SDL_JOYDEVICEREMOVED"
.LASF572:
	.string	"mgesture"
.LASF4:
	.string	"unsigned char"
.LASF600:
	.string	"SDL_UpdateTexture"
.LASF86:
	.string	"SDL_PACKEDORDER_RGBX"
.LASF291:
	.string	"SDL_SCANCODE_PASTE"
.LASF638:
	.string	"deltaX"
.LASF436:
	.string	"SDL_TEXTEDITING"
.LASF434:
	.string	"SDL_KEYDOWN"
.LASF565:
	.string	"ctouchpad"
.LASF655:
	.string	"_IO_lock_t"
.LASF61:
	.string	"float"
.LASF435:
	.string	"SDL_KEYUP"
.LASF248:
	.string	"SDL_SCANCODE_UP"
.LASF544:
	.string	"SDL_DropEvent"
.LASF568:
	.string	"quit"
.LASF249:
	.string	"SDL_SCANCODE_NUMLOCKCLEAR"
.LASF397:
	.string	"SDL_SCANCODE_AC_STOP"
.LASF356:
	.string	"SDL_SCANCODE_KP_HASH"
.LASF136:
	.string	"SDL_PIXELFORMAT_XRGB8888"
.LASF103:
	.string	"SDL_PACKEDLAYOUT_1555"
.LASF164:
	.string	"SDL_BLENDMODE_MOD"
.LASF457:
	.string	"SDL_CONTROLLERTOUCHPADMOTION"
.LASF73:
	.string	"SDL_PIXELTYPE_PACKED8"
.LASF432:
	.string	"SDL_WINDOWEVENT"
.LASF503:
	.string	"xrel"
.LASF85:
	.string	"SDL_PACKEDORDER_XRGB"
.LASF84:
	.string	"SDL_PACKEDORDER_NONE"
.LASF398:
	.string	"SDL_SCANCODE_AC_REFRESH"
.LASF307:
	.string	"SDL_SCANCODE_LANG1"
.LASF308:
	.string	"SDL_SCANCODE_LANG2"
.LASF309:
	.string	"SDL_SCANCODE_LANG3"
.LASF310:
	.string	"SDL_SCANCODE_LANG4"
.LASF311:
	.string	"SDL_SCANCODE_LANG5"
.LASF312:
	.string	"SDL_SCANCODE_LANG6"
.LASF313:
	.string	"SDL_SCANCODE_LANG7"
.LASF314:
	.string	"SDL_SCANCODE_LANG8"
.LASF315:
	.string	"SDL_SCANCODE_LANG9"
.LASF526:
	.string	"finger"
.LASF94:
	.string	"SDL_ARRAYORDER_RGB"
.LASF535:
	.string	"fingerId"
.LASF153:
	.string	"SDL_PIXELFORMAT_YUY2"
.LASF605:
	.string	"SDL_CreateWindow"
.LASF99:
	.string	"SDL_ARRAYORDER_ABGR"
.LASF429:
	.string	"SDL_APP_DIDENTERFOREGROUND"
.LASF117:
	.string	"SDL_PIXELFORMAT_RGB444"
.LASF323:
	.string	"SDL_SCANCODE_OUT"
.LASF354:
	.string	"SDL_SCANCODE_KP_DBLVERTICALBAR"
.LASF606:
	.string	"atexit"
.LASF24:
	.string	"_IO_write_ptr"
.LASF353:
	.string	"SDL_SCANCODE_KP_VERTICALBAR"
.LASF372:
	.string	"SDL_SCANCODE_KP_DECIMAL"
.LASF209:
	.string	"SDL_SCANCODE_TAB"
.LASF244:
	.string	"SDL_SCANCODE_PAGEDOWN"
.LASF333:
	.string	"SDL_SCANCODE_CURRENCYSUBUNIT"
.LASF426:
	.string	"SDL_APP_WILLENTERBACKGROUND"
.LASF379:
	.string	"SDL_SCANCODE_RSHIFT"
.LASF622:
	.string	"lowerY"
.LASF642:
	.string	"sdlDrawRectFromTo"
.LASF107:
	.string	"SDL_PACKEDLAYOUT_2101010"
.LASF371:
	.string	"SDL_SCANCODE_KP_OCTAL"
.LASF251:
	.string	"SDL_SCANCODE_KP_MULTIPLY"
.LASF325:
	.string	"SDL_SCANCODE_CLEARAGAIN"
.LASF401:
	.string	"SDL_SCANCODE_BRIGHTNESSUP"
.LASF564:
	.string	"cdevice"
.LASF494:
	.string	"repeat"
.LASF265:
	.string	"SDL_SCANCODE_KP_PERIOD"
.LASF576:
	.string	"SDL_MESSAGEBOX_COLOR_BACKGROUND"
.LASF384:
	.string	"SDL_SCANCODE_AUDIOPREV"
.LASF475:
	.string	"SDL_RENDER_DEVICE_RESET"
.LASF252:
	.string	"SDL_SCANCODE_KP_MINUS"
.LASF208:
	.string	"SDL_SCANCODE_BACKSPACE"
.LASF637:
	.string	"exchanged"
.LASF64:
	.string	"Sint16"
.LASF48:
	.string	"FILE"
.LASF472:
	.string	"SDL_AUDIODEVICEREMOVED"
.LASF380:
	.string	"SDL_SCANCODE_RALT"
.LASF519:
	.string	"SDL_JoyButtonEvent"
.LASF477:
	.string	"SDL_USEREVENT"
.LASF7:
	.string	"size_t"
.LASF284:
	.string	"SDL_SCANCODE_MENU"
.LASF112:
	.string	"SDL_PIXELFORMAT_INDEX4LSB"
.LASF58:
	.string	"uint8_t"
.LASF574:
	.string	"drop"
.LASF292:
	.string	"SDL_SCANCODE_FIND"
.LASF614:
	.string	"centerX"
.LASF615:
	.string	"centerY"
.LASF417:
	.string	"unused"
.LASF511:
	.string	"preciseY"
.LASF273:
	.string	"SDL_SCANCODE_F16"
.LASF66:
	.string	"Sint32"
.LASF505:
	.string	"SDL_MouseButtonEvent"
.LASF165:
	.string	"SDL_BLENDMODE_MUL"
.LASF297:
	.string	"SDL_SCANCODE_KP_EQUALSAS400"
.LASF28:
	.string	"_IO_save_base"
.LASF245:
	.string	"SDL_SCANCODE_RIGHT"
.LASF451:
	.string	"SDL_CONTROLLERBUTTONDOWN"
.LASF661:
	.string	"sdlInit"
.LASF453:
	.string	"SDL_CONTROLLERDEVICEADDED"
.LASF370:
	.string	"SDL_SCANCODE_KP_BINARY"
.LASF554:
	.string	"edit"
.LASF394:
	.string	"SDL_SCANCODE_AC_HOME"
.LASF513:
	.string	"axis"
.LASF320:
	.string	"SDL_SCANCODE_PRIOR"
.LASF210:
	.string	"SDL_SCANCODE_SPACE"
.LASF545:
	.string	"file"
.LASF497:
	.string	"text"
.LASF549:
	.string	"code"
.LASF42:
	.string	"_wide_data"
.LASF155:
	.string	"SDL_PIXELFORMAT_YVYU"
.LASF285:
	.string	"SDL_SCANCODE_SELECT"
.LASF387:
	.string	"SDL_SCANCODE_AUDIOMUTE"
.LASF383:
	.string	"SDL_SCANCODE_AUDIONEXT"
.LASF469:
	.string	"SDL_DROPBEGIN"
.LASF368:
	.string	"SDL_SCANCODE_KP_CLEAR"
.LASF582:
	.string	"SDL_TEXTUREACCESS_STATIC"
.LASF361:
	.string	"SDL_SCANCODE_KP_MEMRECALL"
.LASF121:
	.string	"SDL_PIXELFORMAT_RGB555"
.LASF68:
	.string	"Sint64"
.LASF238:
	.string	"SDL_SCANCODE_PAUSE"
.LASF481:
	.string	"timestamp"
.LASF603:
	.string	"SDL_CreateTexture"
.LASF205:
	.string	"SDL_SCANCODE_0"
.LASF196:
	.string	"SDL_SCANCODE_1"
.LASF197:
	.string	"SDL_SCANCODE_2"
.LASF198:
	.string	"SDL_SCANCODE_3"
.LASF199:
	.string	"SDL_SCANCODE_4"
.LASF200:
	.string	"SDL_SCANCODE_5"
.LASF201:
	.string	"SDL_SCANCODE_6"
.LASF202:
	.string	"SDL_SCANCODE_7"
.LASF14:
	.string	"__int64_t"
.LASF204:
	.string	"SDL_SCANCODE_9"
.LASF514:
	.string	"value"
.LASF170:
	.string	"SDL_SCANCODE_A"
.LASF139:
	.string	"SDL_PIXELFORMAT_XBGR8888"
.LASF172:
	.string	"SDL_SCANCODE_C"
.LASF173:
	.string	"SDL_SCANCODE_D"
.LASF174:
	.string	"SDL_SCANCODE_E"
.LASF175:
	.string	"SDL_SCANCODE_F"
.LASF176:
	.string	"SDL_SCANCODE_G"
.LASF177:
	.string	"SDL_SCANCODE_H"
.LASF178:
	.string	"SDL_SCANCODE_I"
.LASF179:
	.string	"SDL_SCANCODE_J"
.LASF180:
	.string	"SDL_SCANCODE_K"
.LASF181:
	.string	"SDL_SCANCODE_L"
.LASF182:
	.string	"SDL_SCANCODE_M"
.LASF183:
	.string	"SDL_SCANCODE_N"
.LASF184:
	.string	"SDL_SCANCODE_O"
.LASF185:
	.string	"SDL_SCANCODE_P"
.LASF186:
	.string	"SDL_SCANCODE_Q"
.LASF187:
	.string	"SDL_SCANCODE_R"
.LASF188:
	.string	"SDL_SCANCODE_S"
.LASF189:
	.string	"SDL_SCANCODE_T"
.LASF190:
	.string	"SDL_SCANCODE_U"
.LASF191:
	.string	"SDL_SCANCODE_V"
.LASF192:
	.string	"SDL_SCANCODE_W"
.LASF193:
	.string	"SDL_SCANCODE_X"
.LASF132:
	.string	"SDL_PIXELFORMAT_RGB565"
.LASF195:
	.string	"SDL_SCANCODE_Z"
.LASF142:
	.string	"SDL_PIXELFORMAT_ARGB8888"
.LASF138:
	.string	"SDL_PIXELFORMAT_RGBX8888"
.LASF393:
	.string	"SDL_SCANCODE_AC_SEARCH"
.LASF156:
	.string	"SDL_PIXELFORMAT_NV12"
.LASF478:
	.string	"SDL_LASTEVENT"
.LASF458:
	.string	"SDL_CONTROLLERTOUCHPADUP"
.LASF651:
	.string	"sdlDrawPoint"
.LASF317:
	.string	"SDL_SCANCODE_SYSREQ"
.LASF414:
	.string	"SDL_Keycode"
.LASF129:
	.string	"SDL_PIXELFORMAT_RGBA5551"
.LASF608:
	.string	"fprintf"
.LASF98:
	.string	"SDL_ARRAYORDER_BGRA"
.LASF335:
	.string	"SDL_SCANCODE_KP_RIGHTPAREN"
.LASF376:
	.string	"SDL_SCANCODE_LALT"
.LASF113:
	.string	"SDL_PIXELFORMAT_INDEX4MSB"
.LASF157:
	.string	"SDL_PIXELFORMAT_NV21"
.LASF464:
	.string	"SDL_DOLLARRECORD"
.LASF616:
	.string	"radX"
.LASF634:
	.string	"sdlQuitOnEvent"
.LASF339:
	.string	"SDL_SCANCODE_KP_BACKSPACE"
.LASF441:
	.string	"SDL_MOUSEBUTTONUP"
.LASF537:
	.string	"dTheta"
.LASF587:
	.string	"minX"
.LASF444:
	.string	"SDL_JOYBALLMOTION"
.LASF620:
	.string	"upperY"
.LASF329:
	.string	"SDL_SCANCODE_KP_000"
.LASF652:
	.string	"sdlSetBlack"
.LASF162:
	.string	"SDL_BLENDMODE_BLEND"
.LASF556:
	.string	"wheel"
.LASF328:
	.string	"SDL_SCANCODE_KP_00"
.LASF548:
	.string	"SDL_UserEvent"
.LASF221:
	.string	"SDL_SCANCODE_PERIOD"
.LASF466:
	.string	"SDL_CLIPBOARDUPDATE"
.LASF646:
	.string	"extX"
.LASF647:
	.string	"extY"
.LASF656:
	.string	"stderr"
.LASF30:
	.string	"_IO_save_end"
.LASF146:
	.string	"SDL_PIXELFORMAT_ARGB2101010"
.LASF558:
	.string	"jball"
.LASF134:
	.string	"SDL_PIXELFORMAT_RGB24"
.LASF566:
	.string	"csensor"
.LASF399:
	.string	"SDL_SCANCODE_AC_BOOKMARKS"
.LASF592:
	.string	"myRenderer"
.LASF330:
	.string	"SDL_SCANCODE_THOUSANDSSEPARATOR"
.LASF406:
	.string	"SDL_SCANCODE_EJECT"
.LASF610:
	.string	"sdlMilliSleep"
.LASF114:
	.string	"SDL_PIXELFORMAT_INDEX8"
.LASF630:
	.string	"lastX"
.LASF631:
	.string	"lastY"
.LASF140:
	.string	"SDL_PIXELFORMAT_BGR888"
.LASF287:
	.string	"SDL_SCANCODE_AGAIN"
.LASF423:
	.string	"SDL_QUIT"
.LASF375:
	.string	"SDL_SCANCODE_LSHIFT"
.LASF456:
	.string	"SDL_CONTROLLERTOUCHPADDOWN"
.LASF290:
	.string	"SDL_SCANCODE_COPY"
.LASF400:
	.string	"SDL_SCANCODE_BRIGHTNESSDOWN"
.LASF502:
	.string	"which"
.LASF516:
	.string	"SDL_JoyBallEvent"
.LASF53:
	.string	"int16_t"
.LASF5:
	.string	"short unsigned int"
.LASF6:
	.string	"signed char"
.LASF597:
	.string	"SDL_Delay"
.LASF465:
	.string	"SDL_MULTIGESTURE"
.LASF498:
	.string	"start"
.LASF583:
	.string	"SDL_TEXTUREACCESS_STREAMING"
.LASF147:
	.string	"SDL_PIXELFORMAT_RGBA32"
.LASF120:
	.string	"SDL_PIXELFORMAT_XRGB1555"
.LASF618:
	.string	"part"
.LASF77:
	.string	"SDL_PIXELTYPE_ARRAYU16"
.LASF269:
	.string	"SDL_SCANCODE_KP_EQUALS"
.LASF476:
	.string	"SDL_POLLSENTINEL"
.LASF254:
	.string	"SDL_SCANCODE_KP_ENTER"
.LASF17:
	.string	"__off64_t"
.LASF109:
	.string	"SDL_PIXELFORMAT_UNKNOWN"
.LASF363:
	.string	"SDL_SCANCODE_KP_MEMADD"
.LASF22:
	.string	"_IO_read_base"
.LASF428:
	.string	"SDL_APP_WILLENTERFOREGROUND"
.LASF40:
	.string	"_offset"
.LASF563:
	.string	"cbutton"
.LASF659:
	.string	"getPixVal"
.LASF135:
	.string	"SDL_PIXELFORMAT_BGR24"
.LASF416:
	.string	"scancode"
.LASF421:
	.string	"SDL_GestureID"
.LASF127:
	.string	"SDL_PIXELFORMAT_BGRA4444"
.LASF493:
	.string	"state"
.LASF27:
	.string	"_IO_buf_end"
.LASF536:
	.string	"SDL_MultiGestureEvent"
.LASF604:
	.string	"SDL_CreateRenderer"
.LASF581:
	.string	"SDL_MESSAGEBOX_COLOR_MAX"
.LASF349:
	.string	"SDL_SCANCODE_KP_LESS"
.LASF467:
	.string	"SDL_DROPFILE"
.LASF419:
	.string	"SDL_TouchID"
.LASF541:
	.string	"SDL_DollarGestureEvent"
.LASF46:
	.string	"_mode"
.LASF508:
	.string	"SDL_MouseWheelEvent"
.LASF23:
	.string	"_IO_write_base"
.LASF430:
	.string	"SDL_LOCALECHANGED"
.LASF580:
	.string	"SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED"
.LASF83:
	.string	"SDL_BITMAPORDER_1234"
.LASF78:
	.string	"SDL_PIXELTYPE_ARRAYU32"
.LASF101:
	.string	"SDL_PACKEDLAYOUT_332"
.LASF492:
	.string	"SDL_KeyboardEvent"
.LASF144:
	.string	"SDL_PIXELFORMAT_ABGR8888"
.LASF573:
	.string	"dgesture"
.LASF213:
	.string	"SDL_SCANCODE_LEFTBRACKET"
.LASF527:
	.string	"pressure"
.LASF613:
	.string	"sdlDrawCircPart"
.LASF15:
	.string	"long int"
.LASF402:
	.string	"SDL_SCANCODE_DISPLAYSWITCH"
.LASF609:
	.string	"SDL_Init"
.LASF49:
	.string	"_IO_marker"
.LASF643:
	.string	"firstX"
.LASF644:
	.string	"firstY"
.LASF660:
	.string	"sdlExit"
.LASF437:
	.string	"SDL_TEXTINPUT"
.LASF442:
	.string	"SDL_MOUSEWHEEL"
.LASF365:
	.string	"SDL_SCANCODE_KP_MEMMULTIPLY"
.LASF495:
	.string	"keysym"
.LASF555:
	.string	"motion"
.LASF60:
	.string	"uint32_t"
.LASF91:
	.string	"SDL_PACKEDORDER_ABGR"
.LASF241:
	.string	"SDL_SCANCODE_PAGEUP"
.LASF50:
	.string	"_IO_codecvt"
.LASF327:
	.string	"SDL_SCANCODE_EXSEL"
.LASF57:
	.string	"long double"
.LASF408:
	.string	"SDL_SCANCODE_APP1"
.LASF409:
	.string	"SDL_SCANCODE_APP2"
.LASF150:
	.string	"SDL_PIXELFORMAT_ABGR32"
.LASF2:
	.string	"long unsigned int"
.LASF455:
	.string	"SDL_CONTROLLERDEVICEREMAPPED"
.LASF215:
	.string	"SDL_SCANCODE_BACKSLASH"
.LASF650:
	.string	"cPtr"
.LASF76:
	.string	"SDL_PIXELTYPE_ARRAYU8"
.LASF463:
	.string	"SDL_DOLLARGESTURE"
.LASF18:
	.string	"char"
.LASF63:
	.string	"Uint8"
.LASF386:
	.string	"SDL_SCANCODE_AUDIOPLAY"
.LASF239:
	.string	"SDL_SCANCODE_INSERT"
.LASF332:
	.string	"SDL_SCANCODE_CURRENCYUNIT"
.LASF102:
	.string	"SDL_PACKEDLAYOUT_4444"
.LASF233:
	.string	"SDL_SCANCODE_F10"
.LASF234:
	.string	"SDL_SCANCODE_F11"
.LASF235:
	.string	"SDL_SCANCODE_F12"
.LASF270:
	.string	"SDL_SCANCODE_F13"
.LASF271:
	.string	"SDL_SCANCODE_F14"
.LASF272:
	.string	"SDL_SCANCODE_F15"
.LASF26:
	.string	"_IO_buf_base"
.LASF274:
	.string	"SDL_SCANCODE_F17"
.LASF275:
	.string	"SDL_SCANCODE_F18"
.LASF276:
	.string	"SDL_SCANCODE_F19"
.LASF439:
	.string	"SDL_MOUSEMOTION"
.LASF649:
	.string	"color"
.LASF517:
	.string	"ball"
.LASF168:
	.string	"SDL_Window"
.LASF211:
	.string	"SDL_SCANCODE_MINUS"
.LASF21:
	.string	"_IO_read_end"
.LASF418:
	.string	"SDL_JoystickID"
.LASF277:
	.string	"SDL_SCANCODE_F20"
.LASF278:
	.string	"SDL_SCANCODE_F21"
.LASF279:
	.string	"SDL_SCANCODE_F22"
.LASF280:
	.string	"SDL_SCANCODE_F23"
.LASF281:
	.string	"SDL_SCANCODE_F24"
.LASF159:
	.string	"_IO_FILE"
.LASF51:
	.string	"_IO_wide_data"
.LASF286:
	.string	"SDL_SCANCODE_STOP"
.LASF242:
	.string	"SDL_SCANCODE_DELETE"
.LASF122:
	.string	"SDL_PIXELFORMAT_XBGR1555"
.LASF369:
	.string	"SDL_SCANCODE_KP_CLEARENTRY"
.LASF577:
	.string	"SDL_MESSAGEBOX_COLOR_TEXT"
.LASF617:
	.string	"radY"
.LASF632:
	.string	"oldX"
.LASF154:
	.string	"SDL_PIXELFORMAT_UYVY"
.LASF128:
	.string	"SDL_PIXELFORMAT_ARGB1555"
.LASF212:
	.string	"SDL_SCANCODE_EQUALS"
.LASF264:
	.string	"SDL_SCANCODE_KP_0"
.LASF255:
	.string	"SDL_SCANCODE_KP_1"
.LASF256:
	.string	"SDL_SCANCODE_KP_2"
.LASF257:
	.string	"SDL_SCANCODE_KP_3"
.LASF258:
	.string	"SDL_SCANCODE_KP_4"
.LASF259:
	.string	"SDL_SCANCODE_KP_5"
.LASF260:
	.string	"SDL_SCANCODE_KP_6"
.LASF261:
	.string	"SDL_SCANCODE_KP_7"
.LASF262:
	.string	"SDL_SCANCODE_KP_8"
.LASF263:
	.string	"SDL_SCANCODE_KP_9"
.LASF654:
	.string	"GNU C17 11.3.0 -mtune=generic -march=x86-64 -g -pedantic-errors -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF521:
	.string	"SDL_ControllerAxisEvent"
.LASF340:
	.string	"SDL_SCANCODE_KP_A"
.LASF341:
	.string	"SDL_SCANCODE_KP_B"
.LASF342:
	.string	"SDL_SCANCODE_KP_C"
.LASF343:
	.string	"SDL_SCANCODE_KP_D"
.LASF344:
	.string	"SDL_SCANCODE_KP_E"
.LASF345:
	.string	"SDL_SCANCODE_KP_F"
.LASF207:
	.string	"SDL_SCANCODE_ESCAPE"
.LASF594:
	.string	"myPixArray"
.LASF266:
	.string	"SDL_SCANCODE_NONUSBACKSLASH"
.LASF222:
	.string	"SDL_SCANCODE_SLASH"
.LASF89:
	.string	"SDL_PACKEDORDER_XBGR"
.LASF485:
	.string	"padding1"
.LASF486:
	.string	"padding2"
.LASF487:
	.string	"padding3"
.LASF515:
	.string	"padding4"
.LASF431:
	.string	"SDL_DISPLAYEVENT"
.LASF246:
	.string	"SDL_SCANCODE_LEFT"
.LASF551:
	.string	"SDL_SysWMEvent"
.LASF45:
	.string	"__pad5"
.LASF151:
	.string	"SDL_PIXELFORMAT_YV12"
.LASF65:
	.string	"Uint16"
.LASF158:
	.string	"SDL_PIXELFORMAT_EXTERNAL_OES"
.LASF225:
	.string	"SDL_SCANCODE_F2"
.LASF250:
	.string	"SDL_SCANCODE_KP_DIVIDE"
.LASF579:
	.string	"SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND"
.LASF31:
	.string	"_markers"
.LASF97:
	.string	"SDL_ARRAYORDER_BGR"
.LASF55:
	.string	"int64_t"
.LASF448:
	.string	"SDL_JOYDEVICEADDED"
.LASF504:
	.string	"yrel"
.LASF137:
	.string	"SDL_PIXELFORMAT_RGB888"
.LASF41:
	.string	"_codecvt"
.LASF584:
	.string	"SDL_TEXTUREACCESS_TARGET"
.LASF358:
	.string	"SDL_SCANCODE_KP_AT"
.LASF62:
	.string	"double"
.LASF443:
	.string	"SDL_JOYAXISMOTION"
.LASF316:
	.string	"SDL_SCANCODE_ALTERASE"
.LASF626:
	.string	"chgX"
.LASF627:
	.string	"chgY"
.LASF362:
	.string	"SDL_SCANCODE_KP_MEMCLEAR"
.LASF364:
	.string	"SDL_SCANCODE_KP_MEMSUBTRACT"
.LASF347:
	.string	"SDL_SCANCODE_KP_POWER"
.LASF547:
	.string	"SDL_QuitEvent"
.LASF570:
	.string	"syswm"
.LASF67:
	.string	"Uint32"
.LASF92:
	.string	"SDL_PACKEDORDER_BGRA"
.LASF331:
	.string	"SDL_SCANCODE_DECIMALSEPARATOR"
.LASF404:
	.string	"SDL_SCANCODE_KBDILLUMDOWN"
.LASF539:
	.string	"numFingers"
.LASF12:
	.string	"__int32_t"
.LASF488:
	.string	"data1"
.LASF491:
	.string	"data2"
.LASF13:
	.string	"__uint32_t"
.LASF90:
	.string	"SDL_PACKEDORDER_BGRX"
.LASF596:
	.string	"colormap"
.LASF530:
	.string	"data"
.LASF496:
	.string	"SDL_TextEditingEvent"
.LASF412:
	.string	"SDL_NUM_SCANCODES"
.LASF522:
	.string	"SDL_ControllerButtonEvent"
.LASF355:
	.string	"SDL_SCANCODE_KP_COLON"
.LASF595:
	.string	"colors"
.LASF567:
	.string	"adevice"
.LASF520:
	.string	"SDL_JoyDeviceEvent"
.LASF410:
	.string	"SDL_SCANCODE_AUDIOREWIND"
.LASF589:
	.string	"minY"
.LASF518:
	.string	"SDL_JoyHatEvent"
.LASF420:
	.string	"SDL_FingerID"
.LASF524:
	.string	"SDL_ControllerTouchpadEvent"
.LASF550:
	.string	"SDL_SysWMmsg"
.LASF440:
	.string	"SDL_MOUSEBUTTONDOWN"
.LASF591:
	.string	"myWindow"
.LASF337:
	.string	"SDL_SCANCODE_KP_RIGHTBRACE"
.LASF599:
	.string	"SDL_RenderCopy"
.LASF319:
	.string	"SDL_SCANCODE_CLEAR"
.LASF462:
	.string	"SDL_FINGERMOTION"
.LASF523:
	.string	"SDL_ControllerDeviceEvent"
.LASF635:
	.string	"drawCircLine"
.LASF528:
	.string	"SDL_ControllerSensorEvent"
.LASF621:
	.string	"rightX"
.LASF44:
	.string	"_freeres_buf"
.LASF217:
	.string	"SDL_SCANCODE_SEMICOLON"
.LASF81:
	.string	"SDL_BITMAPORDER_NONE"
.LASF56:
	.string	"long long unsigned int"
.LASF499:
	.string	"length"
.LASF36:
	.string	"_cur_column"
.LASF105:
	.string	"SDL_PACKEDLAYOUT_565"
.LASF96:
	.string	"SDL_ARRAYORDER_ARGB"
.LASF125:
	.string	"SDL_PIXELFORMAT_RGBA4444"
.LASF166:
	.string	"SDL_BLENDMODE_INVALID"
.LASF598:
	.string	"SDL_RenderPresent"
.LASF461:
	.string	"SDL_FINGERUP"
.LASF346:
	.string	"SDL_SCANCODE_KP_XOR"
.LASF639:
	.string	"deltaY"
.LASF543:
	.string	"error"
.LASF628:
	.string	"stopX"
.LASF629:
	.string	"stopY"
.LASF296:
	.string	"SDL_SCANCODE_KP_COMMA"
.LASF546:
	.string	"SDL_SensorEvent"
.LASF29:
	.string	"_IO_backup_base"
.LASF20:
	.string	"_IO_read_ptr"
.LASF645:
	.string	"sdlDrawRect"
.LASF623:
	.string	"pixel"
.LASF43:
	.string	"_freeres_list"
.LASF390:
	.string	"SDL_SCANCODE_MAIL"
.LASF116:
	.string	"SDL_PIXELFORMAT_XRGB4444"
.LASF360:
	.string	"SDL_SCANCODE_KP_MEMSTORE"
.LASF130:
	.string	"SDL_PIXELFORMAT_ABGR1555"
.LASF240:
	.string	"SDL_SCANCODE_HOME"
.LASF445:
	.string	"SDL_JOYHATMOTION"
.LASF454:
	.string	"SDL_CONTROLLERDEVICEREMOVED"
.LASF640:
	.string	"stepY"
.LASF35:
	.string	"_old_offset"
.LASF452:
	.string	"SDL_CONTROLLERBUTTONUP"
.LASF407:
	.string	"SDL_SCANCODE_SLEEP"
.LASF425:
	.string	"SDL_APP_LOWMEMORY"
.LASF351:
	.string	"SDL_SCANCODE_KP_AMPERSAND"
.LASF510:
	.string	"preciseX"
.LASF95:
	.string	"SDL_ARRAYORDER_RGBA"
.LASF378:
	.string	"SDL_SCANCODE_RCTRL"
.LASF52:
	.string	"long long int"
.LASF334:
	.string	"SDL_SCANCODE_KP_LEFTPAREN"
.LASF34:
	.string	"_flags2"
.LASF110:
	.string	"SDL_PIXELFORMAT_INDEX1LSB"
.LASF283:
	.string	"SDL_SCANCODE_HELP"
.LASF216:
	.string	"SDL_SCANCODE_NONUSHASH"
.LASF482:
	.string	"SDL_DisplayEvent"
.LASF500:
	.string	"SDL_TextInputEvent"
.LASF152:
	.string	"SDL_PIXELFORMAT_IYUV"
.LASF490:
	.string	"windowID"
.LASF288:
	.string	"SDL_SCANCODE_UNDO"
.LASF219:
	.string	"SDL_SCANCODE_GRAVE"
.LASF648:
	.string	"sdlDrawCyclicPoint"
.LASF569:
	.string	"user"
.LASF529:
	.string	"sensor"
.LASF366:
	.string	"SDL_SCANCODE_KP_MEMDIVIDE"
.LASF446:
	.string	"SDL_JOYBUTTONDOWN"
.LASF218:
	.string	"SDL_SCANCODE_APOSTROPHE"
.LASF163:
	.string	"SDL_BLENDMODE_ADD"
.LASF571:
	.string	"tfinger"
.LASF525:
	.string	"touchpad"
.LASF489:
	.string	"SDL_WindowEvent"
.LASF298:
	.string	"SDL_SCANCODE_INTERNATIONAL1"
.LASF299:
	.string	"SDL_SCANCODE_INTERNATIONAL2"
.LASF300:
	.string	"SDL_SCANCODE_INTERNATIONAL3"
.LASF301:
	.string	"SDL_SCANCODE_INTERNATIONAL4"
.LASF93:
	.string	"SDL_ARRAYORDER_NONE"
.LASF303:
	.string	"SDL_SCANCODE_INTERNATIONAL6"
.LASF304:
	.string	"SDL_SCANCODE_INTERNATIONAL7"
.LASF305:
	.string	"SDL_SCANCODE_INTERNATIONAL8"
.LASF306:
	.string	"SDL_SCANCODE_INTERNATIONAL9"
.LASF359:
	.string	"SDL_SCANCODE_KP_EXCLAM"
.LASF602:
	.string	"SDL_SetTextureBlendMode"
.LASF367:
	.string	"SDL_SCANCODE_KP_PLUSMINUS"
.LASF459:
	.string	"SDL_CONTROLLERSENSORUPDATE"
.LASF145:
	.string	"SDL_PIXELFORMAT_BGRA8888"
.LASF633:
	.string	"sdlDrawCirc"
.LASF389:
	.string	"SDL_SCANCODE_WWW"
.LASF3:
	.string	"unsigned int"
.LASF460:
	.string	"SDL_FINGERDOWN"
.LASF424:
	.string	"SDL_APP_TERMINATING"
.LASF624:
	.string	"sqrX"
.LASF625:
	.string	"sqrY"
.LASF10:
	.string	"short int"
.LASF395:
	.string	"SDL_SCANCODE_AC_BACK"
.LASF106:
	.string	"SDL_PACKEDLAYOUT_8888"
.LASF37:
	.string	"_vtable_offset"
.LASF321:
	.string	"SDL_SCANCODE_RETURN2"
.LASF149:
	.string	"SDL_PIXELFORMAT_BGRA32"
.LASF506:
	.string	"button"
.LASF160:
	.string	"SDL_Rect"
.LASF293:
	.string	"SDL_SCANCODE_MUTE"
.LASF468:
	.string	"SDL_DROPTEXT"
.LASF403:
	.string	"SDL_SCANCODE_KBDILLUMTOGGLE"
.LASF289:
	.string	"SDL_SCANCODE_CUT"
.LASF531:
	.string	"SDL_AudioDeviceEvent"
.LASF483:
	.string	"display"
.LASF322:
	.string	"SDL_SCANCODE_SEPARATOR"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"./sdlinterf.c"
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
