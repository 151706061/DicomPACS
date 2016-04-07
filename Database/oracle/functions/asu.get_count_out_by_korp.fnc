DROP FUNCTION ASU.GET_COUNT_OUT_BY_KORP
/

--
-- GET_COUNT_OUT_BY_KORP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   GET_PACKORPID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_OUT_BY_KORP" (pFD_DATAC IN DATE,pFK_KORPID IN NUMBER) -- Created by TimurLan
  RETURN NUMBER
  IS
  Cursor c IS select /* + rule */count(fk_id) from tsroky where
--                   fd_data1=pFD_DATAC and fk_pryb=3;
                   TRUNC(fd_data1)=TRUNC(pFD_DATAC) and fk_pryb=3
                   AND GET_PACKORPID(FK_PACID,pFD_DATAC) = pFK_KORPID;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;
/

SHOW ERRORS;


