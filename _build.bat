@echo off
set ISCC="C:\Program Files\Inno Setup 5\iscc.exe"
if not exist %ISCC% (
	set ISCC="C:\Program Files (x86)\Inno Setup 5\iscc.exe"
)
if not exist %ISCC% (
	echo Cannot find ISCC.exe!
)