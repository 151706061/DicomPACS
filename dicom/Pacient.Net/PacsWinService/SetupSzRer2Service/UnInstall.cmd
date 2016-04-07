echo off
cls

set VDATE=%date:~-10%
set VDATE=%VDATE:.=_%
set VDATE=%VDATE: =_%
set VTIME=%time:~0,-3%
set VTIME=%VTIME::=_%
set VTIME=%VTIME: =_%

set VDATETIME=%date:~6%_%date:~3,-5%_%date:~0,-8%__%VTIME%
set local=%cd%
SET backupfilename1=%local%\Logs_%VDATETIME%.rar
SET backupfilename2=%local%\Config_%VDATETIME%.rar

echo stop service FederalScheduleService...
net stop FederalScheduleService

echo wait 5 sec...
ping -n 5 127.0.0.1 > NUL
echo save configuration files...
start winrar a -ep1 -m5 -r -IBCK -df "%backupfilename1%" "%local%\Logs\*.*"
start winrar a -ep1 -m5 -r -IBCK -df "%backupfilename2%" "%local%\*.config"

echo uninstall...
MsiExec.exe /X{BEF94343-F046-4EFA-8C97-5C5FB58F17BF}
echo done
ping -n 3 127.0.0.1 > NUL