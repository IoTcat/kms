%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@echo off
cd /d "%SystemRoot%\system32"
slmgr /skms kms.yimian.xyz
slmgr /ato
slmgr /xpr
