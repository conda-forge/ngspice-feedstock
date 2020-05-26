@echo on

echo %cd%
echo %LIBRARY_BIN%

if "%ARCH%"=="32" (
set PLATFORM=x86
) else (
set PLATFORM=x64
)

cd visualc

REM The windows build expects flex-bison to be in a special
REM location, relative to the ngspice source
mkdir ..\..\flex-bison
mkdir ..\..\flex-bison\data
mkdir ..\..\flex-bison\custom_build_rules

copy %LIBRARY_PREFIX%\bin\win_bison.exe ..\..\flex-bison\
copy %LIBRARY_PREFIX%\bin\win_flex.exe ..\..\flex-bison\
copy %LIBRARY_PREFIX%\include\FlexLexer.h ..\..\flex-bison\
xcopy %LIBRARY_PREFIX%\share\winflexbison\data\* ..\..\flex-bison\data\ /s /e /f /c /h /r /k /y
xcopy %LIBRARY_PREFIX%\share\winflexbison\custom_build_rules\* ..\..\flex-bison\custom_build_rules\ /s /e /f /c /h /r /k /y

dir ..\..\flex-bison

msbuild.exe ^
  /p:Platform=%PLATFORM% ^
  /p:PlatformToolset=v141 ^
  /p:WindowsTargetPlatformVersion=10.0.17763.0 ^
  /p:Configuration=console_release_omp ^
  /p:PostBuildEvent="" ^
  vngspice.sln ^
  || goto :error

call make-install-vngspice.bat Release\ngspice_con.exe 64


REM msbuild.exe ^
REM   /p:Platform=%PLATFORM% ^
REM   /p:PlatformToolset=v141 ^
REM   /p:WindowsTargetPlatformVersion=10.0.17763.0 ^
REM   /p:Configuration=ReleaseOMP ^
REM   /p:PostBuildEvent="" ^
REM   vngspice.sln ^
REM   || goto :error

REM make-install-vngspice.bat Release\ngspice.exe 64
