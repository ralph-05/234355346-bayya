@echo off
cls

echo Please select a utility:
echo 1. ipconfig (Displays network configuration)
echo 2. tasklist/taskkill (Manage running processes)
echo 3. chkdsk (Checks disk for errors)
echo 4. format (Formats a drive - USE WITH CAUTION)
echo 5. defrag (Defragments a drive)
echo 6. find (Searches for text in files)
echo 7. attrib (Changes file attributes)
echo 8. Exit

set /p choice=

if "%choice%"=="1" (
  ipconfig
  pause
) else if "%choice%"=="2" (
  echo Enter process name (tasklist for options):
  set /p process=
  tasklist /FI "imagename eq %process%"
  echo Do you want to kill this process? (Y/N)
  set /p confirm=
  if /i "%confirm%"=="Y" (
    taskkill /F /IM %process%
    echo Process terminated.
  ) else (
    echo Process not terminated.
  )
  pause
) else if "%choice%"=="3" (
  echo Enter drive letter (e.g., C: ):
  set /p drive=
  chkdsk %drive%: /f
  echo Check completed.
  pause
) else if "%choice%"=="4" (
  echo Formatting a drive erases all data! USE WITH CAUTION!
  echo Enter drive letter (e.g., C: ):
  set /p drive=
  echo Are you sure you want to format %drive% (Y/N)?
  set /p confirm=
  if /i "%confirm%"=="Y" (
    echo WARNING: This operation cannot be undone!
    echo Please ensure you have entered the correct drive letter: %drive%
    echo Format complete.
    pause
    format %drive%: /FS:NTFS /Q
  ) else (
    echo Format aborted.
  )
  pause
) else if "%choice%"=="5" (
  echo Enter drive letter (e.g., C: ):
  set /p drive=
  echo Defragmenting drive %drive%...
  defrag %drive%
  echo Defragmentation complete.
  pause
) else if "%choice%"=="6" (
  echo Enter search term:
  set /p term=
  echo Enter file path or directory (leave blank for current directory):
  set /p path=
  if "%path%"=="" (
    findstr /s /i "%term%".\*
  ) else (
    findstr /s /i "%term%" "%path%\*"
  )
  pause
) else if "%choice%"=="7" (
  echo Enter file path:
  set /p path=
  if not exist "%path%" (
    echo File path not found.
    goto end
  )
  attrib %path%
  echo Enter new attributes (e.g., R - Read-only, A - Archive):
  set /p attribute=
  attrib %path% %attribute%
  pause
) else if "%choice%"=="8" (
  echo Exiting script.
  exit /b 0
) else (
  echo Invalid selection.
  pause
)

:end
