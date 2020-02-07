%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@echo off
cd /d "%SystemRoot%\system32"
echo. Clear old kms service...
slmgr /upk
cls
echo.
echo.  KMS Removed successfully!!
echo.
echo.              IoTcat (http://iotcat.me)
echo. 
pause
