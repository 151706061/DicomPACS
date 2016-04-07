DROP FUNCTION ASU.GET_DIAG_USL_NAME
/

--
-- GET_DIAG_USL_NAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSTANDART (Table)
--   TSTANDART_ICD10 (Table)
--   TICD10 (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_DIAG_USL_NAME" (pDiagCode IN VARCHAR2, pGroup IN NUMBER DEFAULT 1) RETURN VARCHAR2 IS
-- Created 20060921 by Serg
-- ������� ���������� ������������ ������ (��������� (TSTANDART)) �� ���� �������� � ������
CURSOR C
IS
  SELECT MAX(S.FC_NAME)
         FROM TSTANDART S,
              TSTANDART_ICD10 SI,
              TICD10 I
         WHERE I.FK_ID = SI.FK_ICD10
         AND S.FK_ID = SI.FK_STANDART
         AND S.FK_GROUPID = pGroup
         AND UPPER(I.FC_KOD) LIKE SUBSTR(UPPER(pDiagCode), 1, 3);

 D VARCHAR2(255);

BEGIN
 OPEN C;
  FETCH C INTO D;
 CLOSE C;
 RETURN nvl(D, 0);
END;
/

SHOW ERRORS;


