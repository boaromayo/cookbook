;============================================
; INITIALIZE ROM TO TEST SPRITES
;	11/20/2020 boaromayo
;============================================
arch 65816
lorom

org $8000

;===================================
; CONSTANTS
;===================================
!INIDISP			= $2100
!OBJSEL				= $2101
!OAMADDL			= $2102
!OAMADDH			= $2103
!OAMDATA			= $2104
!BGMODE				= $2105
!BG12NBA			= $210B
!BG1VOFS			= $210E
!CGADD 				= $2121
!CGDATA				= $2122
!TM					= $212C
!NMITIMEN			= $4200
!MDMAEN				= $420B
!HDMAEN				= $420C
!RDNMI = $4210					;RDNMI - VBlank NMI flag and CPU version number

;=========================================
; DMA (Direct Memory Access) CONSTANTS
;=========================================
!DMAP0					= $4300
!DMALOW					= $4302
!DMAHIGH				= $4303
!DMABANK				= $4304
!DMABYTEL				= $4305
!DMABYTEH				= $4306

;========================================
; INTERRUPT REQUEST
;========================================
irq:
	rti							;return from interrupt
	
;========================================
; NON-MASKABLE INTERRUPT VECTOR
;========================================
nmi:
	lda !RDNMI					;check if interrupt on in RDNMI addres
	rti							;return from interrupt
	
;========================================
; RESET VECTOR
;========================================
reset:
	sei							;stop interrupts
	clc							;clear carry
	xce							;switch to native mode by swapping emulation and carry bits (65816 mode)
	rep #$30					;set accumulator and x/y registers to 16-bit
	ldx #$1FFF					;prep stack pointer
	txs							;transfer x value to stack
	jsr Initialize				;initialize
	sep #$20					;set accumulator to 8-bit
	cli							;allow interrupts
	rti							;return from interrupt
	
;===================================
; INITIALIZE ROM
;===================================
Initialize:
	lda #$0000						;set direct page address to $0000
	tcd								;set accumulator to direct page

	ldx #$1FFD						;clear out memory and store in an unimportant DMA address
	stx $4372
	ldx #$1FFF
	stx $4374

	sep #$20						;set accumulator to 8-bit
	rep #$10						;set x/y index registers to 16-bit

	ldx #$0000						;set x register to 0
	
		; x---bbbb - x = Enable forced blank/turn off screen (0=enable, 1=disable), b = brightness
	lda #$80						;turn off screen
	sta !INIDISP					;INIDISP - Initial screen display
	
reset_ppu:
	stz $2101,x						;zero all PPU registers except for initial screen ($2101 + X)
	inx								;increase x by 1
	cpx #$0033
	bne reset_ppu					;loop back to start of function if all PPU registers are not cleared
	ldx #$0000						;reset x to prepare for new function

reset_wram:
	stz $2180,x						;zero all WRAM registers ($2180 + X)
	inx								;increase x by 1
	cpx #$0003
	bne reset_wram					;loop back to start of function if all WRAM registers are not cleared
	ldx #$0000						;reset x to prepare for new function

reset_cpu:
	stz $4200,x						;zero all CPU registers ($4200 + X)
	inx								;increase x by 1
	cpx #$000D
	bcc reset_cpu					;loop back to start of function if all CPU registers are not cleared
	ldx #$0000						;reset x to prepare for new function
	stz !CGADD						;set color palette select to 0

clear_palette:
	stz !CGDATA						;clear entire CGRAM (color palette) for low and high byte
	stz !CGDATA
	inx								;increase x by 1
	cpx #$0100						;loop back to start of function if color palette not cleared
	bcc clear_palette
	ldx #$0000						;reset x to prepare for next function

clear_tilemap:
	phx								;push both accumulator and x register to stack
		pha
			ldx #$1809				;set DMA channel 0 to VRAM data registers ($18 = $2118) for faster access to VRAM
			stx !DMAP0				;DMAP0 - DMA channel set to 0 to addresses $2118/$2119
			
			ldx #$0000				;zero VRAM data to clear tilemap
			stx !DMALOW				;A1T0L - DMA current address (low byte)
			stx !DMAHIGH			;A1T0H - DMA current address (high byte)
			
			stz !DMABANK			;A1TOB - DMA current address (bank)
			
			ldx #$FFFF				;send 64k bytes to VRAM write registers
			stx !DMABYTEL			;DAS0L - DMA byte address (low byte)
			stx !DMABYTEH			;DAS0H - DMA byte address (high byte)
			
			stz !HDMAEN				;HDMAEN - Enable/disable HDMA
			
			lda #$01				;start DMA transfer at channel 0
			sta !MDMAEN				;MDMAEN - Enable DMA to transfer data
		pla
	plx

