DROP FUNCTION ASU.GET_SOTR_POSTNAME_SOKB
/

--
-- GET_SOTR_POSTNAME_SOKB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_SOTR_POSTNAME (Function)
--   TREPLYTABLE (Table)
--   TS_SPRAV (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_SOTR_POSTNAME_SOKB (pfk_sotrid NUMBER, pfk_SMID NUMBER DEFAULT -1)
   RETURN VARCHAR2
IS
   Res    asu.ts_sprav.fc_name%TYPE;
   vFK_ID NUMBER;
BEGIN
   SELECT MAX(FC_REPLYID)
   INTO vFK_ID
   FROM asu.treplytable
   WHERE FC_ASK = 'SOTR_TSMID'
     and FC_ASKFIELD = 'FC_KEY'
     and FC_ASKID = TO_CHAR(pfk_sotrid)||'_'||TO_CHAR(pfk_SMID)
     and FC_REPLY = 'TS_SPRAV_T'
     and FC_REPLYFIELD = 'FK_ID';

  SELECT MAX(FC_NAME) INTO Res FROM ASU.ts_sprav WHERE FK_ID = vFK_ID;

   IF NVL(TRIM(Res), '---') = '---'  --(TRIM(Res) = '') OR (TRIM(Res) IS NULL)
   THEN
      BEGIN
        Res := LOGIN.GET_SOTR_POSTNAME(pfk_sotrid);
      END;
   END IF;

   RETURN(Res);
END GET_SOTR_POSTNAME_SOKB;
/

SHOW ERRORS;


