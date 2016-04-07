DROP PACKAGE ASU.PKG_EXCH_SAMOZAPIS
/

--
-- PKG_EXCH_SAMOZAPIS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   WEB_BUFFER_TRANSFER (Table)
--
CREATE OR REPLACE PACKAGE ASU.PKG_EXCH_SAMOZAPIS IS

  -- Author  : SPASSKIY
  -- Created : 01.09.2010 14:07:50
  -- Purpose :
  IS_REPL BOOLEAN := FALSE;
  --������������� ����� ����������
  PROCEDURE MATCH_SCHEDULE_GRAPH(PSCHEDULE IN VARCHAR2, PGRAPH NUMBER);

  --������������� ���������
  PROCEDURE MATCH_PEOPLE_AMBULANCE(PPEOPLE_OID   VARCHAR2,
                                   PAMBULANCE_ID NUMBER);

  --������������� ��� � ���������
  PROCEDURE MATCH_LPU_OTDEL(PLPU_OID VARCHAR2, POTDEL_ID NUMBER);

  --���������� ���, � ������� ������������ ���������, ���� ������� ��������, � �������� ���� �������������
  FUNCTION GET_WEB_LPU_BY_OTDEL(POTDEL NUMBER) RETURN VARCHAR2;

  --���������� ���, � ������� ������������ ���������, � ������� ������� ���������
  FUNCTION GET_WEB_LPU_BY_SOTR(PSOTR NUMBER) RETURN VARCHAR2;

  --����������� ���������
  PROCEDURE DO_LOG(PTABLE_NAME      ASU.WEB_BUFFER_TRANSFER.TABLE_NAME%TYPE,
                   pKEY_FIELD_VALUE ASU.WEB_BUFFER_TRANSFER.KEY_FIELD_VALUE%TYPE,
                   pACTION          ASU.WEB_BUFFER_TRANSFER.ACTION%TYPE);
   
  --����������� ��������� � �������������� �����������                
  PROCEDURE DO_LOG(PTABLE_NAME      ASU.WEB_BUFFER_TRANSFER.TABLE_NAME%TYPE,
                   pKEY_FIELD_VALUE ASU.WEB_BUFFER_TRANSFER.KEY_FIELD_VALUE%TYPE,
                   pACTION          ASU.WEB_BUFFER_TRANSFER.ACTION%TYPE,
                   pFC_INFO         ASU.WEB_BUFFER_TRANSFER.FC_INFO%TYPE);

  --����������� ��������� � ����� ������������ ������������ � �������� TGRAPH$WEB_REPLICATION 
  PROCEDURE DO_LOG(PTABLE_NAME      ASU.WEB_BUFFER_TRANSFER.TABLE_NAME%TYPE,
                   pKEY_FIELD_VALUE ASU.WEB_BUFFER_TRANSFER.KEY_FIELD_VALUE%TYPE,
                   pACTION          ASU.WEB_BUFFER_TRANSFER.ACTION%TYPE,
                   pFC_INFO         ASU.WEB_BUFFER_TRANSFER.FC_INFO%TYPE,
                   pACTUAL_DATE     ASU.WEB_BUFFER_TRANSFER.ACTUAL_DATE%TYPE);

  --��������� �������� ����������� �������
  PROCEDURE SET_SERVICE_REACHABLE(PSTATE NUMBER);

  --������ �������� ����������� �������
  FUNCTION IS_SERVICE_REACHABLE RETURN NUMBER;

END PKG_EXCH_SAMOZAPIS;
/

SHOW ERRORS;


