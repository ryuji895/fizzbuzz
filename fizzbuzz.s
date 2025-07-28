section .data
	fizz db "fizz"
	buzz db "buzz"
	lf db 0x0a
section .text
	global _start
_start:
	mov r12d,0x1	;r12-r15はsyscallで消えない
	mov r13d,0x3
	mov r14d,0x5
mainLoop:
	mov eax,r12d
	xor edx,edx
	div r13d
	cmp edx,0
	jne notfizz
	mov r15d,0x1
	call put_fizz
notfizz:
	mov eax,r12d
	xor edx,edx
	div r14d
	cmp edx,0
	jne notbuzz
	mov r15d,0x1
	call put_buzz
notbuzz:
	cmp r15d,0x1
	jne notLf
	xor r15d,r15d
	call put_lf
notLf:
	inc r12d
	cmp r12d,0x10
	jne mainLoop
	mov eax,0x3c
	syscall
put_lf:
	mov eax,0x1
	mov edi,0x1
	mov esi,lf
	mov edx,0x1
	syscall
	ret
put_fizz:
	mov eax,0x1
	mov edi,0x1
	mov esi,fizz
	mov edx,0x4
	syscall
	ret

put_buzz:
	mov eax,0x1
	mov edi,0x1
	mov esi,buzz
	mov edx,0x4
	syscall
	ret
