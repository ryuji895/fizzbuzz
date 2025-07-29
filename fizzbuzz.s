section .data
	fizz db "fizz"
	buzz db "buzz"
	lf db 0x0a
section .text
	global _start
_start:
	xor r12d,r12d
	mov r13d,0x3
	mov r14d,0x5
	mov rdi,0x1	;標準出力
mainLoop:
	xor r15d,r15d	;flag
	inc r12d
	mov eax,r12d
	xor edx,edx
	div r13d
	cmp edx,0
	jne notfizz
	mov r15d,1
	mov esi,fizz
	mov edx,0x4
	call put
notfizz:
	mov eax,r12d
	xor edx,edx
	div r14d
	cmp edx,0
	jne notbuzz
	mov r15d,1
	mov esi,buzz
	mov edx,0x4
	call put
notbuzz:
	cmp r15d,0x1
	jne notlf
	mov esi,lf
	mov edx,0x1
	call put
notlf:
	cmp r12d,0xf
	jne mainLoop
	mov eax,0x3c
	syscall
put:
	mov rax,0x1
	syscall
	ret
