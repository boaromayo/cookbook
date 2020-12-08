;==================================
; HEADER FILE FOR SAMPLE ROM TO TEST SPRITES
;	11/20/2020 boaromayo
;==================================
arch 65816							;define arch set of ROM to be used
lorom								;set ROM memory map type

org $FFC0							;start of ROM header

;==================================
; CONSTANTS
;	Note these are for asar assembler only, may not work in other assemblers
;==================================
!TITLE 		= "TESTING SPRITES HERE "
!ROMSPEED	= $20
!ROMTYPE 	= $00 
!ROMSIZE	= $0C
!RAMSIZE	= $00
!REGION		= $01
!DEVID		= $00
!VERSION	= $00
!CC			= "cc"
!CHECKSUM	= "cs"

;==================================
; START OF ROM HEADER
;==================================
db "!TITLE"							;ROM title (21 ASCII chars)
db !ROMSPEED						;ROM memory mode/speed (7-4=speed, 3-0=type)
db !ROMTYPE							;ROM type
db !ROMSIZE							;ROM size
db !RAMSIZE							;RAM size (for SRAM size, for example)
db !REGION							;Video refresh (0=NTSC, 1=PAL)/Region code (0=JPN, 1=NA, 2=EU, ...)
db !DEVID							;Developer ID
db !VERSION							;Version number
db "!CC"							;Checksum complement
db "!CHECKSUM"						;Checksum

;=================================
; INTERRUPT VECTORS
;	Without these, the game will not run!!!
;=================================
;65816 mode (native) interrupt vectors
dw $0000							;Reserved vector
dw $0000							;Reserved vector
dw $0000							;COProcessor
dw $0000							;BRK (break) vector
dw $0000							;Abort vector
dw nmi								;VBlank header interrupt vector
dw reset							;Reset vector (unused)
dw irq								;Interrupt request vector

;6502 mode (emulation) interrupt vectors (program starts at reset here)
dw $0000							;Reserved vector
dw $0000							;Reserved vector
dw $0000							;COProcessor
dw $0000							;BRK (break) vector (unused)
dw $0000							;Abort vector (unused)
dw $0000							;VBlank header interrupt vector
dw reset							;Reset vector (where the game will start)
dw $0000							;Interrupt request/BRK (break) vector