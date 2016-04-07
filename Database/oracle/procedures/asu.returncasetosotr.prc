DROP PROCEDURE ASU.RETURNCASETOSOTR
/

--
-- RETURNCASETOSOTR  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBTALON (Table)
--   TEDIT_STATKART (Table)
--   TPERESEL (Table)
--   TCHANGE_LOADED_SLUCH (Table)
--   TKARTA (Table)
--   TEXSLUCH (Table)
--
CREATE OR REPLACE PROCEDURE ASU.ReturnCaseToSotr(pID_ILL IN NUMBER, pSotrId IN NUMBER, pAppSotrID IN NUMBER) IS
  vTalonID Number;
  vKartaID Number;
  vID_ILL Number;
begin
  select Max(FK_ID) into vTalonID from asu.tambtalon where FK_ID = pID_ILL;
  select Max(FK_ID) into vKartaID from asu.tkarta where FK_ID = pID_ILL;

  if vKartaID is null then
    select Max(FK_PACID) into vKartaID from asu.tperesel where FK_ID = pID_ILL;
  end if;

  if vTalonID is not null then
    UPDATE ASU.TAMBTALON SET FN_SOS = 0, FK_CANCELPODSOTRID = pSotrId, FD_PODCANCELED = SYSDATE WHERE FK_ID = pID_ILL;
  else
    if vKartaID is null then
      select Max(FK_PACID) into vKartaID from asu.tperesel where FK_ID = pID_ILL;
    end if;

    INSERT INTO ASU.TEDIT_STATKART (FD_DATE, FL_STATE, FK_SOTRID, FK_PACID) VALUES (SYSDATE, 0, pSotrId, vKartaID);
  end if;

  UPDATE asu.TEXSLUCH t
     SET t.FL_CANCEL = 1
   where t.ID_ILL = pID_ILL;

  select Max(FK_ID) into vID_ILL from asu.tambtalon where FK_ID = pID_ILL;

  if vID_ILL is null then
    select Max(FK_ID) into vID_ILL from asu.tkarta where FK_ID = pID_ILL;
  end if;

  if vID_ILL is null then
    select Max(FK_PACID) into vID_ILL from asu.tperesel where FK_ID = pID_ILL;
  end if;

  INSERT INTO ASU.TCHANGE_LOADED_SLUCH (FK_SLUCH, FK_SOTR) VALUES (vID_ILL, pAppSotrID);
end;
/

SHOW ERRORS;


