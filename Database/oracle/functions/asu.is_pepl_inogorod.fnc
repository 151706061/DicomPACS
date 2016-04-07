DROP FUNCTION ASU.IS_PEPL_INOGOROD
/

--
-- IS_PEPL_INOGOROD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   PKG_STATUTIL (Package)
--
CREATE OR REPLACE FUNCTION ASU."IS_PEPL_INOGOROD" (pPeplID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 20032008
  Res NUMBER;
BEGIN
  SELECT COUNT(1)
    INTO Res
    FROM asu.tib,
         (SELECT fk_id
            FROM asu.tsmid
           WHERE fc_synonim IN ('MZ_RAION', 'MZ_SUBJECT', 'MZ_RF')) sm
   WHERE fk_pacid = pPeplID
     AND fk_smeditid = stat.pkg_statutil.get_smidid('PD_MZ')
     AND fk_smid = sm.fk_id;
  IF Res > 0
  THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END;
/

SHOW ERRORS;


