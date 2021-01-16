On Error Resume Next
Set argv = WScript.Arguments : argc = argv.Count
If 1 = argc Then
    VALUE = CreateObject("Wscript.Shell").RegRead(argv(0))
    If 0 = Err.Number  Then
        WScript.Echo VALUE
        WScript.Echo 0
    Else
        WScript.Echo Err.Description, 16
        WScript.Echo 1
    End If
Else
    WScript.Echo "argv = <path>"
    WScript.Echo 1
End If