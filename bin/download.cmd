@SET aria2c=
@FOR /F "useback" %%i IN (`where aria2c 2^>NUL`) DO @(
    SET aria2c=%%i
)
@SET url=%~1
@IF DEFINED url (
    @IF DEFINED aria2c @(
        aria2c -k 1M -x 16 -j 5 "%url%"
    ) ELSE (
        start "" "https://sourceforge.net/projects/aria2/files/stable/aria2-1.19.0/aria2-1.19.0-win-64bit-build1.zip/download"
    )
) ELSE (
    @ECHO download ^<url^>
)