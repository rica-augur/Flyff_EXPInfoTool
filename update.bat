@echo off
setlocal

set retry=10
set file="EXPInfo.exe"
set folderPath="TEMP"

if exist %file% (
    if exist %folderPath% (
        :retry
        timeout /T 1 /nobreak >nul
        del /Q %file%
        set /a retry-=1
	if %errorlevel% == 0 goto next
        if %retry% gtr 0 goto retry
    ) else (
        echo File not found.
        goto fin
    )
) else (
    echo File not found.
    goto fin
)

:next
xcopy "TEMP\Flyff_EXPInfoTool-main" "." /s /e /d /y

del /Q ".gitattributes"
del /Q ".gitignore"
del /Q TEMP.ZIP

start "" "EXPInfo.exe"
if exist "%folderPath%" (
    rmdir /s /q "%folderPath%"
    echo Folder deleted.
) else (
    echo Folder does not exist.
)

:fin