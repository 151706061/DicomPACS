DROP PACKAGE ASU.PKG_TEXTIB
/

--
-- PKG_TEXTIB  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_TEXTIB" 
 IS
  -- LastUpdated : 01.07.2005 by TimurLan
  -- LastUpdated : 19.07.2005 by Xander
  --������ ������� �������
  FUNCTION getFullIbClobID(pFK_PACID IN NUMBER,pFK_SOTRID IN NUMBER DEFAULT -1) RETURN NUMBER;

  -- ��������� ��������
  FUNCTION getEpikrizHeaderText(pFK_PACID IN NUMBER,
                                bDIAG     IN NUMBER,
                                bHEADER   IN NUMBER) RETURN VARCHAR2;

  -- ������� ��� ����� � ������� ����� ��������
  FUNCTION getFullEpikrizTextClobID(pFK_PACID IN NUMBER,
                                    pfl_diagn IN NUMBER,
                                    pfl_zakl  IN NUMBER,
                                    pFL_lab   IN NUMBER,
                                    pfl_diag  IN NUMBER,
                                    pfl_lech  IN NUMBER,
                                    pfl_kons  IN NUMBER) RETURN NUMBER;

  --��������� � ������� � ������� ����������
  FUNCTION getVrachRek(pFK_PACID IN NUMBER) RETURN CLOB;
  PROCEDURE DoSetEpikriz(pFK_PACID     IN NUMBER,
                         pfk_clobid    IN NUMBER,
                         pfk_epclobid  IN NUMBER,
                         pfk_rekclobid IN NUMBER,
                         pFL_PODPIS    IN NUMBER,
                         pFK_VRACHID   IN NUMBER);

  --���������� ���� � �������� ������� �������
  FUNCTION getRazdelIbText(pFK_PACID IN NUMBER DEFAULT NULL,
                           nStartID  IN NUMBER,
                           sCaption  IN VARCHAR2,
                           sDefault  IN VARCHAR2) RETURN CLOB;
  FUNCTION getStatNazIbClob(pFK_PACID IN NUMBER, bEp IN NUMBER) RETURN CLOB;

  --������������� ������ ������� �������  by TimurLan
  FUNCTION getFullIbClobID_by_SET(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 1) RETURN NUMBER; -- by TimurLan ���� ������ ��
  FUNCTION SET_getIbHeader(pFC_PACID IN VARCHAR2,pFN_MODE  IN NUMBER DEFAULT 0,pFN_TYPE  IN NUMBER DEFAULT 1) RETURN CLOB; -- by TimurLan ��������� ��
  FUNCTION SET_getIbEnder(pFC_PACID IN VARCHAR2,pFN_MODE  IN NUMBER DEFAULT 0,pFN_TYPE  IN NUMBER DEFAULT 1) RETURN CLOB; -- by TimurLan ����� ��
  FUNCTION SET_getIbDiags(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan �������� ��������
  FUNCTION SET_GET_PAC_PROTIV(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ��������� � �������
  FUNCTION SET_getanambolIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ������� �������
  FUNCTION SET_getRazdelIbText1(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ������
  FUNCTION SET_getRazdelIbText2(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ������� �����
  FUNCTION SET_getRazdelIbText3(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan �����������
  FUNCTION SET_getRazdelIbText4(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ������ ����������� ������������
  FUNCTION SET_GET_PAGE_BREAK(pFK_PACID IN NUMBER DEFAULT NULL) RETURN CLOB; -- by TimurLan ������ ��������
  FUNCTION SET_GET_HR(pFK_PACID IN NUMBER DEFAULT NULL) RETURN CLOB; -- by TimurLan �������������� �����
  FUNCTION SET_GET_RAZD_BREAK(pFK_PACID IN NUMBER DEFAULT NULL) RETURN CLOB; -- by TimurLan ����������� �������� ��
  FUNCTION SET_do_diagbytype1(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan �������� �������
  FUNCTION SET_do_diagbytype2(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ������������� �������
  FUNCTION SET_GET_NAZRESULTKEK_IB(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ��������� ���
  FUNCTION SET_getNazListIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ���� ��������������� �����������
  FUNCTION SET_getProcListIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ���� �������� �����������
  FUNCTION SET_GetNazMed(pFK_PACID IN NUMBER DEFAULT NULL, pFN_MODE IN NUMBER DEFAULT 0)RETURN CLOB; -- by TimurLan ���� ��������������� ����������
  FUNCTION SET_getTechBolIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan �������� ����������
  FUNCTION SET_getResAnIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ���������� ��������
  FUNCTION SET_getResNazIbText1(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ���������� ��������������� ������������
  FUNCTION SET_getResNazIbText2(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ������������ ������������
  FUNCTION SET_getFirstPatalogy(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ������� ���������� ���������
  FUNCTION SET_getEpikrizHeaderText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0)RETURN CLOB; -- by TimurLan �������� �������
  FUNCTION SET_getStatNazIbClob(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ���������� ���������
  FUNCTION SET_getVrachZakl(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ���������� �������� �����
  FUNCTION SET_getVrachRek(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ������������ �������� �����
  FUNCTION SET_getPodpisiIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ������� ��
  FUNCTION SET_getStomIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan ���� ������������������ �������
  FUNCTION getFullIbClobID_by_SET2(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 2) RETURN NUMBER;
  FUNCTION getFullIbClobID_by_SET3(pFC_PARAM IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 2) RETURN NUMBER;
  FUNCTION SET_getIbHeader2(pFC_PACID IN VARCHAR2,pFN_MODE  IN NUMBER DEFAULT 0,pFN_TYPE  IN NUMBER DEFAULT 1) RETURN CLOB;
  FUNCTION getIbHeader3(pFK_PEPLID IN NUMBER) RETURN VARCHAR2;
  FUNCTION GET_NAZ_RESULT(pFK_NAZID IN NUMBER) RETURN CLOB;
   --��������� ������ by XANDER
  FUNCTION SET_FIRSTOSM(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --���������������� ������� by XANDER
  FUNCTION SET_EPIKRIZ1(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --���������������� ������� ������������� by XANDER
  FUNCTION SET_EPIKRIZ2(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --�������� ��������   by XANDER
  FUNCTION SET_OPERPROT(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --����� ���������   by XANDER
  FUNCTION SET_ANASTKARTA(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --�������-��������������������� �������   by XANDER
  FUNCTION SET_EPIKRIZ3(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --������ ����������� ��������� �����������, ������ ������������ � ��������  by XANDER
  FUNCTION SET_TEMPLIST(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;

END;
/

SHOW ERRORS;


