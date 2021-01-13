Set argv = WScript.Arguments : argc = argv.Count
If argc<>3 Then Wscript.Echo "<user | system> name value" : Wscript.Quit
CreateObject("Wscript.Shell").Environment(argv(0))(argv(1)) = argv(2)
Wscript.Quit