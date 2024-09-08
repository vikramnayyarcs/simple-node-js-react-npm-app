@echo off
setlocal EnableDelayedExpansion

echo "The following npm command builds your Node.js/React application for"
echo "production in the local build directory, optimizing the build for the"
echo "best performance."

REM Run npm build
npm run build

if %ERRORLEVEL% neq 0 (
    echo "npm run build failed."
    exit /b 1
)

echo "The following npm command runs your Node.js/React application in"
echo "development mode and makes the application available for web browsing."

REM Run npm start in the background
start /B npm start

REM Wait for a moment to allow the process to start
timeout /t 5 >nul

REM Get the PID of the last started process and write it to .pidfile
for /f "tokens=2" %%a in ('tasklist /fi "imagename eq node.exe"') do (
    echo %%a > .pidfile
)

if exist .pidfile (
    echo "Node.js process PID saved to .pidfile."
) else (
    echo "Failed to save PID."
)

echo "Now..."
echo "Visit http://localhost:3000 to see your Node.js/React application in action."

endlocal
