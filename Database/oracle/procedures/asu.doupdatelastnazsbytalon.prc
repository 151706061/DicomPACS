DROP PROCEDURE ASU.DOUPDATELASTNAZSBYTALON
/

--
-- DOUPDATELASTNAZSBYTALON  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLASTNAZS (Table)
--   TRESKONS (Table)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU.DoUpdateLastNazsByTalon(pFK_PACID in number) is

 pFD_INS   date := NULL;
  pFK_NAZID number := NULL;

  pLastNazsDate date := NULL;
  pExists       number := 0;

  cursor GetLastValues is
    select t.FK_NAZID, t.FD_INS
      from (Select TResKons.FK_NAZID,
                   TResKons.FD_INS,
                   ROW_NUMBER() over(partition by TResKons.FK_PACID order by TResKons.FD_INS DESC) as RN
              from ASu.TResKons, asu.TAmbtalon_naz, asu.TAmbtalon
             where TReskons.FK_NAZID = TAmbtalon_naz.FK_NAZID
               and TAmbtalon_naz.FK_TALONID = TAMBTALON.FK_ID
               and TAmbtalon.FN_SOS = 0
               and TAmbtalon.FK_AMBID = pFK_PACID) T
     where t.rn = 1;

  cursor GetNowValues is
    select count(1), max(FD_KONSINSDATE)
      from ASU.Tlastnazs

     where FK_PACID = pFK_PACID;
begin

  open GetLastValues;
  fetch GetLastValues
    into pFK_NAZID, pFD_INS;
  close GetLastValues;

  open GetNowValues;
  fetch GetNowValues
    into pExists, pLastNazsDate;
  close GetNowValues;

  --Если запись с пациентом есть, то тогда апдейт
  if pExists = 1 then
    UPDATE asu.TLastNazs
       set fk_konsid = pFK_NAZID, fd_konsinsdate = pFD_INS
     where FK_PACID = pFK_PACID;
  else
    -- Если записи еще нет, то тогда нужно вставить новую запись
    insert into asu.tlastnazs
      (fk_pacid, fk_konsid, fd_konsinsdate)
    values
      (pFK_PACID, pFK_NAZID, pFD_INS);
  end if;
end;
/

SHOW ERRORS;


