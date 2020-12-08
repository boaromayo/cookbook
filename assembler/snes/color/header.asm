;====================================
; INTERNAL HEADER FILE FOR SAMPLE ROM
;====================================
arch 65816						;define architecture set to be used
lorom							;define ROM memory mapping type

org $FFC0						;start of ROM header

;===================================
; ROM HEADER DETAILS
;===================================
;===================================
; FOR EXTENDED ROM ONLY
;-----------------------------------
;dw $0000						;developer ID
;db "COLR"						;game code
;dw $0000						;unused
;db $00							;unused
;db $00							;flash size ROM
;db $00							;expansion RAM size
;db $00							;is this a special version? (0=No, 1=Yes)
;db $00							;coprocessor type (0=DSP, ...)
;==================================

db "COLOR SAMPLE         "		;Program title (21 ASCII chars)
db $20							;ROM memory mode/ROM speed (7-4=speed, 0-3=type)
db $00							;ROM type (7-4=co-processor, 3-0=type)
db $04							;ROM size
db $00							;RAM size (for SRAM size, for example)
db $01							;Video refresh (00=NTSC, 01=PAL)/Region code ($00=Japan, $01=NA, $02=Europe, ...)
db $00							;Developer ID ($33 if extended ROM)
db $00							;ROM version number
db "cc"							;Checksum compliment
db "cs"							;Checksum

;===================================
; INTERRUPT VECTORS
;	Without these, the game will not run!!!
;===================================
;65816 mode (native) interrupt vectors
dw $0000				;reserved vector
dw $0000				;reserved vector
dw $0000				;COProcessor
dw $0000				;BRK vector
dw $0000				;Abort vector
dw nmi					;VBlank (vertical blank) interrupt handler vector
dw reset				;Reset vector
dw $0000				;IRQ (interrupt request) vector

;6502 mode (emulation) interrupt vectors, note the SNES starts in this mode
dw $0000				;Reserved vector
dw $0000				;Reserved vector
dw $0000				;CO-Processor (COP opcode)
dw $0000				;BRK vector (unused)
dw $0000				;Abort vector (unused)
dw nmi					;VBlank interrupt handler
dw reset				;Reset vector
dw $0000				;IRQ/BRK vector