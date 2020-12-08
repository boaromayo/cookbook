;==================================
; HEADER FILE FOR CA65 SAMPLE ROM
;==================================
.p816		;indicating this file is using 65816 code
.i16		;indicating the X and Y index registers are 16-bit
.a8			;indicating accumulator is 8-bit

.org $FFC0		;start of header in ROM (for ExHiROM, header starts at $FFB0)
		
;=================================
; HEADER INFORMATION
;=================================
.segment "DATA"
	.byte "TESTING ASSEMBLER... "	;program title (21 ASCII chars required)
	.addr $20			;ROM mode/speed
	.addr $00			;ROM type
	.addr $01			;ROM size in banks
	.addr $00			;RAM size
	.addr $01			;country video rate (NTSC = 00, PAL = 01)/region ID (00=JPN, 01=NA, 02=EU, ...)
	.addr $00			;developer ID
	.addr $00			;version number
	.byte "cc"			;complement checksum
	.byte "cs"			;checksum

;65816 mode (native mode) vectors
	.addr $0000		;Reserved vector
	.addr $0000		;Reserved vector
	.addr $0000		;COP (coprocessor)
	.addr $0000		;BRK (break) vector
	.addr $0000		;ABT (abort) vector
	.addr NMIHandler	;NMI (non-maskable interrupt) vector
	.addr $0000		;RST (reset)
	.addr $0000		;IRQ (interrupt request)
		
;6502 mode (emulation mode) vectors
	.addr $0000		;Reserved vector
	.addr $0000		;Reserved vector
	.addr $0000		;COP (coprocessor)
	.addr $0000		;BRK (break) vector (unused)
	.addr $0000		;ABT (abort) vector (unused)
	.addr $0000		;NMI (non-maskable interrupt) vector
	.addr ResetHandler	;RST (reset)
	.addr $0000		;IRQ (interrupt request)/BRK (break) vector