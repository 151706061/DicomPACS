DROP FUNCTION ASU.GET_PALATA_SEX_CODE
/

--
-- GET_PALATA_SEX_CODE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPERESEL (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PALATA_SEX_CODE" (pFK_ID IN NUMBER,pFD_DATA IN DATE) RETURN NUMBER
  IS-- used in rDirector;
 CURSOR cTemp(pID NUMBER,pDATA DATE) IS
        SELECT /*+rule*/FP_SEX
          FROM TKARTA,TPERESEL
         where TPERESEL.FK_PACID=TKARTA.FK_ID
           AND pDATA BETWEEN FD_DATA1 AND FD_DATA2
           AND TPERESEL.FK_PALATAID=pID;
  nTemp  NUMBER;
  nSex NUMBER;
BEGIN
  nSex:=-1;
  FOR p IN cTemp(pFK_ID,pFD_DATA) LOOP
    nTemp:=p.FP_SEX;
    if nTemp=0 AND nSex=-1 then
      nSex:=0;
    elsif nTemp=1 AND nSex=-1 then
      nSex:=1;
    elsif nTemp <> nSex AND nSex <> -1 then
      nSex:=2;
      EXIT;
    end if;
  END LOOP;
  RETURN nTemp;
END;
/

SHOW ERRORS;


