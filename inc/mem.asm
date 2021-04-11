;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.4 #12212 (Linux)
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
;mem.c:8: while (n > 0) {
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	push	iy
	ex	(sp), hl
	ld	l, 6 (ix)
	ex	(sp), hl
	ex	(sp), hl
	ld	h, 7 (ix)
	ex	(sp), hl
	pop	iy
	ld	e, 8 (ix)
	ld	d, 9 (ix)
00101$:
	ld	a, d
	or	a, e
	jr	Z, 00104$
;mem.c:9: *dest = *src;
	ld	a, 0 (iy)
	ld	(bc), a
;mem.c:10: dest++;
	inc	bc
;mem.c:11: src++;
	inc	iy
;mem.c:12: n--;
	dec	de
	jr	00101$
00104$:
;mem.c:14: }
	pop	ix
	ret
;mem.c:17: void memset(uint8_t *s, uint8_t c, uint16_t n) {
;	---------------------------------
; Function memset
; ---------------------------------
_memset::
;mem.c:18: while (n > 0) {
	ld	iy, #2
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	e, 3 (iy)
	ld	d, 4 (iy)
00101$:
	ld	a, d
	or	a, e
	ret	Z
;mem.c:19: *s = c;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
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
