;=========================================
; SAMPLE SNES ROM INITIALIZATION
;	11/17/2020 boaromayo
;=========================================
arch 65816
lorom

org $8000					;Start of cartridge ROM
	
;=========================================
; INITIALIZE ROM
;=========================================
Initialize:
	sep #$20				;Set accumulator to 8-bit, similar to .a8
	rep #$10				;Set x/y index registers to 16-bit, similar to .i16
	
	ldx #$0000				;set x register to 0 as a counter to access PPU, WRAM, and CPU addresses
		; x---bbbb - x = turn off screen/enable forced VBlank (1=turn off), bbbb = brightness
	lda #$80				;turn screen off
	sta $2100				;INIDISP - Initial screen display register
	
reset_ppu:
	stz $2101,x				;set all PPU write registers except for main display to 0 ($2100 + X)
	inx						;increase x by 1
	cpx #$0033				;loop back to start of function if all addresses are not reset
	bne reset_ppu
	ldx #$0000				;reset for next function

reset_wram:
	stz $2180,x				;set all WRAM registers to 0 ($2180 + X)
	inx						;increase x by 1
	cpx #$0003				;loop back to start of function if all addresses are not reset
	bne reset_wram
	ldx #$0000				;reset for next function

reset_cpu:
	stz $4200,x				;set all CPU write registers to 0 ($4200 + X)
	inx						;increase x by 1
	cpx #$000D				;loop back to start of function if addresses are not reset
	bne reset_cpu
	ldx #$0000				;reset for next function
	stz $2121				;set CGADD (color select register) to 0 before clearing BG palette

clear_palette:
	stz $2122				;set all color in BG palette to zero
	stz $2122
	inx						;increase x by 1
	cpx #$0100				;check if end of palette has been met
	bcc clear_palette		;loop back if palette has not been cleared
	ldx #$0000				;reset for next function
	
clear_tilemap:				;clear tilemap, otherwise garbage pixels show up in Mesen-S (thanks to https://chibiakumas.com/ for mentioning tilemap clearing)
	pha						;hold accumulator and x values in stack
		phx						
			ldx #$1809				;using DMA (direct memory access) to quickly access VRAM data for faster tileset clearing
			stx $4300				;DMAP0 - DMA params, set DMA port 0 to addresses $2118/$2119 (VMDATA)
			
			ldx #$0000				;zero VRAM data (for both high and low bytes) to clear tileset
			stx $4302				;A1T0L - DMA current address (low byte)
			stx $4303				;A1T0H - DMA current address (high byte)
			
			ldx #$FFFF				;set 64k bytes to DMA counters
			stx $4305				;DAS0L - DMA byte-counter (low byte)
			stx $4306				;DAS0H - DMA byte-counter (high byte)
			
			lda #$01				;start DMA transfer, switch DMA channel 0 on
			sta $420B				;MDMAEN - Enable DMA transfer flag (0=disable, 1=enable)
		plx					;pop x and a values and put back into x and accumulator, don't forget to do this!!!
	pla

setup:
		; xxxxemmm - x = character/tile size (1=set to 16x16 tilesize), e = 1=BG3 is top layer in Mode 1, m = BG mode
	lda #$09				;Set to Mode 1, and put BG3 as top layer
	sta $2105				;BGMODE - BG mode and character size
	
	lda #$04				;enable BG3
	sta $212C				;TM - Main screen designation

		; x---bbbb - x = turn off screen/enable forced VBlank (1=turn off), bbbb = brightness
	lda #$0F				;turn screen on
	sta $2100				;INIDISP - Initial screen display