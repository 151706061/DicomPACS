DROP FUNCTION ASU.GET_MAX_FDRUN_COLONOSCOP
/

--
-- GET_MAX_FDRUN_COLONOSCOP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TAMBULANCE (Table)
--   TSMID (Table)
--   GET_ISSLEDID (Function)
--   GET_PEPLID (Function)
--   GET_VIPNAZ (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_max_fdrun_colonoscop(APacID in number,
                                                        ARun   in date)
  return date is
  res date;
--Melnikov 2015.03.03 for ScreeningJournal.exe
--получаем дату последней проведенной колоноскопии
  cursor c is
    with colonoskop as
     (SELECT FK_ID
        FROM ASU.TSMID ts
       WHERE lower(FC_NAME) LIKE 'колоноскопия%'
      connect by prior fk_id = fk_owner
       start with fk_id = asu.get_issledid)
    SELECT Max(FD_RUN) AS FD_RUN_HB
      FROM asu.tnazis tn
     WHERE tn.FK_SMID IN (SELECT FK_ID FROM colonoskop)
       AND tn.FK_NAZSOSID = ASU.GET_VIPNAZ
       AND tn.fk_pacid in
           (select fk_ID
              from asu.tkarta
             where fk_peplid = asu.get_peplid(aPACID)
            union all
            select fk_ID
              from asu.tambulance
             where fk_peplid = asu.get_peplid(aPACID))
       and tn.fd_run >= trunc(arun);
begin
  open c;
  fetch c
    into res;
  if c%notfound then
    res := null;
  end if;
  close c;
  return res;
end;
/

SHOW ERRORS;


