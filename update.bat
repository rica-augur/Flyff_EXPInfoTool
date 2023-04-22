@echo off
setlocal

set test=test.txt
set retry=10
set file="EXPInfo.exe"
set folderPath="TEMP"

echo a > %test%
if exist %file% (
    if exist %folderPath% (
        :retry
        timeout /T 1 /nobreak >nul
        del %file%
        set /a retry-=1
	if %errorlevel% == 0 goto next
        if %retry% gtr 0 goto retry
    ) else (
        echo File not found.
        goto fin
echo a2 >> %test%
    )
) else (
    echo File not found.
    goto fin
echo a3 >> %test%
)

:next
echo next >> %test%
xcopy "TEMP\Flyff_EXPInfoTool-main" "." /s /e /d /y >> %test%

del ".gitattributes"
del ".gitignore"

del TEMP.ZIP
if exist "%folderPath%" (
    rmdir /s /q "%folderPath%"
    echo Folder deleted.
) else (
    echo Folder does not exist.
)

echo fin >> %test%
timeout /T 5 /nobreak >nul
start "EXPInfo.exe"


echo fin2 >> %test%
:fin

echo fin3 >> %test%
