DROP FUNCTION ASU.GET_CLINICAL_OUTCOME
/

--
-- GET_CLINICAL_OUTCOME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   PKG_STATUTIL (Package)
--   TEPIKRIZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_CLINICAL_OUTCOME" (pfk_pacid IN NUMBER) RETURN VARCHAR2 IS

   -- created by Serg

 CURSOR c
 IS
 SELECT FC_NAME
        FROM TSMID
        WHERE FK_ID=(SELECT MAX(fp_reslech)
                            FROM tepikriz
                            WHERE fk_pacid = pfk_pacid
                            AND (fp_type = STAT.PKG_STATUTIL.GET_SMIDID('EPIK_VYPISNOY')
                            OR fp_type = STAT.PKG_STATUTIL.GET_SMIDID('EPIK_POSMERT')));
  D VARCHAR2(32767);

 BEGIN
  OPEN C;
  FETCH C INTO D;
  CLOSE C;
  RETURN D;
 END;
/

SHOW ERRORS;


