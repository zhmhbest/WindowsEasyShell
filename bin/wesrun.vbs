Set argv = WScript.Arguments : argc = argv.Count
If argc<>3 Then Wscript.Echo "command style wait" : Wscript.Quit
Call CreateObject("WScript.Shell").Run(Chr(34) + argv(0) + Chr(34), CInt(argv(1)), argv(2))