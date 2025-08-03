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
  /p:Configuration=ReleaseOMP ^
  /p:PostBuildEvent="" ^
  sharedspice.sln ^
  || goto :error

dir .
dir sharedspice\ReleaseOMP.x64

mkdir %LIBRARY_PREFIX%\bin
mkdir %LIBRARY_PREFIX%\lib
mkdir %LIBRARY_PREFIX%\include
mkdir %LIBRARY_PREFIX%\include\ngspice
mkdir %dst%\share\ngspice\scripts
copy sharedspice\ReleaseOMP.x64\ngspice.dll %LIBRARY_PREFIX%\bin\ngspice.dll
copy sharedspice\ReleaseOMP.x64\ngspice.pdb %LIBRARY_PREFIX%\bin\ngspice.pdb
copy sharedspice\ReleaseOMP.x64\ngspice.lib %LIBRARY_PREFIX%\lib\ngspice.lib
copy sharedspice\ReleaseOMP.x64\ngspice.exp %LIBRARY_PREFIX%\lib\ngspice.exp
copy ..\src\include\ngspice\sharedspice.h %LIBRARY_PREFIX%\include\ngspice\sharedspice.h


REM code models and other files are needed by both ngspice-lib and ngspice-exe,
REM which leaves us in the awkward position of including them in both packages.
REM If a user installs both ngspice-lib and ngspice-exe, then one of those will clobber the files from the other.
REM But since they're the same files anyway, it's no big deal.

REM These lines were copied from the ngspice source code, from visualc/make-install-vngspice.bat
set dst=%LIBRARY_PREFIX%
set cmsrc=.\codemodels\x64\Release

mkdir %dst%\bin
mkdir %dst%\lib\ngspice
mkdir %dst%\share\ngspice\scripts

copy "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\redist\x64\Microsoft.VC140.OPENMP\vcomp140.dll" %dst%\bin\
copy %cmsrc%\analog64.cm %dst%\lib\ngspice\analog.cm
copy %cmsrc%\digital64.cm %dst%\lib\ngspice\digital.cm
copy %cmsrc%\table64.cm %dst%\lib\ngspice\table.cm
copy %cmsrc%\xtraevt64.cm %dst%\lib\ngspice\xtraevt.cm
copy %cmsrc%\xtradev64.cm %dst%\lib\ngspice\xtradev.cm
copy %cmsrc%\spice2poly64.cm %dst%\lib\ngspice\spice2poly.cm
copy .\spinit_all %dst%\share\ngspice\scripts\spinit
copy .\spinitr64 .\spinit
