DROP FUNCTION ASU.GET_PACSEX_CODE
/

--
-- GET_PACSEX_CODE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACSEX_CODE" 
  ( pFK_ID IN NUMBER)
  RETURN  NUMBER IS
--
-- Purpose: Возвращает код пола пациента
--
CURSOR c IS SELECT /*+first_row*/FP_SEX FROM TKARTA WHERE FK_ID=pFK_ID;
i NUMBER;
BEGIN
  IF c%ISOPEN THEN
    CLOSE c;
  END IF;
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;
/

SHOW ERRORS;


