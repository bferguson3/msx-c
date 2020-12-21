;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module mem
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
	.globl _memset
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
;mem.c:7: void memcpy(uint8_t *dest, uint8_t *src, uint16_t n) {
;	---------------------------------
; Function memcpy
; ---------------------------------
_memcpy::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;mem.c:8: while (n > 0) {
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, 6 (ix)
	ld	-2 (ix), a
	ld	a, 7 (ix)
	ld	-1 (ix), a
	ld	e, 8 (ix)
	ld	d, 9 (ix)
00101$:
	ld	a, d
	or	a, e
	jr	Z,00104$
;mem.c:9: *dest = *src;
	pop	hl
	push	hl
	ld	a, (hl)
	ld	(bc), a
;mem.c:10: dest++;
	inc	bc
;mem.c:11: src++;
	inc	-2 (ix)
	jr	NZ,00117$
	inc	-1 (ix)
00117$:
;mem.c:12: n--;
	dec	de
	jr	00101$
00104$:
;mem.c:14: }
	ld	sp, ix
	pop	ix
	ret
;mem.c:17: void memset(uint8_t *s, uint8_t c, uint16_t n) {
;	---------------------------------
; Function memset
; ---------------------------------
_memset::
;mem.c:18: while (n > 0) {
	pop	de
	pop	bc
	push	bc
	push	de
	ld	hl, #5
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
00101$:
	ld	a, d
	or	a, e
	ret	Z
;mem.c:19: *s = c;
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	ld	(bc), a
;mem.c:20: s++;
	inc	bc
;mem.c:21: n--;
	dec	de
;mem.c:23: }
	jr	00101$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
