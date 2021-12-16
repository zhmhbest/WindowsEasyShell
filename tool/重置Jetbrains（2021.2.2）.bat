@ECHO OFF

@REM 用户数据目录清理
FOR /F "usebackq delims=" %%f in (`DIR /A:D /B "%AppData%\JetBrains\"`) DO (
    IF EXIST "%AppData%\JetBrains\%%f" CALL :ClearDirectory "%AppData%\JetBrains\%%f"
)

@REM 注册表清理
REG DELETE "HKCU\SOFTWARE\JavaSoft\Prefs\jetbrains" /f >NUL 2>NUL

@REM 结束退出
ECHO Done!
PAUSE>NUL
GOTO :EOF

@REM 清理目录
:ClearDirectory
    PUSHD "%~1"
    @REM ================
    ECHO %CD%
    @REM Eval
    RMDIR /S /Q .\eval 2>NUL
    DEL /F .\options\other.xml 2>NUL
    @REM Cache
    RMDIR /S /Q .\tasks 2>NUL
    RMDIR /S /Q .\workspace 2>NUL
    @REM ================
    POPD
