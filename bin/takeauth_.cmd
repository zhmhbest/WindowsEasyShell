@REM ��ȡ��ǰĿ¼������Ŀ¼�����ļ�������Ȩ��
@PUSHD "%1"
@ECHO User:[%UserName%]
@ECHO Work:[%CD%]
@PAUSE

:: TAKEOWN ����Ա���Ŀ¼�������ļ�������Ȩ
::     /F <filename>   ָ���ļ�����Ŀ¼��ģʽ
::     /A              ������Ȩ���ڹ���Ա��
::     /R              �ݹ飨Ŀ¼����Ŀ¼��
::     /D Y            û���г�Ȩ��ʱ�Զ���ȡ
:: @TAKEOWN /F .\* /A /R /D Y
::
:: ICACLS name [/grant[:r] Sid:perm[...]] [/remove[:g|:d]] Sid[...]] [/T] [/C] [/L] [/Q]
::
:: CACLS �޸��ļ��ķ��ʿ����б�(ACL)
::     /T              ���ĵ�ǰĿ¼����������Ŀ¼��
::     /G User:Perm    ����ָ���û�����Ȩ�ޡ�(Perm = R ��ȡ | W д�� | C д�� | F ��ȫ����)
:: @ECHO Y|CACLS .\* /T /G %UserName%:F

::������ǰĿ¼
@CALL :takeFile "%CD%"

::������Ŀ¼
@FOR /F "usebackq delims=" %%f IN (`DIR /s /b "%CD%"`) DO @(
    @CALL :takeFile "%%f"
)

@ECHO Done!
@POPD
@PAUSE
@EXIT

:takeFile
@ECHO [%~1]
@REM ����Ȩ ���� ����Ա
@TAKEOWN /F "%~1" /A                    >NUL && ECHO OwnA  : ��
@REM �����б�
@ICACLS "%~1" /Grant Administrators:(F) >NUL && ECHO Admin : ��
@ICACLS "%~1" /Grant SYSTEM:(F)         >NUL && ECHO System: ��
@ICACLS "%~1" /Grant %UserName%:(F)     >NUL && ECHO User  : ��
@REM ����Ȩ ���� ��ǰ�û�
@ICACLS "%~1" /SetOwner %UserName%      >NUL && ECHO OwnU  : ��
@GOTO :EOF
