DROP FUNCTION ASU.GET_CURR_LPU_KLADR_ID
/

--
-- GET_CURR_LPU_KLADR_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_CURR_LPU_KLADR_ID" RETURN TKLADR.FK_ID%TYPE IS
--���������� ID ������ ������ �� ������ ����� ��� �������� ���
BEGIN
  RETURN(564242); --ID ������ ������ �� ������ �����
END GET_CURR_LPU_KLADR_ID;
/

SHOW ERRORS;


