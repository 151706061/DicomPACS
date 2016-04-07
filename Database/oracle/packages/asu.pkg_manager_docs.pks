DROP PACKAGE ASU.PKG_MANAGER_DOCS
/

--
-- PKG_MANAGER_DOCS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MANAGER_DOCS" IS
  FUNCTION GET_PROC_PACLIST(pSPEC IN NUMBER, pDATE IN DATE,pRecept in number) RETURN NUMBER;  --���������� ��� ��������� � TCLOBS (���������� ����� �
                                                                            --����������� �������� ����������)
  FUNCTION GET_DOC_HEADER(pNAME IN VARCHAR2) RETURN VARCHAR2;  --���������� ��������� HTML �����, � �������� ��������� ����������
                                                                    --�������� ���������
  FUNCTION GET_DOC_STYLES1 RETURN VARCHAR2;      --���������� ������� ������ ��� ������ � ��� �������� ����
  FUNCTION GET_DOC_STYLES2 RETURN VARCHAR2;      --���������� ������� ������ ��� ������ � ��� �������� ����
  FUNCTION GET_TITLE_DOC(pNAME IN VARCHAR2) RETURN VARCHAR2;  --���������� ����� ���������
  FUNCTION GET_PAC_PROCLIST (pPAC_ID IN NUMBER, nMODE IN NUMBER) RETURN NUMBER;  --���������� ��� ��������� � TCLOBS
  FUNCTION GET_KAB(pSMID IN NUMBER,pSOTRID IN NUMBER) RETURN NUMBER;                                                                                                   --(������ ���������� �������� �� ����)
END; -- Package Specification PKG_MANAGER_DOCS
/

SHOW ERRORS;


