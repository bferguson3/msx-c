@ECHO OFF
mkdir work
copy *.* work
cd work
@ECHO ON
sdcc -mz80 --code-loc 0x0107 --data-loc 0 -I%CD%\..\..\inc --no-std-crt0 %CD%\..\..\inc\crt0_msxdos.rel %CD%\..\..\inc\putchar.rel %CD%\..\..\inc\getchar.rel %CD%\..\..\inc\dos.rel %CD%\..\..\inc\conio.rel %CD%\..\..\inc\interrupt.rel %CD%\..\..\inc\ioport.rel %CD%\..\..\inc\keyboard.rel %CD%\..\..\inc\vdp.rel %CD%\..\..\inc\heap.rel %CD%\..\..\inc\mem.rel hw.c
@ECHO OFF
cd ..
%CD%\..\hex2bin.exe %CD%\work\hw.ihx
move %CD%\work\hw.bin %CD%\..\out\hw.com
rmdir /q/s work 
