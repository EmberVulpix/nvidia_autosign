@echo off
cd /d "%~dp0"
if not exist "%~1\nv_disp.cat" (
echo Wrong path.
goto end
)
Inf2Cat\Inf2Cat.exe /driver:"%~1" /os:7_X64
signtool\signtool.exe sign /f "signtool\my.pfx" /p nvidia /t http://timestamp.verisign.com/scripts/timstamp.dll "%~1\nv_disp.cat"
echo Press any key to continue . . .
:end
pause > nul