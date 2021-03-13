@SET aria2c=
@FOR /F "useback" %%i IN (`where aria2c 2^>NUL`) DO @(
    SET aria2c=%%i
)
@IF DEFINED aria2c @(
    aria2c -k 1M -x 16 -j 5 "%~1"
)