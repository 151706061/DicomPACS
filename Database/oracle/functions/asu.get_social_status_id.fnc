DROP FUNCTION ASU.GET_SOCIAL_STATUS_ID
/

--
-- GET_SOCIAL_STATUS_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   PKG_STATUTIL (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_SOCIAL_STATUS_ID" (pfk_pacid IN NUMBER) RETURN NUMBER IS

   -- created by Serg

	 CURSOR c
 IS
 SELECT TSMID.FK_ID
               FROM ASU.TIB,
                    TSMID
               WHERE TSMID.FK_ID = TIB.FK_SMID
               AND TSMID.FK_OWNER = STAT.PKG_STATUTIL.GET_SMIDID('LD_WORK')
               AND TIB.FK_PACID = pfk_pacid;
 D NUMBER;

 BEGIN
  OPEN C;
  FETCH C INTO D;
  CLOSE C;
  RETURN D;
 END;
/

SHOW ERRORS;


