DROP FUNCTION ASU.GET_SMIDNAME
/

--
-- GET_SMIDNAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SMIDNAME" (pSMID IN NUMBER) return varchar2 is
  Result varchar2(4000);
BEGIN
  FOR C IN (SELECT fc_name FROM tsmid WHERE fk_id=pSMID) LOOP
   result :=C.fc_name;
  END LOOP;
  return(Result);
end get_smidname;
/

SHOW ERRORS;


