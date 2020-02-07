%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

set /a try_keys=0, try_version=0
set key=XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
set is_chinese=0
set mypath=%temp%\kms

:get_version
cls
echo. Please select your Windows Version: 
echo. 1. Windows 10 home 
echo. 2. Windows 10 pro (professional) 
echo. 3. Remove KMS..  
echo. 4. Show CHINESE Translate
echo. 
set /p a=Your select = 
if /i '%a%'=='1' goto version_home
if /i '%a%'=='2' goto version_pro
if /i '%a%'=='3' goto remove
if /i '%a%'=='4' set /a is_chinese=1 & start notepad %mypath%\trans\select_chinese.txt
echo. Unknown Input....
goto get_version



:version_home
set /a pointer=0
set version=home
set /a try_version+=1
goto try_keys

:version_pro
set /a pointer=0
set version=pro
set /a try_version+=2
goto try_keys


:try_keys
del /S /Q %temp%\kms.*>nul
cls
echo. Start to try Keys...
echo. 
if %pointer% leq 0 (set "myskip=") else (set "myskip=skip=%pointer%")
for /f  "%myskip%" %%i in (%mypath%\keys\%version%.keys)  do (
               call :pointer
               set key=%%i
                echo. Try key !key!
                cscript /nologo %SystemRoot%\system32\slmgr.vbs /ipk !key! >> %temp%\kms.log
                echo !key! >> %temp%\kms.tried_keys
                findstr !key! %temp%\kms.log >nul 2>&1 && goto try_key_success 
)
goto fail


:try_key_success
set try_keys=1
goto kms

:kms
cls
echo.
echo. Using key %key%
echo.
echo. Setup new kms service...
cscript /nologo %SystemRoot%\system32\slmgr.vbs /skms kms.yimian.xyz > %temp%\kms.skms
cscript /nologo %SystemRoot%\system32\slmgr.vbs /ato  > %temp%\kms.ato
findstr "0x" %temp%\kms.ato >nul 2>&1 && goto try_keys
%SystemRoot%\system32\slmgr.vbs /xpr
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
echo %key% > C:\Windows\kms.key
cls
echo.
echo.  KMS Setup successfully!!
echo. 
echo.                IoTcat(http://iotcat.me)
echo. 
if /i '!is_chinese!'=='1' start notepad %mypath%\trans\success_chinese.txt
pause
goto end

:fail
cls
if /i '%try_version%'=='1' goto version_pro
if /i '%try_version%'=='2' goto version_home
echo.
echo. KMS Setup Failture!! 
echo. Sorry for this.. We will try to improve it..
echo.
echo.                         IoTcat(http://iotcat.me)
echo.
if /i '!is_chinese!'=='1' start notepad %mypath%\trans\error_chinese.txt
pause
goto end

:remove
cd /d "%SystemRoot%\system32"
echo. Clear old kms service...
slmgr /upk
cls
echo.
echo.  KMS Removed successfully!!
echo.
echo.              IoTcat (http://iotcat.me)
echo. 
if /i '!is_chinese!'=='1' start notepad %mypath%\trans\remove_chinese.txt
pause


:end
exit


:pointer
set /a pointer=%pointer%+1