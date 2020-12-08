;======================================
; SAMPLE ROM TO TEST SPRITES
;	Created 11/9/2020 boaromayo
;	* Assemble in asar, not ca65 *
;======================================
;set assembly registers
arch 65816		;define the architecture set of assembler to be used
lorom			;in this case, we're using a 65816 (or 65c816 modified, to be exact) 
				;arch set to code in an SNES ROM
				;lorom indicates this is a LoROM, not an ExHiROM
					
org $8000		;start of cartridge ROM

incsrc "header.asm"			;load in ROM header, vector interrupts, and initialize ROM
incsrc "vector.asm"			
incsrc "init.asm"

;====================================
; CONSTANTS
;====================================
!CGADD					= $2121
!CGDATA					= $2122

setup_palette:
	pha
		phx
			sta !CGADD
			cpx #$0008
			
			lda color_palette,x
			sta !CGDATA
			lda color_palette,x
			sta !CGDATA
			inc
			inx
			jmp setup_palette
		plx
	pla
	
color_palette:
	dw $001F,$0F00,$FFFF,$0200
	
Main:
	jmp Main	;loop forever