@REM 获取当前目录及其子目录所有文件的所有权限
@PUSHD "%1"
@ECHO User:[%UserName%]
@ECHO Work:[%CD%]
@PAUSE

:: TAKEOWN 重新分配文件所有权
::     /F <dir>        指定文件名或目录名模式
::     /A              将所有权给于管理员组
::     /R              递归（目录和子目录）
::     /D Y            没有列出权限时自动获取
@TAKEOWN /F .\* /A /R /D Y

:: CACLS 修改文件的访问控制列表(ACL)
::     /T              更改当前目录及其所有子目录中
::     /G User:Perm    赋予指定用户访问权限。(Perm = R 读取 | W 写入 | C 写入 | F 完全控制)
@ECHO Y|CACLS .\* /T /G %UserName%:F

@ECHO Done!
@POPD
@PAUSE