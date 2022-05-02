@ECHO OFF
CD /D %~dp0
SET PATH_SHELL=%CD%\bin
CALL ".\bin\addpath.cmd" "%PATH_SHELL%"
PAUSE