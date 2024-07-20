@echo off

rem Set folder paths (modify these as needed)
set SOURCE_DRIVE=C:
set ARCHIVE_FOLDER=Z:\Archive
set MAX_FILE_AGE=30  (Archive files older than 30 days)

echo Sorting text files by date...

for /f "tokens=8 delims=:" %%a in ('dir /b /od /a-d "%SOURCE_DRIVE%\*.txt"') do (
  if /b int "%a" gtr %MAX_FILE_AGE% (
    echo Archiving "%SOURCE_DRIVE%\%%a" to "%ARCHIVE_FOLDER%"...
    copy /b "%SOURCE_DRIVE%\%%a" "%ARCHIVE_FOLDER%\%%a" >nul 2>nul
    if errorlevel 1 (
      echo Error: Could not copy "%SOURCE_DRIVE%\%%a"
    )
  )
)

echo Sorting archived files by size...
for /f "tokens=3 delims=:" %%a in ('dir /b /od /s /a-d "%ARCHIVE_FOLDER%\*.txt"') do (
  move "%ARCHIVE_FOLDER%\%%a" "%ARCHIVE_FOLDER%" >nul 2>nul
  if errorlevel 1 (
    echo Error: Could not move "%ARCHIVE_FOLDER%\%%a"
  )
)

echo The following archived files are older than %MAX_FILE_AGE% days:

for /f "tokens=3 delims=:" %%a in ('dir /b /a-d /od "%ARCHIVE_FOLDER%\*.txt"') do (
  echo  %%a
)

echo Do you want to delete these files? (Y/N)
set /p confirm=

if "%confirm%"=="Y" (
  echo Deleting archived files...
  for /f "tokens=3 delims=:" %%a in ('dir /b /a-d /od "%ARCHIVE_FOLDER%\*.txt"') do (
    del /q "%ARCHIVE_FOLDER%\%%a" >nul 2>nul
    if errorlevel 1 (
      echo Error: Could not delete "%ARCHIVE_FOLDER%\%%a"
    )
  )
  echo Done!
) else (
  echo Files not deleted.
)

pause