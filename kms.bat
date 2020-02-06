%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

set try_keys=0

:get_version
cls
echo. Please select your Windows Version: 
echo. 1. Windows 10 home 家庭版
echo. 2. Windows 10 pro (professional) 专业版 企业版 教育版
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
	cscript /nologo %SystemRoot%\system32\slmgr.vbs /ipk %%i >> %temp%\kms.log
	findstr "成功地安装了产品密钥" %temp%\kms.log >nul 2>&1 && goto try_key_success
	findstr "Product activated successfully" %temp%\kms.log >nul 2>&1 && goto try_key_success
)
goto fail


:try_key_success
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
echo.  KMS Setup successfully!!
echo. 
echo.  系统激活成功！！感谢您的使用。。
echo.
echo.                         呓喵酱(http://iotcat.me)
echo. 
pause
goto end

:fail
cls
echo.
echo. KMS Setup Failture!! 
echo. Sorry for this.. We will try to improve it..
echo.
echo.  抱歉系统激活失败，我们会继续改进。。
echo.
echo.                         呓喵酱(http://iotcat.me)
echo.
pause


:end
exit