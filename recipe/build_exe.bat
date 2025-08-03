@echo on

echo %cd%
echo %LIBRARY_BIN%

if "%ARCH%"=="32" (
set PLATFORM=x86
) else (
set PLATFORM=x64
)

cd visualc

msbuild.exe ^
  /p:Platform=%PLATFORM% ^
  /p:PlatformToolset=v143 ^
  /p:WindowsTargetPlatformVersion=10.0.17763.0 ^
  /p:Configuration=console_release_omp ^
  /p:PostBuildEvent="" ^
  vngspice.sln ^
  || goto :error

dir .
dir vngspice\console_release_omp.x64

REM Rename to ngspice_con.exe, following ngspice's own Windows zip file conventions.
move vngspice\console_release_omp.x64\ngspice.exe vngspice\console_release_omp.x64\ngspice_con.exe
call make-install-vngspice.bat vngspice\console_release_omp.x64\ngspice_con.exe 64


msbuild.exe ^
  /p:Platform=%PLATFORM% ^
  /p:PlatformToolset=v143 ^
  /p:WindowsTargetPlatformVersion=10.0.17763.0 ^
  /p:Configuration=ReleaseOMP ^
  /p:PostBuildEvent="" ^
  vngspice.sln ^
  || goto :error

dir .
dir vngspice\ReleaseOMP.x64

make-install-vngspice.bat vngspice\ReleaseOMP.x64\ngspice.exe 64
