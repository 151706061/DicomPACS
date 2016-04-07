DROP FUNCTION ASU.GETSMDIAGID
/

--
-- GETSMDIAGID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_DIAGID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GETSMDIAGID" 
  RETURN  NUMBER IS
  nDiagID NUMBER;
BEGIN
 -- SELECT FK_ID INTO nDiagID FROM TSMID WHERE FC_NAME='Справочник диагнозов (МКБ-Х)' AND FK_OWNER=0;
 SELECT FK_ID INTO nDiagID FROM TSMID WHERE /*UPPER(FC_NAME)*/fk_id = get_diagid AND FK_OWNER=0;
    RETURN nDiagID;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
     raise_application_error(-20001,'Ошибка данных! Не найден справочник диагнозов!') ;
   WHEN TOO_MANY_ROWS THEN
     raise_application_error(-20001,'Ошибка данных! Найдено два справочника диагнозов!') ;
END;
/

SHOW ERRORS;


