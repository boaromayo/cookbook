;=========================================
; SAMPLE SNES ROM
;	Created 11/7/2020 boaromayo
;=========================================
arch 65816			;define the architecture set of assembler to be used
					;in this case, we're using a 65816 (or 65c816 modified, to be exact) 
					;arch set to code in an SNES ROM

	incsrc "header.asm"		;load header file

	org $8000				;start of ROM
	sei						;stop interrupts
	
	clc						;clear carry flag
	xce						;swap carry and emulation flags, go into native mode (65816 mode)
	
	lda #$11				;set base addresses for BG1 and BG2 layers
	sta $210B				;BG1 and BG2 VRAM location register (BG12NBA)
	
	stz $2107				;BG1 tilemap size is default: 32x32 (BG1SC)
	
	lda #$01				;set BGMODE to Mode 1
	sta $2105				;BGMODE - BG mode register
	
	lda #$80				;turn screen off
	sta $2100				;INIDISP - initial screen display register

	lda #$0F				;set brightness up to max, turn screen on
	sta $2100				;INIDISP - initial screen display register
	
	jmp Main				;start main loop
	
Main:
	bra Main				;continue forever