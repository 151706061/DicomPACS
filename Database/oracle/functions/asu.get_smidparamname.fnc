DROP FUNCTION ASU.GET_SMIDPARAMNAME
/

--
-- GET_SMIDPARAMNAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_SMIDOWNER (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_SMIDPARAMNAME" (pSMID IN NUMBER) return varchar2 is
  Result varchar2(4000);
  ResType varchar2(15);
BEGIN
  FOR C IN (SELECT fc_name FROM tsmid WHERE fk_id=pSMID) LOOP
   result :=C.fc_name;
  END LOOP;
  FOR C IN (SELECT fc_type FROM tsmid WHERE fk_id=GET_SMIDOWNER(pSMID)) LOOP
   ResType :=C.fc_type;
  END LOOP;
  IF ResType = 'FOLDER' THEN
    result := '    ' || result;
  END IF;
  return(Result);
end GET_SMIDPARAMNAME;
/

SHOW ERRORS;


