Set argv = WScript. Arguments : argc = argv.Count
Set WS = WScript.CreateObject("WScript.Shell")
If 2 = argc Then
    FILE = WS.SpecialFolders("Desktop") + "\" + argv(0) + ".lnk"
    Set link = WS.CreateShortcut(FILE)
    link.TargetPath = argv(1)
    link.IconLocation = argv(1)
    link.Save
ElseIf 3 = argc Then
    FILE = WS.SpecialFolders("Desktop") + "\" + argv(0) + ".lnk"
    Set link = WS.CreateShortcut(FILE)
    link.TargetPath = argv(1)
    link.IconLocation = argv(2)
    link.Save
ElseIf 8 = argc Then
    FILE = WS.SpecialFolders("Desktop") + "\" + argv(0) + ".lnk"
    Set link = WS.CreateShortcut(FILE)
    link.TargetPath = argv(1)
    link.IconLocation = argv(2)
    link.WorkingDirectory = argv(3)
    link.Arguments = argv(4)
    link.WindowStyle= CInt(argv(5))
    link.Hotkey = argv(6)
    link.Description = argv(7)
    link.Save
Else
    WScript.Echo "shortcut <name> <path>"
    WScript.Echo "shortcut <name> <path> <icon>"
    WScript.Echo "shortcut <name> <path> <icon> <dir> <arg> <win> <key> <desc>"
End If
WScript.Quit