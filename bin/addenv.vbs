Set argv = WScript.Arguments : argc = argv.Count
If argc<>3 Then
    Wscript.Echo "addenv <identity> <name> <value>"
    Wscript.Echo "    identity : user | system"
    Wscript.Quit
End If
CreateObject("Wscript.Shell").Environment(argv(0))(argv(1)) = argv(2)
Wscript.Quit