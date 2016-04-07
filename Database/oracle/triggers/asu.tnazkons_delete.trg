DROP TRIGGER ASU.TNAZKONS_DELETE
/

--
-- TNAZKONS_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZKONS (Table)
--   TIB (Table)
--   TLASTNAZS (Table)
--   TRESIS (Table)
--   TRESKONS (Table)
--   VRES (Table)
--   DO_CHECK_DELETE_TALON (Procedure)
--   GET_FIZIOTERAPEVT_KONS (Function)
--   GET_VIPNAZ (Function)
--   INSNAZ (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZKONS_DELETE" 
BEFORE  DELETE  ON asu.TNAZKONS
REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
declare
 LastKonsID number;
 LastDate date;

Begin
 delete from tib where fk_pacid=:old.fk_id;
 delete from tresis where fk_nazid=:old.fk_id;
 if insnaz.bins then
   return;
 end if;
 insnaz.bins:=true;
 asu.DO_CHECK_DELETE_TALON(:old.FK_ID);
 delete from vnaz where fk_id=:old.fk_id;
 delete from VRES where FK_NAZID = :old.FK_ID;
 delete from TresKons where FK_NAZID = :old.FK_ID;
 
 if :old.FK_NAZSOSID = ASU.GET_VIPNAZ then
  if :old.FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS" then
   select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :old.FK_PACID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS" and FK_NAZID <> :old.FK_ID; 
   if LastKonsID > 0 then --Если есть выполненные консультации помимо текущей, ищем максималоное
    select FD_INS,FK_NAZID into LastDate, LastKonsID from (
     select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
      where  FK_PACID = :old.FK_PACID and FK_NAZID <> :old.FK_ID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
      --Апдейтим значения 
        update ASU.Tlastnazs SET FK_FIZIOKONSID = LastKonsID, FD_FIZIOKONSINSDATE = LastDate where FK_PACID = :old.FK_PACID;
   else
        update ASU.Tlastnazs SET FK_FIZIOKONSID = NULL, FD_FIZIOKONSINSDATE = NULL where FK_PACID = :old.FK_PACID;
   end if; 
  else
   select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :old.FK_PACID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS" and FK_NAZID <> :old.FK_ID; 
   if LastKonsID > 0 then --Если есть выполненные консультации помимо текущей, ищем максималоное
    select FD_INS,FK_NAZID into LastDate, LastKonsID from (
     select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
      where  FK_PACID = :old.FK_PACID and FK_NAZID <> :old.FK_ID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
      --Апдейтим значения 
        update ASU.Tlastnazs SET FK_KONSID = LastKonsID, FD_KONSINSDATE = LastDate where FK_PACID = :old.FK_PACID;
   else
        update ASU.Tlastnazs SET FK_KONSID = NULL, FD_KONSINSDATE = NULL where FK_PACID = :old.FK_PACID;
   end if; 
  end if;
 end if; 
 
 
 
 insnaz.bins:=false;

 exception
    when others then
        insnaz.bins:=false;
        raise;
End;
/
SHOW ERRORS;


