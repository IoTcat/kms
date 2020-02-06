%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

set try_keys=0
goto kms

:get_version
cls
echo. Please select your Windows Version:
echo. 1. Windows 10 home
echo. 2. Windows 10 pro (professional)
echo. 
set /p a=Your select = 
if /i '%a%'=='1' goto version_home
if /i '%a%'=='2' goto version_pro
echo. Unknown Input....
goto get_version



:version_home
set version=home
goto try_keys

:version_pro
set version=pro
goto try_keys


:try_keys
cls
echo. Start to try Keys...
echo. 
for /f   %%i in (keys\%version%.keys)  do (
	echo. Try key %%i
	%SystemRoot%\system32\slmgr /ipk %%i
)
set try_keys=1
goto kms

:kms
cls
echo. Setup new kms service...
%SystemRoot%\system32\slmgr /skms kms.yimian.xyz
%SystemRoot%\system32\slmgr /ato
%SystemRoot%\system32\slmgr /xpr
if /i '%try_keys%'=='1' goto kmsFin


:is_succeed
cls
echo. Is the windows actived successfully?
echo. 1. Yes
echo. 2. No
echo. 
set /p a=Your select = 
if /i '%a%'=='1' goto kmsFin
if /i '%a%'=='2' goto get_version
echo. Unknown Input....
goto is_succeed


:kmsFin
cls
echo.
echo. 
echo. $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo. $                                            $
echo. $            KMS Setup Finished!!            $
echo. $                                  IoTcat    $
echo. $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo. 
echo. 
echo.Thanks for your using ~
echo. 
pause
