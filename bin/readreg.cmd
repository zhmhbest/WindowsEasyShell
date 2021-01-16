@SET RETURN_CODE=
@SET RETURN_VALUE=
@FOR /F "usebackq tokens=*" %%i IN (`cscript //nologo "%~dpn0.vbs" %*`) DO @(
    IF DEFINED RETURN_VALUE (
        SET RETURN_CODE=%%i
    ) ELSE (
        SET RETURN_VALUE=%%i
    )
)
@IF 0 NEQ %RETURN_CODE% @(
    ECHO %RETURN_VALUE%
)