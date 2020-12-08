;========================================
; FILE FOR VECTORS IN SAMPLE ROM TO TEST SPRITES
;	11/20/2020 boaromayo
;========================================
arch 65816						;set arch set of ROM
lorom							;set ROM memory mapping version

org $008000						;start of cartridge ROM

;========================================
; CONSTANTS
;========================================
!RDNMI = $4210					;RDNMI - VBlank NMI flag and CPU version number