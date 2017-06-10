section .text
	global _start	;must be declared
_start:			;linker's entry pt
	mov edx, len	;length of msg
	mov ecx, msg	;address to write msg to
	mov ebx, 1	;file descriptor (stdout)
	mov eax, 4	;system call number (sys_write)
	int 0x80	;call kernel

	mov eax, 1	;system call number (sys_exit)
	int 0x80	;call kernel again

section .data
msg db 'Hello there!', 0xa ;print string to address 0x80
len equ $ - msg		;length of string
