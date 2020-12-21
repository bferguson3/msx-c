;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module heap
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _malloc
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;heap.c:7: void *malloc(uint16_t size) {
;	---------------------------------
; Function malloc
; ---------------------------------
_malloc::
;heap.c:8: uint8_t *ret = heap_top;
	ld	bc, (_heap_top)
;heap.c:9: heap_top += size;
	ld	hl, #2
	add	hl, sp
	push	de
	ld	iy, #_heap_top
	push	iy
	pop	de
	ld	a, (de)
	add	a, (hl)
	ld	(de), a
	inc	de
	ld	a, (de)
	inc	hl
	adc	a, (hl)
	ld	(de), a
	pop	de
;heap.c:10: return (void *) ret;
	ld	l, c
	ld	h, b
;heap.c:11: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
