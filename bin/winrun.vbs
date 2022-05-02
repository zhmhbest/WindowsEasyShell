Set argv = WScript.Arguments : argc = argv.Count
If 1 = argc Then
    Call CreateObject("WScript.Shell").Run(Chr(34) + argv(0) + Chr(34), 1, 0)
ElseIf 2 = argc Then
    Call CreateObject("WScript.Shell").Run(Chr(34) + argv(0) + Chr(34), CInt(argv(1)), True)
ElseIf 3 = argc Then
    Call CreateObject("WScript.Shell").Run(Chr(34) + argv(0) + Chr(34), CInt(argv(1)), CBool(argv(2)))
Else
    Wscript.Echo "winrun <command> [win] [wait]"
    Wscript.Echo "    win  : 0 hide | 1 normal | 2 minimize | 3 maximize"
    Wscript.Echo "    wait : false | true"
    Wscript.Quit
End If