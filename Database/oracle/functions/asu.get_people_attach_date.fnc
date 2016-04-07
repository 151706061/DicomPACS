DROP FUNCTION ASU.GET_PEOPLE_ATTACH_DATE
/

--
-- GET_PEOPLE_ATTACH_DATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPEOPLES_DOPSTATUS (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_PEOPLE_ATTACH_DATE (aPEPLID in NUMBER) return date is
  Result date;
begin
  select FD_DATE into Result
  from (select decode(FL_STATUS, 1, FD_DATE, NULL) AS FD_DATE
          from ASU.TPEOPLES_DOPSTATUS
         where FK_PEPLID = aPEPLID 
        );

  return(Result);
end;
/

SHOW ERRORS;


