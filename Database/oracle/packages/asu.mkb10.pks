DROP PACKAGE ASU.MKB10
/

--
-- MKB10  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSOTR (Synonym)
--   TREPMKB10 (Table)
--   DO_VRACHFIO (Function)
--
CREATE OR REPLACE PACKAGE ASU."MKB10" 
IS
--����������� ����� ������ �� ��������������
--_____________________________________________________________________
--��.�.|�������������|����|���������1           | ���������2          |
--     |             |    |����1|����2|....|�.��|����1|����2|....|�.��|
-- --------------------------------------------------------------------
--....................................................................
--����������� �������|    |     |     |    |    |     |     |    |    |
--�����              |    |     |     |    |    |     |     |    |    |
--�-��               |    |     |     |    |    |     |     |    |    |
  CURSOR cLechInOtd (pFK_OTDID IN NUMBER)
  IS
    SELECT DISTINCT tsotr.fk_id, do_vrachfio (tsotr.fk_id) AS fc_fio
      FROM tsotr
     WHERE FP_VRACH = 1
       AND fk_otdid = pFK_OTDID;
  CURSOR cRepMkb10
  IS
    SELECT *
      FROM tRepMkb10
     ORDER BY TO_NUMBER (fn_rownum);
  FUNCTION SanMKB10 (pFD1 DATE, pFD2 DATE)
    RETURN NUMBER;
--������������ �� ���� ������� ��������� ����������
-- ������ ���� ��� - ��� �� ���-10
--        ���� ���-YYY - ���������� �� ���-10
  FUNCTION IS_INPERIOD (sMKB10 IN VARCHAR2, fk_smid IN NUMBER)
    RETURN NUMBER;
  FUNCTION CountLechInOtd (pFK_OTDID IN NUMBER)
    RETURN NUMBER;
  FUNCTION ResLechMKB10 (pFD1 DATE, pFD2 DATE, pVrachID IN NUMBER)
    RETURN NUMBER;

  PROCEDURE prepare_agetable;
END;   -- Package spec
/

SHOW ERRORS;


