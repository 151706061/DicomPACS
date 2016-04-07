DROP PACKAGE ASU.PKG_EQUEUE
/

--
-- PKG_EQUEUE  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.pkg_equeue is

  -- Author  : Serjant
  -- Created : 02.03.2012 13:35:57
  -- Purpose : ��� ����������� ��� ������ � ����������� ��������

  pPanelListState number; -- 0 - ���� ��� ���������,
  -- 1 - ���� ������ ��� ������ ���������;

  -- ���������� ����� �������
  function QueueTypeList return sys_refcursor;

  -- ���������� ���� �������
  procedure AddQueueType(pName    in varchar2,
                         pLetter  in char,
                         pProcess in number,
                         pAbsence in number,
                         pBegin   in date,
                         pEnd     in date);

  -- �������������� ���� �������
  procedure EditQueueType(pID      in number,
                          pName    in varchar2,
                          pLetter  in char,
                          pProcess in number,
                          pAbsence in number,
                          pBegin   in date,
                          pEnd     in date,
                          pEnabled in number default null);

  -- �������� ���� �������
  procedure DelQueueType(pID in number);

  -- ������ ���� ��� ����� �������
  function LettersList(pid in number default -1) return sys_refcursor;

  -- ���������/����������� �������
  procedure ActivateQueue(pid in number, penabled in number);

  -- �������� ���� ������������
  procedure AddQueueWindow(pname in varchar2);

  -- ������������� ���� ������������
  procedure EditQueueWindow(pid in number, pname in varchar2);

  -- ������ ������� ����
  function GetWindowList(pid in number default -1) return sys_refcursor;

  -- ������� ���� ������������
  procedure DelQueueWindow(pid in number);

  -- ��������/��������� ���� ������������
  procedure ActivateWindow(pid in number, penabled in number);

  -- ������ ���� ������������
  function QueueWindowsList return sys_refcursor;

  -- ������ �������� ���� ������������
  function QueueWindowsList(pAct in number) return sys_refcursor;

  -- ������ ������
  function AddTalon(pqueuetype   in number,
                    pPacID       in number,
                    ptalon       out varchar2,
                    ptimewait    out varchar2,
                    ptimeprocess out varchar2,
                    ptimeprint   out varchar2) return varchar2;

  -- ����� ������� �� id
  function GetLetterByType(pqueuetype in number) return char;

  -- ������� �� �������
  function GetQueueEnabled(pqueuetype in number) return number;

  -- �������
  function GetQueueList(pWindow in number) return sys_refcursor;

  -- ����������
  function GetProcessedList(pWindow in number) return sys_refcursor;

  -- ���� �������, ���������� ��� ����
  function GetTypewWindow(pWindow in number) return sys_refcursor;

  -- �������������� ������ �������� ��� ����
  procedure EditTypewWindow(pQueueType in number,
                            pWindow    in number,
                            pAct       in number);

  -- ��������� �������
  function ProcessQueue(pid          in number,
                        pWindow      in number,
                        pPause       in number,
                        pProcessType in number,
                        pSotrID      in number) return number;

  -- ������ ��� ������
  function GetPanelList return sys_refcursor;

  -- �� �������-��?
  function GetWhatSay(pTal out varchar2, pWin out varchar2) return number;

  -- �������� �� �������
  procedure Repeat(pWindow in number);

end pkg_equeue;
/

SHOW ERRORS;


