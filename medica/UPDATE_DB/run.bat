rem sqlplus asu/asu@asu set SQLBLANKLINES ON
sqlplus asu/asu@asu @run.sql > log.txt
rem ren run.bat run.bat.bak
rem notepad.exe ReadMe.txt
pause