@echo off
setlocal

set retry=10
set file=EXPInfo.exe

:retry
timeout /T 1 /nobreak >nul
if exist %file% (
    del %file%
    set /a retry-=1
    if %retry% gtr 0 goto retry
) else (
    echo File not found.
    goto fin
)

echo プログラム終了を検知
echo 新しいモジュールを展開します
xcopy "TEMP\Flyff_EXPInfoTool-main" "." /s /e /d /y

del ".gitattributes"
del ".gitignore"
del TEMP.ZIP

set folderPath="TEMP"

if exist "%folderPath%" (
    rmdir /s /q "%folderPath%"
    echo Folder deleted.
) else (
    echo Folder does not exist.
)


:fin
