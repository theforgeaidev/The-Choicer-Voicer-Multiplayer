@echo off
setlocal
cd /d "%~dp0runtime"
set "SteamAppId=480"
set "SteamGameId=480"
if not exist "%~dp0logs" mkdir "%~dp0logs"
"%~dp0runtime\ChoicerVoicer.exe" --main-pack "%~dp0runtime\experimental.pck" --rendering-method gl_compatibility --log-file "%~dp0logs\juego.log"
if errorlevel 1 (
  echo El juego se cerro con un error. Revisa logs\juego.log.
  pause
)
