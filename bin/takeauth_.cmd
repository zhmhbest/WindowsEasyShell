@REM 获取当前目录及其子目录所有文件的所有权限
@CD /d "%1"
@ECHO [%CD%]
@TAKEOWN /F .\* /A /R /D y
@ECHO Y|CACLS .\* /T /G Everyone:F
@ECHO Done!
@PAUSE