DROP FUNCTION ASU.IS_PAC_IN_PERIOD
/

--
-- IS_PAC_IN_PERIOD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PAC_IN_PERIOD" 
--выбыл ли пациент за период
  ( pFK_ID IN NUMBER,pFD_DATA1 IN DATE,pFD_DATA2 IN DATE)
  RETURN  NUMBER IS
  nTemp NUMBER;
  CURSOR cTemp IS SELECT /*+ rule*/COUNT(FK_ID)
  FROM TSROKY
  WHERE
     FK_PACID=pFK_ID AND
     FD_DATA3<=pFD_DATA2 AND
     FD_DATA3>=pFD_DATA1 AND
     (FK_PRYB=3 or FK_PRYB=7);
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  if nTemp>0 then
    RETURN 1;
  else
    RETURN 0;
  end if;
END;
/

SHOW ERRORS;


