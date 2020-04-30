@echo off
cd /d "%~dp0"
if not exist "%~1\nv_disp.cat" (
echo Wrong path.
goto end
)
Inf2Cat\Inf2Cat.exe /driver:"%~1" /os:10_X64,10_AU_X64,10_RS2_X64,10_RS3_X64,10_RS4_X64
signtool\signtool.exe sign /f "signtool\my.pfx" /p nvidia /t http://timestamp.verisign.com/scripts/timstamp.dll "%~1\nv_disp.cat"
echo Press any key to continue . . .
:end
pause > nul