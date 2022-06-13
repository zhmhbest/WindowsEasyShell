@REM 获取当前目录及其子目录所有文件的所有权限
@PUSHD "%1"
@ECHO User:[%UserName%]
@ECHO Work:[%CD%]
@ECHO Drive:[%~d1]
@PAUSE

@IF "%~d1\" == "%CD%" (
    @FOR /F "usebackq delims=" %%f IN (`DIR /a:-h-s /b "%CD%"`) DO @(
        @ECHO [%%f]
        @REM 当前用户为所有者
        @ICACLS "%%f" /SetOwner %UserName% /T /C /L /Q >NUL && @ECHO Owner: √
        @REM 使用继承的ACL（/Gant可删除此设置）
        @ICACLS "%%f" /Reset /T /C /L /Q >NUL && @ECHO Reset: √
    )
) ELSE (
    @REM 当前用户为所有者
    @ICACLS "%CD%" /SetOwner %UserName% /T /C /L /Q >NUL && @ECHO Owner: √
    @REM 使用继承的ACL（/Gant可删除此设置）
    @ICACLS "%CD%" /Reset /T /C /L /Q >NUL && @ECHO Reset: √
)

@ECHO Done!
@POPD
@PAUSE
@EXIT

@REM ICACLS <filename> [options]
@REM     /T     递归子目录中
@REM     /C     错误继续
@REM     /L     操作符号本身
@REM     /Q     不显示成功消息
@REM @ICACLS "%CD%" /Remove Administrators /T /C /Q
@REM @ICACLS "%CD%" /SetOwner Administrators /T /C /Q
@REM @ICACLS "%CD%" /Reset /T /C /Q
@REM @ICACLS "%CD%" /Grant Administrators:(F)

@REM TAKEOWN 管理员获得目录下所有文件的所有权
@REM     /F <filename>   指定文件名或目录名模式
@REM     /A              将所有权给于管理员组
@REM     /R              递归（目录和子目录）
@REM     /D Y            没有列出权限时自动获取
@REM @TAKEOWN /F "%CD%" /A /R /D Y

@REM CACLS 修改文件的访问控制列表(ACL)
@REM     /T              更改当前目录及其所有子目录中
@REM     /G User:Perm    赋予指定用户访问权限。(Perm = R 读取 | W 写入 | C 写入 | F 完全控制)
@REM @ECHO Y|CACLS "%CD%" /T /G %UserName%:F
