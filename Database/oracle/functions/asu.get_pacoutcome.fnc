DROP FUNCTION ASU.GET_PACOUTCOME
/

--
-- GET_PACOUTCOME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACOUTCOME"
  ( pFK_ID IN NUMBER)
  RETURN  DATE IS
  dTemp DATE;
  CURSOR cTemp IS SELECT FD_DATA1 FROM TSROKY,(SELECT MAX(FK_ID) FK_MAXID FROM TSROKY WHERE FK_PACID=pFK_ID) WHERE FK_ID=FK_MAXID AND (FK_PRYB=3 or FK_PRYB=7);
BEGIN
 dTemp:=NULL;
 SELECT MAX(tib.fd_date) INTO dTemp
      FROM asu.tib,
           (SELECT fk_id
              FROM tsmid
             WHERE fc_synonim = 'EPIK_DATE'
            CONNECT BY PRIOR fk_id = fk_owner
             START WITH fc_synonim = 'EPIK_VYPISNOY') sm
     WHERE tib.fk_pacid = pFK_ID
       AND tib.fk_smid = sm.fk_id;

 IF dTemp IS NULL THEN
   OPEN cTemp;
   FETCH cTemp INTO dTemp;
   CLOSE cTemp;
 END IF; 
 RETURN dTemp;
END;
/

SHOW ERRORS;


DROP SYNONYM STAT.GET_PACOUTCOME
/

--
-- GET_PACOUTCOME  (Synonym) 
--
--  Dependencies: 
--   GET_PACOUTCOME (Function)
--
CREATE SYNONYM STAT.GET_PACOUTCOME FOR ASU.GET_PACOUTCOME
/


GRANT EXECUTE ON ASU.GET_PACOUTCOME TO EXCHANGE
/

GRANT EXECUTE ON ASU.GET_PACOUTCOME TO EXCH43
/

