## First of all
This directory is for Windows builds of mpv.  
To use it, rename the directory name to portable_config or make a soft link, and put it into the mpv directory.

## Scripts
see [Official Wiki](https://github.com/mpv-player/mpv/wiki/User-Scripts)

## Shaders
- [Anime4K](https://github.com/bloc97/Anime4K)
- [KrigBilateral.glsl](https://gist.github.com/igv/a015fc885d5c22e6891820ad89555637)
- [SSimDownscaler.glsl](https://gist.github.com/igv/36508af3ffc84410fe39761d6969be10)

## Additional software

#### VapourSynth & Python3
They are the base support for SVP4. Google them, install them, and make sure they will be in the PATH variable.

#### SVP4
Since SVP4 isn't a freeware, the dll files in mpv/svp4/ are just empty files. You should place the right dlls in it.

## Incompatible configs
|file|config|
|:-|-:|
|script-opts/contact\_sheet.conf|thumbs\_dir|
|script-opts/playlist\_view.conf|thumbs\_dir|
|filters/svp\*.py|core.std.LoadPlugin()|
|mpv.conf|screenshot-directory|
|mpv.conf|osd-font|

These configs may not work well. You'd better reconfigure them.
