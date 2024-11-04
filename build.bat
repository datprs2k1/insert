@echo off
echo Building Image Text Processor...
echo.

echo Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo Error installing dependencies
    pause
    exit /b %errorlevel%
)

echo.
echo Creating dist directory...
if not exist "dist" mkdir dist

echo Building executable...
call pkg . --compress GZip --out-path dist
if %errorlevel% neq 0 (
    echo Error building executable
    pause
    exit /b %errorlevel%
)

echo.
echo Build completed successfully!
echo The executable can be found in the dist directory.
echo.
pause 