DROP FUNCTION ASU.GET_PEOPLE_ATTACH_STATUS
/

--
-- GET_PEOPLE_ATTACH_STATUS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPEOPLES_DOPSTATUS (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_PEOPLE_ATTACH_STATUS (aPEPLID in NUMBER) return varchar2 is
  Result varchar2(13);
begin
  select decode((select FL_STATUS
                   from ASU.TPEOPLES_DOPSTATUS 
                  where FK_PEPLID = aPEPLID
                 ), 1, 'Прикреплен', 'Не прикреплен') into Result from DUAL;
  return(Result);
end;
/

SHOW ERRORS;


