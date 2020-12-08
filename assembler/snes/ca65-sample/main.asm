;======================================
; SAMPLE ROM TO TEST CA65 ASSEMBLER
;======================================
.p816						;indicate this file is 65816 assembly code
.i16						;indicate X and Y index registers are 16-bit
.a8							;indicate accumulator is 8-bit

.include "header.asm"		;load header file

.org $8000					;start of cartridge ROM

.segment "CODE"
.proc ResetHandler
	sei						;stop interrupts
	
	clc						;clear carry bit
	xce						;swap carry and emulation bits, go to native mode (clear carry before doing this)
	
	lda #$81				;set value to
	sta $4200				;enable non-maskable interrupt
	
	jmp Main				;go to main loop
.endproc
	
.proc Main
	wai						;wait for non-maskable interrupt
	bra Main				;loop forever
.endproc
	
.proc NMIHandler
	lda $4210				;get status of NMI
	rti						;get out of interrupt
.endproc
