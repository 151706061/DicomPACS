DROP FUNCTION ASU.GET_RAZDSMID
/

--
-- GET_RAZDSMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_RAZDSMID" ( pFK_SMID IN NUMBER)
  RETURN  VARCHAR2 IS
-- Purpose: Возвращает показываемое значение кода динамики в редакторе списка разделов
-- by TimurLan ПИЗДЕЦ ПРОСТО! CURSOR c IS SELECT FC_NAME FROM TSMID WHERE FK_ID=pFK_SMID UNION SELECT 'Функция' FROM DUAL;
CURSOR c IS SELECT /*+ first_row*/FC_NAME FROM TSMID WHERE FK_ID=pFK_SMID;
-- by TimurLan str VARCHAR2(100);
str TSMID.FC_NAME%TYPE;
BEGIN
  IF C%ISOPEN THEN
    CLOSE C;
  END IF;
  OPEN C;
  FETCH C INTO str;
  CLOSE C;
  RETURN NVL(str,'Функция');
END;
/

SHOW ERRORS;


