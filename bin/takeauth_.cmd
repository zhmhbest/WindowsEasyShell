@REM 获取当前目录及其子目录所有文件的所有权限
@PUSHD "%1"
@ECHO User:[%UserName%]
@ECHO Work:[%CD%]
@PAUSE

:: TAKEOWN 管理员获得目录下所有文件的所有权
::     /F <filename>   指定文件名或目录名模式
::     /A              将所有权给于管理员组
::     /R              递归（目录和子目录）
::     /D Y            没有列出权限时自动获取
:: @TAKEOWN /F .\* /A /R /D Y
::
:: ICACLS name [/grant[:r] Sid:perm[...]] [/remove[:g|:d]] Sid[...]] [/T] [/C] [/L] [/Q]
::
:: CACLS 修改文件的访问控制列表(ACL)
::     /T              更改当前目录及其所有子目录中
::     /G User:Perm    赋予指定用户访问权限。(Perm = R 读取 | W 写入 | C 写入 | F 完全控制)
:: @ECHO Y|CACLS .\* /T /G %UserName%:F

::操作当前目录
@CALL :takeFile "%CD%"

::操作子目录
@FOR /F "usebackq delims=" %%f IN (`DIR /s /b "%CD%"`) DO @(
    @CALL :takeFile "%%f"
)

@ECHO Done!
@POPD
@PAUSE
@EXIT

:takeFile
@ECHO [%~1]
@REM 所有权 交由 管理员
@TAKEOWN /F "%~1" /A                    >NUL && ECHO OwnA  : √
@REM 控制列表
@ICACLS "%~1" /Grant Administrators:(F) >NUL && ECHO Admin : √
@ICACLS "%~1" /Grant SYSTEM:(F)         >NUL && ECHO System: √
@ICACLS "%~1" /Grant %UserName%:(F)     >NUL && ECHO User  : √
@REM 所有权 交由 当前用户
@ICACLS "%~1" /SetOwner %UserName%      >NUL && ECHO OwnU  : √
@GOTO :EOF
