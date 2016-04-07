DROP FUNCTION ASU.GET_SOCIAL_STATUS
/

--
-- GET_SOCIAL_STATUS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   PKG_STATUTIL (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_SOCIAL_STATUS" (pfk_pacid IN NUMBER) RETURN VARCHAR2 IS

   -- created by Serg

 CURSOR c
 IS
 SELECT TSMID.FC_NAME
               FROM ASU.TIB,
                    TSMID
               WHERE TSMID.FK_ID = TIB.FK_SMID
-- Commented by Serg 2006.06.23               AND TSMID.FK_OWNER = STAT.PKG_STATUTIL.GET_SMIDID('LD_WORK')
               AND TSMID.FK_OWNER = STAT.PKG_STATUTIL.GET_SMIDID('LD_SOC_POL') -- Added by Serg 2006.06.23
               AND TIB.FK_PACID = pfk_pacid;
 D VARCHAR2(32767);

 BEGIN
  OPEN C;
  FETCH C INTO D;
  CLOSE C;
  RETURN D;
 END;
/

SHOW ERRORS;


