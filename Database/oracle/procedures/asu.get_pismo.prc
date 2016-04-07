DROP PROCEDURE ASU.GET_PISMO
/

--
-- GET_PISMO  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPISMA (Table)
--
CREATE OR REPLACE PROCEDURE ASU."GET_PISMO" -- Modified by TimurLan
 (pFK_ID IN OUT NUMBER, pFK_PREDID OUT NUMBER, pFD_DATA OUT DATE, pFK_NAME_DOG OUT VARCHAR2, pFN_SUM OUT NUMBER, pFN_NUM OUT NUMBER)
IS
 CURSOR cExists
  IS SELECT   /*+ first_row*/COUNT (FK_ID) FROM TPISMA WHERE FK_ID = pFK_ID;
 nTemp   NUMBER;
BEGIN
  OPEN cExists;
  FETCH cExists INTO nTemp;
  CLOSE cExists;
  IF nTemp > 1 THEN
    raise_application_error (-20001, 'Ќайдено более одного письма с уникальным кодом: ' || TO_CHAR (pFK_ID));
  ELSIF nTemp = 0 THEN
    INSERT INTO TPISMA (FK_ID)
         VALUES (pFK_ID)
      RETURNING FK_ID INTO pFK_ID;
  END IF;
  SELECT   /*+rule*/FK_PREDID, FD_DATA, FK_NAME_PIS, FN_SUM, FN_NUM
    INTO pFK_PREDID, pFD_DATA, pFK_NAME_DOG, pFN_SUM, pFN_NUM
    FROM TPISMA
   WHERE FK_ID = pFK_ID;
END;   -- Procedure
/

SHOW ERRORS;


