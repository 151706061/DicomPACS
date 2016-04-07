DROP FUNCTION ASU.GET_NEXT_PRIEM
/

--
-- GET_NEXT_PRIEM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   GET_SYNID (Function)
--   TTECHBOLEZNI (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NEXT_PRIEM" 
  ( pFK_PACID IN NUMBER)
  RETURN  DATE IS
  CURSOR c IS SELECT /*+rule*/fd_date from tib,(select get_synid('NEXT_TECHBOLEZNI') FK_SYNID from dual),
                                      (SELECT MAX(FK_TIBID)FK_TIBID FROM TTECHBOLEZNI WHERE FK_PACID=pFK_PACID)
                    where fk_smid=FK_SYNID AND FK_PACID=FK_TIBID;
  i DATE;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END; -- Function GET_NEXT_PRIEM
/

SHOW ERRORS;


