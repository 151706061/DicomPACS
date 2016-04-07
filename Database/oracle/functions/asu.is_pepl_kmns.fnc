DROP FUNCTION ASU.IS_PEPL_KMNS
/

--
-- IS_PEPL_KMNS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PEPL_KMNS" (pPeplID NUMBER) RETURN NUMBER IS
  --created by Spasskiy S.N. 03122008
  Res NUMBER;
BEGIN
  SELECT COUNT(1)
    INTO Res
    FROM asu.tib,
         (SELECT fk_id
            FROM asu.tsmid
           WHERE fc_synonim IN ('NAROD_HANT', 'NAROD_MANSI', 'NAROD_OTHER')) sm
   WHERE fk_pacid = pPeplID
     AND fk_smid = sm.fk_id;
  IF Res > 0 THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END;
/

SHOW ERRORS;


