if "%ARCH%"=="32" (
set PLATFORM=x86
) else (
set PLATFORM=x64
)

msbuild.exe ^
  /p:Platform=%PLATFORM% ^
  /p:PlatformToolset=v141 ^
  /p:Configuration=console_release_omp ^
  /p:PostBuildEvent="" ^
  visualc\vngspice.sln ^
  || goto :error

make-install-vngspice.bat visualc\Release\ngspice_con.exe 64


msbuild.exe ^
  /p:Platform=%PLATFORM% ^
  /p:PlatformToolset=v141 ^
  /p:Configuration=ReleaseOMP ^
  /p:PostBuildEvent="" ^
  visualc\vngspice.sln ^
  || goto :error

make-install-vngspice.bat visualc\Release\ngspice.exe 64
