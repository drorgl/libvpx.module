../gyp/gyp libvpx.gyp -Dtarget_arch=ia32 -Dos_posix=0 -Dmsan=0 -Dclang=0 -Duse_system_yasm=0 -Dbuildtype=debug --depth=. -f msvs -G msvs_version=2013 --generator-output=./build.vs2013/

rem msbuild.exe ......SolutionFile.sln /t:Build/p:Configuration=Release;Platform=Win32