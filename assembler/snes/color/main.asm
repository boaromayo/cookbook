;==================================
; SAMPLE SNES ROM TO PLACE COLOR ON-SCREEN
;	11/17/2020 boaromayo
;	* assemble in asar, not ca65 *
;==================================
arch 65816					;define the architecture set of assembler to be used
							;in this case, we're using a 65816 (or 65c816 modified, to be exact) 
							;arch set to code in an SNES ROM
lorom						;set ROM memory mapping type

org $8000					;start of cartridge ROM

incsrc "header.asm"			;load ROM header and initial setup files
incsrc "vector.asm"			
incsrc "init.asm"
	
;Set color palette
	lda #$00				;Set color selection to first entry
	sta $2121				;CGADD - Color select register (0=BG color, usually transparent)
		; gggrrrrr - Low byte for color
	lda #%00000000			;Set first color blue
	sta $2122				;CGDATA - Color data (low byte)
		; -bbbbbgg - High byte for color
	lda #%01111100
	sta $2122				;CGDATA - Color data (high byte)
	
Main:
	bra Main				;loop forever