@REM ��ȡ��ǰĿ¼������Ŀ¼�����ļ�������Ȩ��
@PUSHD "%1"
@ECHO User:[%UserName%]
@ECHO Work:[%CD%]
@ECHO Drive:[%~d1]
@PAUSE

@IF "%~d1\" == "%CD%" (
    @FOR /F "usebackq delims=" %%f IN (`DIR /a:-h-s /b "%CD%"`) DO @(
        @ECHO [%%f]
        @REM ��ǰ�û�Ϊ������
        @ICACLS "%%f" /SetOwner %UserName% /T /C /L /Q >NUL && @ECHO Owner: ��
        @REM ʹ�ü̳е�ACL��/Gant��ɾ�������ã�
        @ICACLS "%%f" /Reset /T /C /L /Q >NUL && @ECHO Reset: ��
    )
) ELSE (
    @REM ��ǰ�û�Ϊ������
    @ICACLS "%CD%" /SetOwner %UserName% /T /C /L /Q >NUL && @ECHO Owner: ��
    @REM ʹ�ü̳е�ACL��/Gant��ɾ�������ã�
    @ICACLS "%CD%" /Reset /T /C /L /Q >NUL && @ECHO Reset: ��
)

@ECHO Done!
@POPD
@PAUSE
@EXIT

@REM ICACLS <filename> [options]
@REM     /T     �ݹ���Ŀ¼��
@REM     /C     �������
@REM     /L     �������ű���
@REM     /Q     ����ʾ�ɹ���Ϣ
@REM @ICACLS "%CD%" /Remove Administrators /T /C /Q
@REM @ICACLS "%CD%" /SetOwner Administrators /T /C /Q
@REM @ICACLS "%CD%" /Reset /T /C /Q
@REM @ICACLS "%CD%" /Grant Administrators:(F)

@REM TAKEOWN ����Ա���Ŀ¼�������ļ�������Ȩ
@REM     /F <filename>   ָ���ļ�����Ŀ¼��ģʽ
@REM     /A              ������Ȩ���ڹ���Ա��
@REM     /R              �ݹ飨Ŀ¼����Ŀ¼��
@REM     /D Y            û���г�Ȩ��ʱ�Զ���ȡ
@REM @TAKEOWN /F "%CD%" /A /R /D Y

@REM CACLS �޸��ļ��ķ��ʿ����б�(ACL)
@REM     /T              ���ĵ�ǰĿ¼����������Ŀ¼��
@REM     /G User:Perm    ����ָ���û�����Ȩ�ޡ�(Perm = R ��ȡ | W д�� | C д�� | F ��ȫ����)
@REM @ECHO Y|CACLS "%CD%" /T /G %UserName%:F
