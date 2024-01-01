@echo off
echo The following is a base64 string corresponding to a powershell encoded command to convert all LF to CRLF. &echo(
powershell -ExecutionPolicy Bypass -File "%~dpn0.ps1"
echo(
pause