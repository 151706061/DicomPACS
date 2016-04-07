DROP PACKAGE ASU.PKG_PROFP_REPORTS
/

--
-- PKG_PROFP_REPORTS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PROFP_REPORTS" 
  IS
   -- �������� ������ ���������� � ���� ������, ����������� �������� ;
   -- �� ���� �������� TPROFP_LIST.FK_ID
   FUNCTION GET_NAZ_PROFP_LIST(List_ID IN number) RETURN  VARCHAR2;

   -- �������� ������, ���������� ���� � ���� 01 ������ 2006
   -- �� ���� ���������� ���� Date
   function GET_SPEC_DATE(aDate in Date) return VARCHAR2;

   -- �������� ������, ���������� ���������� � ���� ���������
   -- "��������" � "�� ��������"
   -- �� ���� ���������� ���� Date
   function GET_SPEC_ZAKL(aStr in VARCHAR2) return VARCHAR2;
END; -- Package spec
/

SHOW ERRORS;


