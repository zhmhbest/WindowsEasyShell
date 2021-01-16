Set argv = WScript.Arguments : argc = argv.Count
If argc<>1 Then Wscript.Echo "directory" : Wscript.Quit 0
Set WS = CreateObject("Wscript.Shell")
Set USER = WS.Environment("user")
Set SYSTEM = WS.Environment("system")
PATH = USER("PATH") + ";" + SYSTEM("PATH")

If "\" = Right(argv(0), 1) Then
    FIND = Left(argv(0), Len(argv(0)) - 1)
Else
    FIND = argv(0)
End If
For Each item In Split(PATH, ";")
    If "\" = Right(item, 1) Then
        item = Left(item, Len(item) - 1)
    End If
    If FIND = item Then
        'Wscript.Echo "exist"
        Wscript.Quit 1
    End If
Next

'Wscript.Echo "add"
USER("PATH") = FIND + ";" + USER("PATH")
Wscript.Quit 0