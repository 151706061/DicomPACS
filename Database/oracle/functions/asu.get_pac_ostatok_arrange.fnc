DROP FUNCTION ASU.GET_PAC_OSTATOK_ARRANGE
/

--
-- GET_PAC_OSTATOK_ARRANGE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_OSTATOK_ARRANGE" 
  ( pFK_PACID IN NUMBER,dTemp IN DATE,pFK_ID IN NUMBER)
  RETURN  NUMBER IS
  CURSOR cGet IS SELECT /*+rule*/TRUNC(FD_DATA1),TRUNC(FD_DATA2),FN_KOL FROM TSROKY,
                      (SELECT MAX(FK_ID) FK_MAXID FROM TSROKY WHERE FK_PACID=pFK_PACID AND FK_PRYB IN (2,4) AND FK_ID<pFK_ID)
                 WHERE FK_PACID=pFK_PACID AND FK_ID>=FK_MAXID AND FK_PRYB NOT IN (1,3,7) AND FK_ID<pFK_ID;
  dData1 DATE;
  dData2 DATE;
  nKol NUMBER;
  nTemp NUMBER;
BEGIN
  OPEN cGet;
  nTemp:=0;
  LOOP
    FETCH cGet INTO dData1,dData2,nKol;
    EXIT WHEN cGet%NOTFOUND;
    if TRUNC(dData1) > TRUNC(dTemp) then
      nTemp:=nTemp+nKol;
    elsif TRUNC(dData1) <= TRUNC(dTemp) AND TRUNC(dData2) >= TRUNC(dTemp) then
      nTemp:=nTemp + TRUNC(dData2) - TRUNC(dTemp);
    end if;
  END LOOP;
  CLOSE cGet;
  RETURN nTemp;
END;
/

SHOW ERRORS;


