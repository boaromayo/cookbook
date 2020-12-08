;=============================================
; HEADER OF SAMPLE ROM
;=============================================
arch 65816

org $FFC0						;start of header ROM (in ExHiROM versions, header start is at $FFB0) 

;CONSTANTS
;define rom_mode $20
;define rom_type $00
;define rom_size	$00
;define rom_size_in_banks $01
;define country_video_rate $00
;define dev_id $00
;define rom_number $00
;define country_code "cc"
;define checksum	"cs"

;define unused_vector $0000
;define coprocessor $0000
;define prog_break $0000
;define abort $0000
;define nmi $0000
;define reset $0000
;define interrupt_req $0000

;==================================
; HEADER INFORMATION
;==================================
db "THIS IS A SAMPLE ROM "		;Program title (21 ASCII chars)
db $00
db $00
db $01
db $00
db $00
db $00
db $00
db "cc"
db "cs"

;65816 mode vectors
dw $0000
dw $0000
dw $0000
dw $0000
dw $0000
dw $0000
dw $0000
dw $0000

;6502 mode vectors
dw $0000
dw $0000
dw $0000
dw $0000
dw $0000
dw $0000
dw $0000
dw $0000