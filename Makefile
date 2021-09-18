# msx-c makefile
CC=sdcc
CFLAGS=-mz80 --code-loc 0x0107 --data-loc 0 --no-std-crt0
INCS=inc 
PY=python3

default: 
	if [ ! -d 'build' ]; then mkdir build; fi 
	${CC} ${CFLAGS} -I${INCS} ./inc/crt0msx_msxdos.rel ./inc/putchar.rel ./inc/getchar.rel ./inc/dos.rel ./inc/conio.rel ./inc/interrupt.rel ./inc/ioport.rel ./inc/keyboard.rel ./inc/vdp.rel ./inc/heap.rel ./inc/mem.rel src/main.c -obuild/main.ihx
	${PY} hex2bin.py build/main.ihx out/MAIN.COM
	@rm build/*.ihx 
	@rm build/*.lk 
	@rm build/*.lst 
	@rm build/*.map 
	@rm build/*.noi 
	@rm build/*.rel 
	@rm build/*.sym 
	openmsx -diska out

clean:
	rm -rf build 
	rm out/MAIN.COM


