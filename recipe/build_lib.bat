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
  /p:Configuration=ReleaseOMP ^
  /p:PostBuildEvent="" ^
  sharedspice.sln ^
  || goto :error

dir .
dir sharedspice\ReleaseOMP.x64

REM code models and other files are part of ngspice-exe
mkdir %PREFIX%\bin
mkdir %PREFIX%\lib
mkdir %PREFIX%\include
copy sharedspice\ReleaseOMP.x64\ngspice.dll %PREFIX%\bin\ngspice.dll
copy sharedspice\ReleaseOMP.x64\ngspice.pdb %PREFIX%\bin\ngspice.pdb
copy sharedspice\ReleaseOMP.x64\ngspice.lib %PREFIX%\lib\ngspice.lib
copy sharedspice\ReleaseOMP.x64\ngspice.exp %PREFIX%\lib\ngspice.exp
copy ..\src\include\ngspice\sharedspice.h %PREFIX%\include\sharedspice.h
