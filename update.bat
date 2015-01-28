::Нужен sqlite3.exe для создания backup
@echo off
set path_prog=..\Filyama\Filyama
echo Copy database
copy %path_prog%\main.db .\
echo Create backup
if exist {sqlite3.exe} (
    sqlite3.exe main.db .schema > backup.sql
) else (
    echo Not find sqlite3.exe
)
echo Cleaning
del main.db
pause