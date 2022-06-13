SET REG_ROOT=HKLM\SOFTWARE\Classes\Directory\background\shell
REM CMD-Normal
REM SET CMD_NAME=@shell32.dll,-8506
SET CMD_NAME=在此处打开命令窗口(^&C)
reg add "%REG_ROOT%\cmdPrompt" /f /ve /t REG_SZ /d "%CMD_NAME%"
reg add "%REG_ROOT%\cmdPrompt" /f /v "Icon" /t REG_SZ /d "cmd.exe"
reg add "%REG_ROOT%\cmdPrompt\command" /f /ve /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\""

REM CMD-Super
REM SET CMD_NAME=@shell32.dll,-8506
SET CMD_NAME=在此处打开命令窗口(^&C)
reg add "%REG_ROOT%\runas" /f /ve /t REG_SZ /d "%CMD_NAME%"
reg add "%REG_ROOT%\runas" /f /v "Icon" /t REG_SZ /d "cmd.exe"
reg add "%REG_ROOT%\runas\command" /f /ve /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\""
reg add "%REG_ROOT%\runas" /f /v "HasLUAShield" /t REG_SZ /d ""
reg add "%REG_ROOT%\runas" /f /v "Extended" /t REG_SZ /d ""