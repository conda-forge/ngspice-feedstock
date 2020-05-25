if "%ARCH%"=="32" (
set PLATFORM=x86
) else (
set PLATFORM=x64
)

REM The windows build expects flex-bison to be in a special location
mkdir ..\flex-bison
copy %LIBRARY_BIN%\win_bison.exe ..\flex-bison\
copy %LIBRARY_BIN%\win_flex.exe ..\flex-bison\

msbuild.exe ^
  /p:Platform=%PLATFORM% ^
  /p:PlatformToolset=v141 ^
  /p:WindowsTargetPlatformVersion=10.0.17763.0 ^
  /p:Configuration=ReleaseOMP ^
  /p:PostBuildEvent="" ^
  visualc\sharedspice.sln ^
  || goto :error

make-install-vngspice.bat visualc\Release\ngspice.dll 64
