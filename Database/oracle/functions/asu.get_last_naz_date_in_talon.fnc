DROP FUNCTION ASU.GET_LAST_NAZ_DATE_IN_TALON
/

--
-- GET_LAST_NAZ_DATE_IN_TALON  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBTALON_NAZ (Table)
--   GET_VIPNAZ (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_LAST_NAZ_DATE_IN_TALON(pTalonID in number)
  RETURN date IS

  cursor cDate is select * from (select fd_run
                    from asu.vnaz t1, asu.tambtalon_naz t2
                   where t2.fk_talonid = pTalonID
                     and t2.fk_nazid = t1.fk_id
                     and t1.fk_nazsosid = asu.get_vipnaz
                  order by fd_run desc)
                  where rownum = 1;

  dDate date;

BEGIN
  open cDate;
  fetch cDate into dDate;
  close cDate;
  RETURN dDate;
END;
/

SHOW ERRORS;


