@echo off

:MenuChoices
echo 1. Facebook
echo 2. Youtube
echo 3. Messenger
echo 4. Instagram
echo 5. Tetris
echo 6. Power options
choice /c "123456" /m /n


if errorlevel 6 goto Power options
if errorlevel 5 goto Tetris
if errorlevel 4 goto Instagram
if errorlevel 3 goto Messenger
if errorlevel 2 goto Youtube 
if errorlevel 1 got Facebook


:Facebook
start chrome "https://www.facebook.com/"
cls
pause
goto MenuChoices

:Youtube 
start chrome "https://www.youtube.com/"
cls
pause
goto MenuChoices

:Messenger
start chrome "https://www.messenger.com/t/6463913343656623"
cls
pause
goto MenuChoices

:Instagram
start chrome "https://www.messenger.com/t/6463913343656623"
cls
pause
goto MenuChoices

:Tetris
start chrome ""https://tetris.com/play-tetris

:Power options
echo  Power options /n
echo 1. Shutdown
echo 2. Restart
echo 3. MenuChoices

choice /c "123" /m /n

if errorlevel 3 goto MenuChoices
if errorlevel 2 goto Restart
if errorlevel 1 goto Shutdown 


:Shutdown 
shutdown /s /t 1000

:Restart 
Shutdown /r




