DROP FUNCTION ASU.GET_SOTR_DELETEOPTION
/

--
-- GET_SOTR_DELETEOPTION  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_SYNID (Function)
--   TNAZVRACH (View)
--
CREATE OR REPLACE FUNCTION ASU."GET_SOTR_DELETEOPTION" (pfk_sotrid NUMBER)
   RETURN NUMBER
IS
   -- cursor c1 is
   -- v_cnt number;
   v_res   NUMBER (1);
BEGIN
   SELECT DECODE (COUNT (ROWID), 0, 0, 1)
     INTO v_res
     FROM tnazvrach
    WHERE fk_sotrid = pfk_sotrid AND fk_smid = get_synid ('IBRAZD_OPTION_DELETE');

   RETURN v_res;
END;
/

SHOW ERRORS;


