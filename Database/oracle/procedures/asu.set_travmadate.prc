DROP PROCEDURE ASU.SET_TRAVMADATE
/

--
-- SET_TRAVMADATE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   GET_TRAVMADATE (Function)
--
CREATE OR REPLACE PROCEDURE ASU."SET_TRAVMADATE" (pTalonID IN NUMBER, pdate IN DATE) IS
-- Хєшьют Т.Р. 13.05.2009
  p DATE;
  pFK_SMID number;
begin
  SELECT NVL(MAX(FK_ID),0) into pFK_SMID FROM TSMID T WHERE T.FC_SYNONIM = 'DATA_TRAVM';

  if pFK_SMID > 0 then
    p := ASU.GET_TRAVMADATE(pTalonID);
    if p is null then
      INSERT INTO TIB (FK_SMID, FK_PACID, FD_DATE) values (pFK_SMID, pTalonID, pdate);
    else
      UPDATE TIB set FD_DATE = pdate where FK_SMID = pFK_SMID and FK_PACID = pTalonID;
    end if;
  end if;
end;
/

SHOW ERRORS;


