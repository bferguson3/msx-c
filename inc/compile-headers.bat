sdasz80 -o crt0msx_msxdos.s 
sdasz80 -o putchar.s
sdasz80 -o getchar.s
sdasz80 -o dos.s
sdasz80 -o dos2.s
sdasz80 -o interrupt.s
sdasz80 -o ioport.s
sdasz80 -o keyboard.s
sdasz80 -o vdp.s
sdcc -mz80 -c -o conio.rel conio.c
sdcc -mz80 -c -o heap.rel heap.c
sdcc -mz80 -c -o mem.rel mem.c