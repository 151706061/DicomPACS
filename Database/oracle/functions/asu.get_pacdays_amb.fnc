DROP FUNCTION ASU.GET_PACDAYS_AMB
/

--
-- GET_PACDAYS_AMB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBTALON (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_pacdays_amb(pfk_talonid number) return number is
  ntemp number;

  cursor ctemp is
    select trunc(a.fd_closed) - trunc(a.fd_opened) + 1 as fn_days
      from asu.tambtalon a
     where a.fk_id = pfk_talonid;

begin
  open  ctemp;
  fetch ctemp into ntemp;
  close ctemp;

  return ntemp;
end;
/

SHOW ERRORS;


