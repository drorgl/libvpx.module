# libvpx GYP Module

** Experimental **

forked from https://github.com/openpeer/libvpx.git

supports shared_library, fixed in windows builds, including def and rc files.

```
compiling for win32:
gyp libvpx.gyp -Dtarget_arch=ia32 -Dos_posix=0 -Dmsan=0 -Duse_system_yasm=0 --depth=. -f msvs -G msvs_version=2013 --generator-output=./build.vs2013/

compiling for win64:
gyp libvpx.gyp -Dtarget_arch=x64 -Dos_posix=0 -Dmsan=0 -Duse_system_yasm=0 --depth=. -f msvs -G msvs_version=2013 --generator-output=./build.vs2013/

compiling for linux32:
gyp libvpx.gyp -Dtarget_arch=ia32 -DOS=linux -Dos_posix=1 -Dmsan=0 -Duse_system_yasm=1 --depth=. -f make --generator-output=./build.linux32/

compiling for linux64:
gyp libvpx.gyp -Dtarget_arch=x64 -DOS=linux -Dos_posix=1 -Dmsan=0 -Duse_system_yasm=1 --depth=. -f make --generator-output=./build.linux64/

compiling for android/arm:
gyp libvpx.gyp -Dtarget_arch=arm -DOS=android -Dos_posix=1 -Dmsan=0 -Duse_system_yasm=1 --depth=. -f make --generator-output=./build.android/
```