# MSX-C boilerplate/hello world for SDCC
Credits to Konamito and Avelino Herrera<br>
http://msx.avelinoherrera.com/index_en.html<br>
## Usage:
Requires SDCC (I use 4.0)<br>
From `src/` folder, run `make.bat`<br>
This will include all C libraries (~1.1kB) for MSX-DOS 1.1<br>
The `out/` folder contains a MSX-DOS 1.1 bootable disk environment.<br>
<br>
If you ever need to remake the header libraries, simply run `compile-headers.bat` from the `inc/` folder.<br>
To use the more advanced MSX-DOS library:<br>
Set `--code-loc` build arg to `0x0178`<br>
Include `crt0msx_msxdos_advanced.rel` instead
