@echo off
Hostname

setlocal enableextensions enabledelayedexpansion


choice.exe /c YN /m "Change computer name?"
call :Label%errorlevel%
endlocal

:Label1
    set /P name="write new computer name: "	
	REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d %name% /f
	goto d
	
:Label2
	goto d

:d
netsh interface ip show config

setlocal enableextensions enabledelayedexpansion


choice.exe /c YN /m "Change settings?"
call :Bruh%errorlevel%
endlocal
:Bruh1
    set /P aname="write adapter name: "	
    netsh interface ip set address "%aname%" dhcp
	goto f
	
:Bruh2
	goto f

:f

sc.exe qc lanmanworkstation

setlocal enableextensions enabledelayedexpansion


choice.exe /c YN /m "Turn on SMB?"
call :Bru%errorlevel%
endlocal

:Bru1
sc.exe config lanmanworkstation depend= bowser/mrxsmb10/mrxsmb20/nsi
sc.exe config mrxsmb10 start= auto
	
:Bru2

setlocal enableextensions enabledelayedexpansion


choice.exe /c YN /m "Configure network drive ?"
call :Brut%errorlevel%
endlocal

:Brut1
set /P cname="write PC name/ip: "	
set /P dname="write directory name: "	

net use X: “\\%cname%\%dname%” /yes

	
:Brut2



setlocal enableextensions enabledelayedexpansion




choice.exe /c YN /m "Restart PC?"
call :Brugh%errorlevel%
endlocal

:Brugh1
shutdown /r /t 0
	
:Brugh2
pause
exit 

