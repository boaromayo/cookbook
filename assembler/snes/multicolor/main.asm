;=========================================
; SAMPLE ROM TO TEST MULTIPLE COLORS
;	11/20/2020 boaromayo
;	* this only assembles in asar, not ca65 *
;=========================================
arch 65816
lorom

org $8000

incsrc "header.asm"
incsrc "init.asm"

;=========================================
; CONSTANTS
;=========================================
!CGADD								= $2121
!CGDATA								= $2122

	ldx #$0000			;Zero x, y, and accumulator to prepare for color palette writing
	ldy #$0000
	lda #$00
	
write_color:
	sta !CGADD					;CGADD - Color select register
	cpx #$0020					;If all color data is completely written
	beq Main					;Go to game loop
	ldy color_palette,x			;Get the color (low byte) and place into palette
	sty !CGDATA
	inx
	ldy color_palette,x			;Get the color (high byte) and place into palette
	sty !CGDATA
	inc							;Increase accumulator by 1
	inx							;Increase x by 1
	iny							;Increase y by 1
	bra write_color				;Keep writing colors to palette if there is some more data

Main:
	jmp Main					;loop forever
	
color_palette:
	db $FF,$FF,$05,$13,$1F,$3C,$45,$09,$0A,$14,$56,$7A,$44,$77,$55,$00,$1A,$55,$12,$1F,$33,$3E,$15,$1C,$4A,$4D,$53,$0F,$6D,$44,$43,$2C