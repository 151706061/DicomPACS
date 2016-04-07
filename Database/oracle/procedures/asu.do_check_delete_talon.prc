DROP PROCEDURE ASU.DO_CHECK_DELETE_TALON
/

--
-- DO_CHECK_DELETE_TALON  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_CHECK_DELETE_TALON" (
                                                       pFK_NAZID in number
                                                      )
is

 pFK_TALONID  number := -1;
 pFK_PACID  number := -1;
 pCount number;
 pFN_SOS number := -1;

 cursor Get_Talonid is
  select FK_TALONID, FK_AMBID from asu.TAmbtalon_naz where FK_NAZID = pFK_NAZID;

 cursor IsTalonNevip is
   Select FN_SOS from ASU.TAMBTALON where FK_ID = pFK_TALONID;
begin

 --”знаем талон и паца по назначению
 OPEN Get_Talonid;
 FETCH Get_Talonid into pFK_TALONID,pFK_PACID;
 CLOSE Get_Talonid;

 --≈сли есть св€зка, тогда
 if (pFK_TALONID > 0) and (pFK_PACID>0) then
  --удал€ем св€зку с талоном
  DELETE from ASU.Tambtalon_Naz where FK_NAZID = pFK_NAZID and FK_TALONID = pFK_TALONID;
  --ѕровер€ем, сколько осталось назначений в талоне
  select count(1) into pCount from ASU.Tambtalon_Naz where  FK_TALONID = pFK_TALONID;


  if pCount=0 then

   open IsTalonNevip;
   fetch IsTalonNevip into pFN_SOS;
   close IsTalonNevip;

   if pFN_SOS=0 then
    DELETE from ASU.TAMBTALON where FK_ID = pFK_TALONID;
   end if;
  end if;
 end if;
end;
/

SHOW ERRORS;


