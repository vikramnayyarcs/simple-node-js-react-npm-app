@echo off
setlocal EnableDelayedExpansion

echo The following command terminates the "npm start" process using its PID
echo (written to ".pidfile"), all of which were conducted when "deliver.bat"
echo was executed.

REM Enable delayed expansion for dynamic variable use
setlocal EnableDelayedExpansion

REM Check if the .pidfile exists
if not exist ".pidfile" (
    echo .pidfile not found. No process to kill.
    exit /b 1
)

REM Read the PID from the .pidfile
set "_INTERPOLATION_0="
for /f "delims=" %%a in ('type .pidfile') do (
    set "_INTERPOLATION_0=%%a"
)

REM Check if the PID variable is not empty
if not "!_INTERPOLATION_0!"=="" (
    echo Terminating process with PID !_INTERPOLATION_0!
    taskkill /PID !_INTERPOLATION_0! /F
    if %ERRORLEVEL% neq 0 (
        echo Failed to terminate process with PID !_INTERPOLATION_0!.
        exit /b 1
    )
) else (
    echo PID is empty. No process to terminate.
)

endlocal
