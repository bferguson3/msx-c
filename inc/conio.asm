;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.4 #12212 (Linux)
;--------------------------------------------------------
	.module conio
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _putdec
	.globl _puthex
	.globl _putchar
	.globl _puts
	.globl _puthex8
	.globl _puthex16
	.globl _putdec8
	.globl _putdec16
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
;conio.c:7: void puts(char *s) {
;	---------------------------------
; Function puts
; ---------------------------------
_puts::
;conio.c:8: while (*s != 0) {
	ld	iy, #2
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
00101$:
	ld	a, (bc)
	or	a, a
	ret	Z
;conio.c:9: putchar(*s);
	push	bc
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	bc
;conio.c:10: s++;
	inc	bc
;conio.c:12: }
	jr	00101$
;conio.c:15: void puthex(int8_t nibbles, uint16_t v) {
;	---------------------------------
; Function puthex
; ---------------------------------
_puthex::
;conio.c:16: int8_t i = nibbles - 1;
	ld	iy, #2
	add	iy, sp
	ld	c, 0 (iy)
	dec	c
;conio.c:17: while (i >= 0) {
00104$:
	bit	7, c
	ret	NZ
;conio.c:18: uint16_t aux = (v >> (i << 2)) & 0x000F;
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	iy, #3
	add	iy, sp
	ld	b, 0 (iy)
	ld	e, 1 (iy)
	inc	l
	jr	00126$
00125$:
	srl	e
	rr	b
00126$:
	dec	l
	jr	NZ, 00125$
	ld	a, b
;conio.c:19: uint8_t n = aux & 0x000F;
	and	a, #0xf
	ld	e, a
;conio.c:21: putchar('A' + (n - 10));
	ld	b, e
;conio.c:20: if (n > 9)
	ld	a, #0x09
	sub	a, e
	jr	NC, 00102$
;conio.c:21: putchar('A' + (n - 10));
	ld	a, b
	add	a, #0x37
	push	bc
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	bc
	jr	00103$
00102$:
;conio.c:23: putchar('0' + n);
	ld	a, b
	add	a, #0x30
	push	bc
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	bc
00103$:
;conio.c:24: i--;
	dec	c
;conio.c:26: }
	jr	00104$
;conio.c:29: void puthex8(uint8_t v) {
;	---------------------------------
; Function puthex8
; ---------------------------------
_puthex8::
;conio.c:30: puthex(2, (uint16_t) v);
	ld	hl, #2
	add	hl, sp
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	a, #0x02
	push	af
	inc	sp
	call	_puthex
	pop	af
	inc	sp
;conio.c:31: }
	ret
;conio.c:34: void puthex16(uint16_t v) {
;	---------------------------------
; Function puthex16
; ---------------------------------
_puthex16::
;conio.c:35: puthex(4, v);
	ld	hl, #2
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	a, #0x04
	push	af
	inc	sp
	call	_puthex
	pop	af
	inc	sp
;conio.c:36: }
	ret
;conio.c:39: void putdec(int16_t digits, uint16_t v) {
;	---------------------------------
; Function putdec
; ---------------------------------
_putdec::
;conio.c:40: while (digits > 0) {
00101$:
	xor	a, a
	ld	iy, #2
	add	iy, sp
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	ret	P
;conio.c:41: uint16_t aux = v / digits;
	ld	iy, #2
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	push	bc
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	push	hl
	call	__divuint
	pop	af
	pop	af
;conio.c:42: uint8_t n = aux % 10;
	ld	de, #0x000a
	push	de
	push	hl
	call	__moduint
	pop	af
	pop	af
	ld	a, l
;conio.c:43: putchar('0' + n);
	add	a, #0x30
	push	af
	inc	sp
	call	_putchar
	inc	sp
;conio.c:44: digits /= 10;
	ld	hl, #0x000a
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__divsint
	pop	af
	pop	af
	ex	de, hl
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), e
	ld	1 (iy), d
;conio.c:46: }
	jr	00101$
;conio.c:49: void putdec8(uint8_t v) {
;	---------------------------------
; Function putdec8
; ---------------------------------
_putdec8::
;conio.c:50: putdec(100, (uint16_t) v);
	ld	hl, #2
	add	hl, sp
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #0x0064
	push	hl
	call	_putdec
	pop	af
	pop	af
;conio.c:51: }
	ret
;conio.c:54: void putdec16(uint16_t v) {
;	---------------------------------
; Function putdec16
; ---------------------------------
_putdec16::
;conio.c:55: putdec(10000, v);
	ld	hl, #2
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #0x2710
	push	hl
	call	_putdec
	pop	af
	pop	af
;conio.c:56: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
