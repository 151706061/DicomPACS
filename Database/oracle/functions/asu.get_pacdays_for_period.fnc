DROP FUNCTION ASU.GET_PACDAYS_FOR_PERIOD
/

--
-- GET_PACDAYS_FOR_PERIOD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACDAYS_FOR_PERIOD" 
  ( pFK_ID IN NUMBER,pFD_DATA1 in DATE,pFD_DATA2 IN DATE)
  RETURN  NUMBER IS
  nTemp NUMBER;
  dData1 DATE;
  dData2 DATE;
  nSum NUMBER;
  CURSOR cTemp IS SELECT /*+ rule*/FD_DATA1,FD_DATA3 FROM TSROKY WHERE FK_PACID=pFK_ID AND FK_PRYB NOT in (1,3,7) ORDER BY FD_DATA1;
BEGIN
  OPEN cTemp;
  nSum:=0;
  LOOP
  FETCH cTemp INTO dData1,dData2;
    EXIT WHEN cTemp%NOTFOUND;
    IF dData1>=pFD_DATA1 AND dData2<=pFD_DATA2 then
      nSum:=nSum+(dData2-dData1+1);
--      raise_application_error(-20001,'1 '||dData2);
    elsif dData1<pFD_DATA1 AND dData2<=pFD_DATA2 AND dData2>= pFD_DATA1 then
      nSum:=nSum+(dData2-pFD_DATA1+1);
--      raise_application_error(-20001,'2 '||dData2);
    elsif dData1>=pFD_DATA1 AND dData2>pFD_DATA2 AND dData1<=pFD_DATA2 then
      nSum:=nSum+(pFD_DATA2-dData1+1);
--      raise_application_error(-20001,'3 '||dData2);
    elsif dData1<pFD_DATA1 AND dData2>pFD_DATA2 then
      nSum:=nSum+(pFD_DATA2-pFD_DATA1+1);
--      raise_application_error(-20001,'4 '||dData2);
    end if;
  END LOOP;
  CLOSE cTemp;
  RETURN nSum;
END;
/

SHOW ERRORS;


