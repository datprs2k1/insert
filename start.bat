@echo off
title Image Text Processor
cls

echo Image Text Processor v1.0.0
echo ==========================
echo.

REM Check if directories exist, if not create them
if not exist "images" (
    echo Creating 'images' folder...
    mkdir "images"
    echo Drop your images here: images/
    echo.
)

if not exist "text" (
    echo Creating 'text' folder...
    mkdir "text"
    echo Drop your Excel files here: text/
    echo.
)

if not exist "result" (
    echo Creating 'result' folder...
    mkdir "result"
    echo Processed files will be saved to: result/
    echo.
)

REM Check if required files exist (including subfolders)
where /r images *.jpg *.jpeg *.png *.gif *.webp >nul 2>&1
if errorlevel 1 (
    echo No images found! Supported formats: .jpg, .jpeg, .png, .gif, .webp
    echo Please add images to the 'images' folder ^(or its subfolders^) and try again.
    echo.
    pause
    exit /b 1
)

where /r text *.xlsx *.xls >nul 2>&1
if errorlevel 1 (
    echo No Excel files found! Supported formats: .xlsx, .xls
    echo Please add Excel files to the 'text' folder ^(or its subfolders^) and try again.
    echo.
    pause
    exit /b 1
)

echo Ready to process images...
echo Press any key to start
pause >nul

cls

REM Run the executable
image-text-processor.exe

echo.
if errorlevel 1 (
    echo [ERROR] Processing failed. Please check the error messages above.
) else (
    echo [SUCCESS] Check the 'result' folder for processed files.
)

echo.
echo Press any key to exit...
pause >nul 