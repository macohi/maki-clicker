@echo off

@REM Run it like this: ".\dev/zip.bat"

set /P directory="Enter directory (example: debug/hl): "
set /P suffix="Enter file suffix (example: 0.3.0-windows): "

echo Moving to directory: "export/%directory%/bin/"
cd "export/%directory%/bin/"

echo Zipping directory into "MAKIC_%suffix%.zip":
wsl zip -r "MAKIC_%suffix%.zip" *

echo Moving to export...
wsl mv "MAKIC_%suffix%.zip" ../../../../export/