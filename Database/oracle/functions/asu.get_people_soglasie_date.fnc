DROP FUNCTION ASU.GET_PEOPLE_SOGLASIE_DATE
/

--
-- GET_PEOPLE_SOGLASIE_DATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPEOPLES_DOPSTATUS (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_PEOPLE_SOGLASIE_DATE (aPEPLID in NUMBER) return date is
  Result date;
begin
  select FD_SOGLDATE into Result
  from (select decode(FL_SOGLASIE, 1, FD_SOGLDATE, NULL) AS FD_SOGLDATE
          from ASU.TPEOPLES_DOPSTATUS
         where FK_PEPLID = aPEPLID
        );

  return(Result);
end;
/

SHOW ERRORS;


