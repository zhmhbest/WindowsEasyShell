Set argv = WScript.Arguments : argc = argv.Count
If argc<>1 Then Wscript.Echo "addpath <path>" : Wscript.Quit 0

' 获取无分隔符结尾的路径
Function getPurePath(path, sep)
    If sep = Right(path, 1) Then
        getPurePath = Left(path, Len(path) - 1)
    Else
        getPurePath =  path
    End If
End Function

' 待添加路径
NADD = getPurePath(argv(0), "\")
FIND = Lcase(NADD)

' 获取已有环境
Set WS = CreateObject("Wscript.Shell")
Set USR = WS.Environment("user")   : PATH_USR = getPurePath(USR("PATH"), ";")
Set SYS = WS.Environment("system") : PATH_SYS = getPurePath(SYS("PATH"), ";")
PATH_ARR = Split(PATH_USR + ";" + PATH_SYS, ";")

'检查环境是否已存在
For Each item In PATH_ARR
    item = Lcase(getPurePath(item, "\"))
    If FIND = item Then
        Wscript.Echo "exist"
        Wscript.Quit 0
    End If
Next

'添加环境
Wscript.Echo "add"
USR("PATH") = NADD + ";" + PATH_USR
Wscript.Quit 0