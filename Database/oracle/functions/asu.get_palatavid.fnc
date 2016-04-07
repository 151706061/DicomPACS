DROP FUNCTION ASU.GET_PALATAVID
/

--
-- GET_PALATAVID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PALATAVID" -- Modified by TimurLan
  (pFK_ID IN NUMBER,pFD_DATA IN DATE)
  RETURN  NUMBER IS-- used in rDirector,rFreeRoom,rPacMovement;
  nTemp NUMBER;
  CURSOR cTemp IS SELECT /*+ rule*/FK_VIDID FROM TSRTIPROOM
                  WHERE FK_PALATAID=pFK_ID
                  AND pFD_DATA >= FD_DATA1
                  AND (FD_DATA2 >= pFD_DATA
                       OR FD_DATA2 IS NULL);
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  RETURN nTemp;
END;
/

SHOW ERRORS;


