DROP FUNCTION ASU.GET_PALATAMESTADATEVID
/

--
-- GET_PALATAMESTADATEVID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PALATAMESTADATEVID" -- Created by TimurLan
  (pFK_ID IN NUMBER,pFD_DATA IN DATE,pFK_VIDID IN NUMBER)
  RETURN  NUMBER IS
  nTemp NUMBER;
  CURSOR cTemp1 IS SELECT /*+ rule*/FN_MESTA FROM TSRTIPROOM
                  WHERE FK_PALATAID = pFK_ID
                  AND FK_VIDID = pFK_VIDID
                  AND pFD_DATA >= FD_DATA1
                  AND (FD_DATA2 >= pFD_DATA
                       OR FD_DATA2 IS NULL);
  CURSOR cTemp2 IS SELECT /*+ rule*/FN_MESTA FROM TSRTIPROOM
                  WHERE FK_PALATAID = pFK_ID
                  AND FK_VIDID > 0
                  AND pFD_DATA >= FD_DATA1
                  AND (FD_DATA2 >= pFD_DATA
                       OR FD_DATA2 IS NULL);
BEGIN
  if pFK_VIDID > 0 then
    OPEN cTemp1;
    FETCH cTemp1 INTO nTemp;
    CLOSE cTemp1;
  else
    OPEN cTemp2;
    FETCH cTemp2 INTO nTemp;
    CLOSE cTemp2;
  end if;
  RETURN NVL(nTemp,0);
END;
/

SHOW ERRORS;


