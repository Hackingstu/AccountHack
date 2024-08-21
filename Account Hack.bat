@echo off
color 30
chcp 65001 >nul
title Estudiando Mates

:menu

echo *************
echo Menu
echo *************
echo.
echo.
echo 1) List Users On Computer
echo 2) Create a New User
echo 3) Change a Users Password
echo 4) Delete User
echo 5) Exit Menu
echo.
set /p input="© "

if %input% EQU  1 (
	cls
	net user
	pause
	cls
	goto menu
)
if %input% EQU  2 (
	call :checkadmin
	cls
	set /p user="USERNAME: "
	set /p password="PASSWORD: "
	net user %user% %password% /add
	echo New user created as:
	echo %user% %password%
	pause
	cls
	goto menu
)
if %input% EQU  3 (
	call :checkadmin
	cls
	set /p user="TARGET USER: "
	set /p password="NEW PASSWORD: "
	net user %user% %password%
	pause
	cls
	goto menu
)

if %input% EQU  4 (
	call :checkadmin
	cls
	set /p user="TARGET USER: "
	net user %user% /delete
	pause
	cls
	goto menu
)


if %input% EQU  5 exit

:checkadmin
net session >nul
if %errorlevel% NEQ 0 (
cls
echo.
echo Restart the script and run it a admin
)