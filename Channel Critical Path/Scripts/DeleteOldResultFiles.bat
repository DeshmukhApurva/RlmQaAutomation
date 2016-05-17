rem navigage to the directory where the batch file exists
cd /d %~dp0

forfiles -p "..\Results" -s -m *.* -d -2 -c "cmd /c del @path"

