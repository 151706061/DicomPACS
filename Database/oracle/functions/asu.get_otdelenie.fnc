DROP FUNCTION ASU.GET_OTDELENIE
/

--
-- GET_OTDELENIE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TROOM (Table)
--   TKORP (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_OTDELENIE" (pFK_ID IN NUMBER)
  RETURN VARCHAR2 IS

  FC_NAME VARCHAR2(32000);
  CURSOR cOtdel IS SELECT FC_NAME FROM TROOM, TKORP WHERE TROOM.FK_ID=pFK_ID AND TKORP.FK_ID = TROOM.FK_KORPID;

BEGIN
  OPEN cOtdel;
  FETCH cOtdel INTO FC_NAME;
  CLOSE cOtdel;

  RETURN FC_NAME ;
END;

--Created by Kolya 25.07.2005
--Сделано для отображения палаты при переселении в паспортных данных
/

SHOW ERRORS;