setup_sprite:
	phx
		pha
			stz !OBJSEL					;OBJSEL - object select (set object select to 0)

			lda #$00					;set object (low and high byte) addresses to zero ($0000)
			sta !OAMADDL				;OAMADDL - OAM address (low byte)
			sta !OAMADDH				;OAMADDH - OAM address (high byte)
	
load_den:
										;load in sprite 1 (there are 9 8x8 sprites in all for this object)
				; xxxxxxxx - x = X position of sprite
			ldx #$0078					;setup x-position of sprite
			stx !OAMDATA				;OAMDATA - write to OAM (object attribute memory) RAM
				; yyyyyyyy - y = Y position of sprite
			ldx #$0068					;setup y-position of sprite
			stx !OAMDATA				;OAMDATA - OAM write register
				; tttttttt - t = tile number (lower bits)
			lda #%00000000				;setup sprite tile number
			sta !OAMDATA				;OAMDATA
				; yxppccct - y = vertical flip, x = horizontal flip, p = priority, c = object's color palette, t = tile number (upper bit)
			lda #%00000000				;do not flip, priority 0, palette 0
			sta !OAMDATA				;OAMDATA

										;load in sprite 2
				; xxxxxxxx - x = X position of sprite
			ldx #$0080					;setup x-position of sprite
			stx !OAMDATA				;OAMDATA - write to OAM (object attribute memory) RAM
				; yyyyyyyy - y = Y position of sprite
			ldx #$0068					;setup y-position of sprite
			stx !OAMDATA				;OAMDATA - OAM write register
				; tttttttt - t = tile number (lower bits)
			lda #%00000001				;setup sprite tile number
			sta !OAMDATA				;OAMDATA
				; yxppccct - y = vertical flip, x = horizontal flip, p = priority, c = object's color palette, t = tile number (upper bit)
			lda #%00000000				;do not flip, priority 0, palette 0
			sta !OAMDATA				;OAMDATA
			
										;load in sprite 3
				; xxxxxxxx - x = X position of sprite
			ldx #$0088					;setup x-position of sprite
			stx !OAMDATA				;OAMDATA - write to OAM (object attribute memory) RAM
				; yyyyyyyy - y = Y position of sprite
			ldx #$0068					;setup y-position of sprite
			stx !OAMDATA				;OAMDATA - OAM write register
				; tttttttt - t = tile number (lower bits)
			lda #%00000010				;setup sprite tile number
			sta !OAMDATA				;OAMDATA
				; yxppccct - y = vertical flip, x = horizontal flip, p = priority, c = object's color palette, t = tile number (upper bit)
			lda #%00000000				;do not flip, priority 0, palette 0
			sta !OAMDATA				;OAMDATA
			
										;load in sprite 4
				; xxxxxxxx - x = X position of sprite
			ldx #$0078					;setup x-position of sprite
			stx !OAMDATA				;OAMDATA - write to OAM (object attribute memory) RAM
				; yyyyyyyy - y = Y position of sprite
			ldx #$0070					;setup y-position of sprite
			stx !OAMDATA				;OAMDATA - OAM write register
				; tttttttt - t = tile number (lower bits)
			lda #%00000011				;setup sprite tile number
			sta !OAMDATA				;OAMDATA
				; yxppccct - y = vertical flip, x = horizontal flip, p = priority, c = object's color palette, t = tile number (upper bit)
			lda #%00000000				;do not flip, priority 0, palette 0
			sta !OAMDATA				;OAMDATA
										
										;load in sprite 5
				; xxxxxxxx - x = X position of sprite
			ldx #$0080					;setup x-position of sprite
			stx !OAMDATA				;OAMDATA - write to OAM (object attribute memory) RAM
				; yyyyyyyy - y = Y position of sprite
			ldx #$0070					;setup y-position of sprite
			stx !OAMDATA				;OAMDATA - OAM write register
				; tttttttt - t = tile number (lower bits)
			lda #%00000100				;setup sprite tile number
			sta !OAMDATA				;OAMDATA
				; yxppccct - y = vertical flip, x = horizontal flip, p = priority, c = object's color palette, t = tile number (upper bit)
			lda #%00000000				;do not flip, priority 0, palette 0
			sta !OAMDATA				;OAMDATA
			
										;load in sprite 6
				; xxxxxxxx - x = X position of sprite
			ldx #$0088					;setup x-position of sprite
			stx !OAMDATA				;OAMDATA - write to OAM (object attribute memory) RAM
				; yyyyyyyy - y = Y position of sprite
			ldx #$0070					;setup y-position of sprite
			stx !OAMDATA				;OAMDATA - OAM write register
				; tttttttt - t = tile number (lower bits)
			lda #%00000101				;setup sprite tile number
			sta !OAMDATA				;OAMDATA
				; yxppccct - y = vertical flip, x = horizontal flip, p = priority, c = object's color palette, t = tile number (upper bit)
			lda #%00000000				;do not flip, priority 0, palette 0
			sta !OAMDATA				;OAMDATA
			
										;load in sprite 7
				; xxxxxxxx - x = X position of sprite
			ldx #$0078					;setup x-position of sprite
			stx !OAMDATA				;OAMDATA - write to OAM (object attribute memory) RAM
				; yyyyyyyy - y = Y position of sprite
			ldx #$0078					;setup y-position of sprite
			stx !OAMDATA				;OAMDATA - OAM write register
				; tttttttt - t = tile number (lower bits)
			lda #%00000110				;setup sprite tile number
			sta !OAMDATA				;OAMDATA
				; yxppccct - y = vertical flip, x = horizontal flip, p = priority, c = object's color palette, t = tile number (upper bit)
			lda #%00000000				;do not flip, priority 0, palette 0
			sta !OAMDATA				;OAMDATA
			
										;load in sprite 8
				; xxxxxxxx - x = X position of sprite
			ldx #$0080					;setup x-position of sprite
			stx !OAMDATA				;OAMDATA - write to OAM (object attribute memory) RAM
				; yyyyyyyy - y = Y position of sprite
			ldx #$0078					;setup y-position of sprite
			stx !OAMDATA				;OAMDATA - OAM write register
				; tttttttt - t = tile number (lower bits)
			lda #%00000111				;setup sprite tile number
			sta !OAMDATA				;OAMDATA
				; yxppccct - y = vertical flip, x = horizontal flip, p = priority, c = object's color palette, t = tile number (upper bit)
			lda #%00000000				;do not flip, priority 0, palette 0
			sta !OAMDATA				;OAMDATA
			
										;load in sprite 9
				; xxxxxxxx - x = X position of sprite
			ldx #$0088					;setup x-position of sprite
			stx !OAMDATA				;OAMDATA - write to OAM (object attribute memory) RAM
				; yyyyyyyy - y = Y position of sprite
			ldx #$0078					;setup y-position of sprite
			stx !OAMDATA				;OAMDATA - OAM write register
				; tttttttt - t = tile number (lower bits)
			lda #%00001000				;setup sprite tile number
			sta !OAMDATA				;OAMDATA
				; yxppccct - y = vertical flip, x = horizontal flip, p = priority, c = object's color palette, t = tile number (upper bit)
			lda #%00000000				;do not flip, priority 0, palette 0
			sta !OAMDATA				;OAMDATA
	
		pla
	plx

setup:
	lda #$01		;map character areas for BG1 and BG2
	sta !BG12NBA	;BG12NBA - BG1 and BG2 character area location register
	
	lda #-1			;offset BG1 and BG3 vertical scroll by 1 since screen drawing starts at 1
	sta !BG1VOFS	;BG1VOFS - BG1 vertical scroll
	sta !BG1VOFS
		
	lda #$09		;set BGMODE to Mode 1, and make BG3 layer as top BG layer
	sta !BGMODE		;BGMODE - BG Mode register
	
	lda #$14		;turn on BG3, and OBJ layers (BG3 = HUD layer, OBJ = player layer)
	sta !TM			;TM - main screen designation register
	
	lda #$0F		;set screen brightness to max, turn on screen
	sta !INIDISP	;INIDISP - initial screen display register
	
	lda #$81		;turn on NMI and enable input
	sta !NMITIMEN	;NMITIMEN - interrupt enable/joypad request
	
	ldx $4372
	stx $1FFD
	ldx $4374
	stx $1FFF
	
	rts				;Return