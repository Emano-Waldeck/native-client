@echo off

SET PATH=C:\Windows\System32;%PATH%

pushd "%~dp0"
CD app

IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
  ..\node\x64\node.exe install.js "%LocalAPPData%"
) ELSE (
  ..\node\x86\node.exe install.js "%LocalAPPData%"
)

PAUSE
