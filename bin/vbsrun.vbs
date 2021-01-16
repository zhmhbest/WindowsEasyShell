Set argv = WScript.Arguments : argc = argv.Count
If 1 = argc Then
    Call CreateObject("WScript.Shell").Run(Chr(34) + argv(0) + Chr(34), 1, 0)
ElseIf 2 = argc Then
    Call CreateObject("WScript.Shell").Run(Chr(34) + argv(0) + Chr(34), CInt(argv(1)), 1)
ElseIf 3 = argc Then
    Call CreateObject("WScript.Shell").Run(Chr(34) + argv(0) + Chr(34), CInt(argv(1)), argv(2))
Else
    Wscript.Echo "command [style] [wait]" : Wscript.Quit
End If