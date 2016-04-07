DROP PACKAGE ASU.PKG_MANAGER
/

--
-- PKG_MANAGER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MANAGER" IS -- MODIFICATION HISTORY
-- Mikrom      22.02.2001
-- Mjdified by PHP (Netrebenko Evgeniy) 04.11.2003
  PROCEDURE DO_DEL_PAC_FROM_KONS(pNAZID IN NUMBER);
  PROCEDURE DO_INSERT_PAC_KONS(pNAZID IN NUMBER, pDATETIME IN DATE);
  FUNCTION GET_NAZPROC_COUNT_IB(pID IN NUMBER) RETURN NUMBER; -- ���������� ���������� �������� ������� ��������� � TIB, �� ������ ����������.
  FUNCTION GET_NAZPROC_MASK(pID IN NUMBER) RETURN VARCHAR2; -- ���������� ����� ����������� �������� �� ������ ����������.
  PROCEDURE INSERT_SOMEPROC(pSMID IN NUMBER, pPACID IN NUMBER, pNAZID IN NUMBER, pSOSID IN NUMBER, pDAYINS DATE, pFK_ISPOLKABID in number default -1); --��������� ����������
  FUNCTION GET_NUM_OF_SUNDAY RETURN NUMBER;
  FUNCTION GET_NAZPROC_SOSID(pID IN NUMBER) RETURN NUMBER;  -- ���������� ��� �������, ������� ���� ��������� ����������, � ����������� ��                                                          -- ����, ����� ������ ����� ��� ���������, ������� ����������.
  FUNCTION GET_NAZPROC_COUNT_NEVIP(pID IN NUMBER) RETURN NUMBER;  -- ���������� ���-�� ������������ �������� �� ������ ����������.
  FUNCTION GET_NAZPROC_COUNT_NOTINRASPIS(pID IN NUMBER) RETURN NUMBER; --���������� ���-�� �������� �� ���������� � ���������� �� ������ ����������
  PROCEDURE INSERT_PAC_PROC_IN_RASPIS(pID IN NUMBER, pPACID IN NUMBER, pNAZID IN NUMBER, pLECH_ID OUT NUMBER); --���������� �������� �� ������ ������                                                                                                             --� ���������� � ��������� ������ �                                                                                                             --������� ��������.
  PROCEDURE DELETE_PAC_FROM_RASPIS(pID IN NUMBER, pPACID IN NUMBER, pNAZID IN NUMBER); --������� �������� �� ������� ����������� ��������.
  FUNCTION GET_PROC_SOS(pNAZID IN NUMBER, pDAYINS IN DATE) RETURN VARCHAR2;     --���������� ������ ��������� �� ������� ����
  FUNCTION GET_PROC_SOS_ID(pNAZID IN NUMBER, pDAYINS IN DATE) RETURN NUMBER;    --���������� ��� ������� ��������� �� ������� ����
  FUNCTION GET_PROC_COUNT_TODAY(pNAZID IN NUMBER, pDAYINS IN DATE) RETURN NUMBER;
  FUNCTION GET_PACSEX(pID IN NUMBER) RETURN VARCHAR2;  --���������� ������ ����� ���� ��������
  FUNCTION IS_NOT_PACVYB(pPACID IN NUMBER) RETURN NUMBER;  --���������� 1- ���� ������� �������.
  FUNCTION GET_IS_PAC_PROC_IN_RASPIS(pID IN NUMBER) RETURN NUMBER; --���������� 1 ���� ��� ��������� �������� ��������� �� ����������
  FUNCTION IS_PAC_BUSY_IN_PERIOD(pPACID IN NUMBER, pFK_GRAPH  IN NUMBER) RETURN NUMBER; --���������� 1 ���� ������� � ��� ����� �����
  FUNCTION GET_SMID_TIME_LENGTH(pSMID IN NUMBER) RETURN NUMBER;  --���������� ����������������� pSMID
  FUNCTION GET_NAZ_NOTINRASPIS(pID IN NUMBER) RETURN NUMBER;
  FUNCTION create_temp_graph_table (ppacid IN NUMBER, pgraphid IN NUMBER, pnazid IN NUMBER, ppacsex IN NUMBER,pDayC IN NUMBER default 30) RETURN NUMBER;
  FUNCTION get_graph_period (pgraphid IN NUMBER, pdate DATE) RETURN NUMBER;
  FUNCTION get_naz_time_period (pnazid IN NUMBER, pdate DATE) RETURN NUMBER;
  FUNCTION get_smid_interval (sm1 IN NUMBER, sm2 IN NUMBER) RETURN NUMBER;
  PROCEDURE delete_for_day (pid IN NUMBER);
  PROCEDURE DO_UPDATE_NAZPROC(pNAZID IN NUMBER);
  FUNCTION IS_TIME_IN_BUSY_PERIOD(pNAZVRACHID NUMBER, pDATE DATE, pTIME DATE, pPRIEMINT NUMBER)  return NUMBER;
  FUNCTION get_graphid_period (pFK_GRAPHID IN NUMBER) RETURN NUMBER;
  procedure DoUpdateAfterInsert(pFK_GRAPHID in number, DefPeriod in number );
  procedure DoUpdateAfterInsertShablon(pFK_GRAPHID in number, DefPeriod in number );

END; -- Package Specification PKG_MANAGER
/

SHOW ERRORS;


