DROP FUNCTION ASU.GET_PEOPLE_SOGLASIE_STATUS
/

--
-- GET_PEOPLE_SOGLASIE_STATUS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPEOPLES_DOPSTATUS (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_PEOPLE_SOGLASIE_STATUS (aPEPLID in number) return number is
  Result number(1);
begin
  select FL_SOGLASIE into Result
    from ASU.TPEOPLES_DOPSTATUS 
   where FK_PEPLID = aPEPLID;
   
  return(Result);
end;
/

SHOW ERRORS;


