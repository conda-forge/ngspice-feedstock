if "%ARCH%"=="32" (
set PLATFORM=x86
) else (
set PLATFORM=x64
)

msbuild.exe ^
  /p:Platform=%PLATFORM% ^
  /p:PlatformToolset=v141 ^
  /p:Configuration=ReleaseOMP ^
  /p:PostBuildEvent="" ^
  visualc/sharedspice.sln ^
  || goto :error

make-install-vngspice.bat visualc\Release\ngspice.dll 64
