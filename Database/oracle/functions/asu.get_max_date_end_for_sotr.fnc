DROP FUNCTION ASU.GET_MAX_DATE_END_FOR_SOTR
/

--
-- GET_MAX_DATE_END_FOR_SOTR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_MAX_DATE_END_FOR_SOTR(pPEPLID NUMBER)
  RETURN date IS
  dRes date;
  cnt number;
  cursor c1 is select count(*) from login.tsotr where fk_peplid = pPEPLID and fd_end is null;
  cursor c2 is select max(fd_end) from login.tsotr where fk_peplid = pPEPLID;
BEGIN
  open c1;
  fetch c1 into cnt;
  close c1;
  if cnt > 0 then
    RETURN NULL;
  else
    open c2;
    fetch c2 into dRes;
    close c2;
    RETURN dRes;
  end if;
END;
/

SHOW ERRORS;


