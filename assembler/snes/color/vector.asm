;==================================
; VECTORS FOR SAMPLE ROM
;	11/18/2020 boaromayo
;==================================
arch 65816					;define the architecture set of assembler to be used
							;in this case, we're using a 65816 (or 65c816 modified, to be exact) 
							;arch set to code in an SNES ROM
lorom						;set ROM memory mapping type

org $8000					;start of cartridge ROM

;=========================================
; INTERRUPT REQUEST VECTOR/BREAK VECTOR IN EMULATION MODE
;=========================================
irq:
	rti						;Return from interrupt
	
;=========================================
; NON-MASKABLE INTERRUPT VECTOR
;=========================================
nmi:
	rti						;Return from interrupt
	
;=========================================
; RESET VECTOR (ROM STARTS HERE)
;=========================================	
reset:
	sei						;Stop interrupts
	clc						;Clear carry
	xce						;Switch to native mode
	rep #$30				;Set accumulator and x/y registers to 16-bit
	ldx #$1FFF				;Set stack pointer default address
	txs						;Transfer to stack
	jsr Initialize
	sep #$20				;Set accumulator to 8-bit
	rti						;Return from interrupt