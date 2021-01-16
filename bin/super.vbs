Set argv = WScript.Arguments : argc = argv.Count
IF 1 = argc Then
    Call CreateObject("Shell.Application").ShellExecute(argv(0), "", "", "runas", 1)
ElseIf 2 = argc Then
    Call CreateObject("Shell.Application").ShellExecute(argv(0), argv(1), "", "runas", 1)
Else
    WScript.Echo "<apppath> [params]": WScript.Quit
End If