@REM ��ȡ��ǰĿ¼������Ŀ¼�����ļ�������Ȩ��
@PUSHD "%1"
@ECHO User:[%UserName%]
@ECHO Work:[%CD%]
@PAUSE

:: TAKEOWN ���·����ļ�����Ȩ
::     /F <dir>        ָ���ļ�����Ŀ¼��ģʽ
::     /A              ������Ȩ���ڹ���Ա��
::     /R              �ݹ飨Ŀ¼����Ŀ¼��
::     /D Y            û���г�Ȩ��ʱ�Զ���ȡ
@TAKEOWN /F .\* /A /R /D Y

:: CACLS �޸��ļ��ķ��ʿ����б�(ACL)
::     /T              ���ĵ�ǰĿ¼����������Ŀ¼��
::     /G User:Perm    ����ָ���û�����Ȩ�ޡ�(Perm = R ��ȡ | W д�� | C д�� | F ��ȫ����)
@ECHO Y|CACLS .\* /T /G %UserName%:F

@ECHO Done!
@POPD
@PAUSE