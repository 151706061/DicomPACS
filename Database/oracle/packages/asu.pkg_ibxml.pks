DROP PACKAGE ASU.PKG_IBXML
/

--
-- PKG_IBXML  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_IBXML" 
  IS

 --�������� ������ ��
 PROCEDURE SET_IB_RAZ(pPacid NUMBER,pRazid NUMBER,pRAZClob  OUT NUMBER);
  --����������� ������� ��������,����������� ��� ���� �� (�������������)
 FUNCTION GET_IB(pFk_pacid NUMBER,pSotrID NUMBER,pAppId NUMBER,pRAZiD NUMBER:=-1,pEvent VARCHAR2:='NOEVENT',pVid NUMBER:=0) RETURN CLOB;
 --����������� �� � ���� �������(������ �������� � ������������� ����)
 FUNCTION GET_IB_BOOKLET(pFk_pacid NUMBER) RETURN CLOB;
 --����������� �� ��� ����������
 FUNCTION GET_IB_WEB(pPAcid NUMBER) RETURN CLOB;
 --�������� �� ������ �������?(0/1)
 FUNCTION IS_RAZPRINT(pRAZiD NUMBER) RETURN NUMBER;
 --���������� ������ �� ��� ������
 FUNCTION get_fullibprint(pFk_pacid NUMBER) RETURN CLOB;
 -- ���������� ���-�� ������ ��� �������
 FUNCTION GET_RAZSMIDCNT(pPacid NUMBER,pRazID NUMBER,pSmid NUMBER) RETURN NUMBER;
 -- ��������� ���-�� ��������� �������
 PROCEDURE UPDATE_IBRAZ_CNT(pPacid NUMBER,pRazid NUMBER,pSmid NUMBER,pCnt NUMBER);
 -- ��������� ������ �� ������������ (0 OR 1)
 FUNCTION CHECK_RAZ(pPacid NUMBER,pRazID NUMBER) RETURN NUMBER;
 --���������� ��� ������� (0-����������,1-����������)
 FUNCTION GET_RAZTYPE(pRazid NUMBER) RETURN NUMBER;
 --����� ��������, ������ ��������
 FUNCTION SET_FST(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --��� ����� ���������� ��� ����������
 FUNCTION GET_KARTBER(pPAcid NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --���� �����
 FUNCTION GET_DISP_KARTA(pPAcid NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB ;
 --������ ������� �����������
 function GET_SOTR_RANK(id number) return varchar2;
 --�������
 FUNCTION SET_OSM(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --������� � HTML (��� ��������� �������� � pkg_consultrep)
 FUNCTION GET_HTM_OSM(pResId NUMBER) RETURN CLOB;
 --����������� ���������
 FUNCTION SET_OBOSN(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 /*--��������
 FUNCTION SET_DNEV(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;*/
 --������������
 FUNCTION SET_OBSLED(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --�������� � html ��� ������
 FUNCTION SET_HTM_EPIKR(pEpikID NUMBER) RETURN CLOB;
 --��������
 FUNCTION SET_EPIKR(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --����������� �������
 FUNCTION SET_OPER(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --����
 FUNCTION SET_RODI(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --������� �������� ���. ���������
 FUNCTION SET_SROTMET(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --�������-��������������������� ����������
 FUNCTION SET_PATOLOG(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --������� �� ��
 FUNCTION SET_IBVIP(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --������������� ����(������������ ������)
 FUNCTION SET_TEMPLIST(pFK_PACID NUMBER) RETURN CLOB;
  --������������� ����(��������) ��� ������ (������������ ������ ��� ������)
 FUNCTION SET_TEMPLISTBLANK(pPacid NUMBER) RETURN CLOB;
 --���������� � ��������������
 FUNCTION SET_GOSPZAKL(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --������� ������� �� ��
 --0-��,1-�� ����������� ���.����������
 FUNCTION DELETE_EVENT(pRazID NUMBER,pEventID NUMBER,pSotrId NUMBER) RETURN NUMBER;
 --�������� ����������� ����� �������
 PROCEDURE RESET_RAZDEL(pRazSyn VARCHAR,pPAcid NUMBER);
 --���������� ������� � ���������� ��� ����������
 FUNCTION GET_DIAGBLOCK(pfk_nazid NUMBER,pFk_pacid NUMBER) RETURN CLOB ;
 --�������� ���� ���������� ��� ������������� ����������
 FUNCTION GET_NAZBLOCK(pfk_nazid NUMBER) RETURN VARCHAR;
  ----------------------------------------------
 FUNCTION GET_PROTHOPER(CL CLOB,pPacid NUMBER,pDate DATE,sVrach VARCHAR,sTime VARCHAR) RETURN CLOB;
 --�������� �������� ��� xml
 FUNCTION get_diagname(pDiagID IN NUMBER) RETURN VARCHAR2;
 FUNCTION  PROCESS (sourceID NUMBER) RETURN CLOB;
 FUNCTION GET_HTMBODY(CL CLOB) RETURN CLOB;
 --���������� ��� ���-�� ��������
 FUNCTION GET_DOC(pPAcid NUMBER) RETURN NUMBER;
 --���������� ��������� ������������ ����� �� Tib
 FUNCTION GET_PERELIV (pfk_PACID NUMBER,pSYN VARCHAR2 ) RETURN VARCHAR;
 -- ���������� ������� � ����� �����������
 FUNCTION GET_DIAG_NAPR(pPAcid NUMBER) RETURN VARCHAR ;
 PROCEDURE GET_IB_PHP(pXSL_RAZD in out CLOB,pXSL in out CLOB,pXML in out CLOB, pFk_pacid NUMBER,pSotrID NUMBER,pAppId NUMBER,pRAZiD NUMBER:=-1,pEvent VARCHAR2:='NOEVENT',pVid NUMBER:=0);



  PROCEDURE GET_IB_BOOKLET_PHP(pXSL in out CLOB,pXML in out CLOB,pFk_pacid NUMBER);
END;
/

SHOW ERRORS;


