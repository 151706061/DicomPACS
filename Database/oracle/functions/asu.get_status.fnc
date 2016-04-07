DROP FUNCTION ASU.GET_STATUS
/

--
-- GET_STATUS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZOPER_STATUS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_STATUS" (pSTATID IN NUMBER) return varchar2 is
  Result varchar2(4000);
BEGIN
  FOR C IN (SELECT fc_name FROM ASU.TNAZOPER_STATUS WHERE fk_id = pSTATID) LOOP
   result := C.fc_name;
  END LOOP;
  return(Result);
end GET_STATUS;
/

SHOW ERRORS;


