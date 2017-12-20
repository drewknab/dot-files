@echo off

:: Commands

DOSKEY ls=dir /B
DOSKEY alias=gvim %USERPROFILE%\aliases.bat

:: Movement
DOSKEY ~=cd "%USERPROFILE%"
DOSKEY code=cd "%USERPROFILE%\code\$*"

:: Git Commands
DOSKEY gca=git commit -a -m"$*"
DOSKEY gp=git push
DOSKEY gs=git status
