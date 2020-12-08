;=============================================
; HEADER FILE FOR SAMPLE ROM TO TEST MULTIPLE COLORS
;	11/20/2020 boaromayo
;	* this file compiles in asar only *
;=============================================
arch 65816
lorom

org $FFC0

;======================================
; CONSTANTS
;======================================
!TITLE					= "MULTICOLOR SAMPLE     "
!ROMSPEED				= $20
!ROMTYPE				= $00
!ROMSIZE				= $0A
!RAMSIZE				= $00
!REGION					= $01
!DEVID					= $00
!VERSION				= $00
!CC						= "{cc}"
!CHECKSUM				= "{cs}"

;=====================================
; START OF ROM HEADER
;=====================================
db "!TITLE"							;ROM title (21 ASCII chars)
db !ROMSPEED						;ROM mode/speed
db !ROMTYPE							;ROM type
db !ROMSIZE							;ROM size
db !RAMSIZE							;RAM size
db !REGION							;Video rate/region ID
db !DEVID							;Developer ID
db !VERSION							;Version number
db "!CC"							;Complement checksum
db "!CHECKSUM"						;Checksum

;====================================
; INTERRUPT VECTORS
;	Without these, the game will not run!!!
;====================================
;65816 mode (native) interrupt vectors
dw $0000							;Reserved
dw $0000							;Reserved
dw $0000							;COProcessor
dw $0000							;BRK (break) vector
dw $0000							;Abort vector
dw nmi								;VBlank header interrupt vector
dw reset							;Reset vector
dw $0000							;Interrupt request vector

;6502 mode (emulation) interrupt vectors
dw $0000							;Reserved
dw $0000							;Reserved
dw $0000							;COProcessor
dw $0000							;BRK (break) vector (unused)
dw $0000							;Abort vector (unused)
dw $0000							;VBlank header interrupt vector
dw reset							;Reset vector (game starts here)
dw $0000							;Interrupt request vector/BRK (break) vector
