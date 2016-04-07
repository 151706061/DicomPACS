DROP FUNCTION ASU.IS_FILLED
/

--
-- IS_FILLED  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   GET_OWNER_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU."IS_FILLED" 
  ( pFK_SMID IN NUMBER,pFK_PACID IN NUMBER)
  RETURN  INTEGER IS
--
-- Purpose: ѕроверка заполнено ли в истории болезни?
--
CURSOR c(pID NUMBER,pPacID NUMBER) IS select /*+rule*/fk_pacid from tib where get_OWNER_FROM_SMID(FK_SMEDITID)=pID and fk_pacid=pPacID;
i NUMBER;
BEGIN
  OPEN c(pFK_SMID,pFK_PACID);
  FETCH c INTO i;
  if c%NOTFOUND THEN
    i:=0;
  ELSE
    i:=1;
  END IF;
  CLOSE c;
  RETURN i;
END; -- Function IS_FILLED
/

SHOW ERRORS;


