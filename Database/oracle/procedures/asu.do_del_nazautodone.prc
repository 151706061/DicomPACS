DROP PROCEDURE ASU.DO_DEL_NAZAUTODONE
/

--
-- DO_DEL_NAZAUTODONE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAUTODONE (Table)
--   TSMID (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_DEL_NAZAUTODONE" (pFK_SMIDID IN BINARY_INTEGER) IS
BEGIN
  DELETE FROM TNAZAUTODONE
   WHERE FK_SMID IN (SELECT FK_ID
                     FROM TSMID
                     START WITH FK_ID = pFK_SMIDID
                     CONNECT BY PRIOR FK_ID = FK_OWNER);
END;
/

SHOW ERRORS;

