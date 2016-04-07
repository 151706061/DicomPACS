
echo off
cls

set nls_lang=AMERICAN_CIS.CL8MSWIN1251
rem старые фалйы
set dayoff=14

set currentdir=C:\scripts\PG_create\DB_Dump
set backupdir=%currentdir%\Backups
md "%backupdir%"

set dir_postgree="C:\Program Files\PostgreSQL\9.3\bin"

rem сервер
rem SET server=localhost
SET server=192.168.1.11
rem порт
SET port=5432
rem =установочная БД =
SET database=webtalonXtula
rem =пользователь для службы=
SET username=asu
rem =текущий пароль  сессии для %username%=
set PGPASSWORD=asu
set logfile=%currentdir%\backup_%database%.log

set /p server="> Server IP (default = %server%):"
set /p port="> Port IP (default = %port%):"
set /p database="> Database name (default = %database%):"
set /p username="> Username (default = %username%):"
set /p PGPASSWORD="> password (default = %PGPASSWORD%):"
set /p backupdir="> Backup folder (default = %backupdir%):"



set VDATE=%date:~-10%
set VDATE=%VDATE:.=_%
set VDATE=%VDATE: =_%
set VDATE=%VDATE:/=_%
set VDATE=%VDATE:\=_%
set VTIME=%time:~0,-3%
set VTIME=%VTIME::=_%
set VTIME=%VTIME: =_%

set VDATETIME=%date:~6%_%date:~3,-5%_%date:~0,-8%__%VTIME%

SET backupfilename=%backupdir%\%VDATETIME%_(%server%_%database%)_backup.dmp
SET backuprolefilename=%backupdir%\%VDATETIME%_(%server%_%database%)_role.sql

echo ========================= %date%  %time%  ============================================================ >> "%logfile%"
echo %date% %time% >> "%logfile%"
echo ------------------------------------------------------------------------------------- >> "%logfile%"
echo ready create dump for: >> "%logfile%"
echo                          server: %server% >> "%logfile%"
echo                          port: %port% >> "%logfile%"
echo                          database: %database% >> "%logfile%"
echo                          username: %username% >> "%logfile%"
echo                          password: %PGPASSWORD% >> "%logfile%"
echo backup file name: %backupfilename% >> "%logfile%"
echo ------------------------------------------------------------------------------------- >> "%logfile%"
rem pause
echo backup file name: %backupfilename% >> "%logfile%"

echo %dir_postgree%pg_dump.exe -h %server% -U %username% -w -p %port% --format custom --blobs --oids --verbose --file "%backupfilename%" %database% >> "%logfile%"
echo start backup... >> "%logfile%"
%dir_postgree%\pg_dump.exe -h %server% -U %username% -w -p %port% --format custom --blobs --oids --verbose --file "%backupfilename%" %database%

echo role's backuprole... >> "%logfile%"
%dir_postgree%\pg_dumpall.exe -h %server% -U %username% -p %port% -r --file "%backuprolefilename%"


echo ===================================================================================== >> "%logfile%"
echo %date% %time%  create dump "%backupfilename%" complete >> "%logfile%"




echo ============================ SUCCESSFULL ================================== >> "%logfile%"
pause
exit