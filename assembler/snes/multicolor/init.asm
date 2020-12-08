;==========================================
; INITIALIZATION FILE FOR SAMPLE ROM
;	11/21/2020 boaromayo
;	* this file compiles in asar only *
;==========================================
arch 65816
lorom

org $8000

;=========================================
; CONSTANTS
;=========================================
!INIDISP				= $2100
!BGMODE					= $2105
!CGADD					= $2121
!CGDATA					= $2122
!TM						= $212C
!MDMAEN					= $420B
!RDNMI					= $4210
;=========================================
; DMA (Direct Memory Access) CONSTANTS
;=========================================
!DMAP0					= $4300
!DMALOW					= $4302
!DMAHIGH				= $4303
!DMABYTEL				= $4305
!DMABYTEH				= $4306
	
;=========================================
; INTERRUPT REQUEST
;=========================================
irq:
	rti							;Return from interrupt
	
;=========================================
; NON-MASK INTERRUPT
;=========================================
nmi:
	lda !RDNMI					;Check if NMI (non-mask interrupt) is happening
	rti							;Return from interrupt
	
;=========================================
; RESET VECTOR
;=========================================
reset:
	sei							;Stop interrupts
	clc							;Clear carry
	xce							;Switch to native mode
	rep #$30					;Set accumulator and x/y registers to 16-bit
	ldx #$1FFF					;Set stack pointer
	txs							;Transfer value to stack
	jsl Initialize				;Initialize
	sep #$20					;Set accumulator to 8-bit
	cli							;Resume interrupts
	rti							;Return from interrupt
	
;=========================================
; INITIALIZE ROM
;=========================================
Initialize:
	sep #$20					;Set accumulator to 8-bit
	rep #$10					;Set index registers to 16-bit
	ldx #$0000					;Set x to 0

	lda #$80					;Force VBlank/turn screen off
	sta !INIDISP				;INIDISP - Initial screen display register
	
reset_ppu:
	stz $2101,x				;Zero all PPU registers (except for initial and backup screens)
	inx							;Increase x by 1
	cpx #$0033
	bne reset_ppu				;Loop back to start of function if PPU has not been cleared
	ldx #$0000					;Reset x for next function
	
reset_wram:
	stz $2180,x
	inx
	cpx #$0003
	bne reset_wram
	ldx #$0000
	
reset_cpu:
	stz $4200,x				;Zero all CPU registers
	inx							;Increase x by 1
	cpx #$000D
	bne reset_cpu				;Loop back to start of function if CPU has not been cleared
	ldx #$0000					;Reset x for next function
	stz !CGADD					;Set color select to 0
	
clear_palette:
	stz !CGDATA					;Clear out colors in palette
	stz !CGDATA
	inx							;Increase x by 1
	cpx #$0100
	bne clear_palette			;Loop back if palette has not been cleared
	ldx #$0000					;Reset x for next function
	
clear_tilemap:
	phx
		pha
			ldx #$1809			;Set DMA to VRAM write data register $2118
			stx !DMAP0			;Set DMA channel 0 on to addresses $2118/$2119
			
			ldx #$0000			;Zero VRAM data (for both high and low bytes) to clear tilemap
			stx !DMALOW			;DMA current address (low byte)
			stx !DMAHIGH		;DMA current address (high byte)
			
			ldx #$FFFF			;Place 64K blocks into DMA byte counters
			stx !DMABYTEL		;DMA byte-counter (low byte)
			stx !DMABYTEH		;DMA byte-counter (high byte)
			
			lda #$01			;Start DMA transfer
			sta !MDMAEN			;Turn on DMA channel for transfer
		pla
	plx
	
setup:
	lda #$09					;Set BG mode to Mode 1, and make BG3 layer as top layer
	sta !BGMODE					;BGMODE - BG Mode
	
	lda #$04					;Turn on BG3
	sta !TM						;TM - Main screen designation
	
	lda #$0F					;Turn on screen, brightness max
	sta !INIDISP				;INIDISP - Initial screen display register