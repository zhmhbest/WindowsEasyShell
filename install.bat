@ECHO OFF
CD /D %~dp0
SET PATH_SHELL=%CD%\bin
CALL ".\bin\wesaddpath.cmd" "%PATH_SHELL%"