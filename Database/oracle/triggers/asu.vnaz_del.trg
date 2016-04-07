DROP TRIGGER ASU.VNAZ_DEL
/

--
-- VNAZ_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZAN (Table)
--   TNAZIS (Table)
--   TNAZKONS (Table)
--   TNAZLECH (Table)
--   TLASTNAZS (Table)
--   TRESAN (Table)
--   TRESIS (Table)
--   TRESKONS (Table)
--   TRESLECH (Table)
--   TRICHVIEWDATA (Table)
--   TPACLST (Table)
--   TAMBTALON_NAZ (Table)
--   TSMID (Table)
--   TCLOBS (Table)
--   VNAZ_GUID (Table)
--   VRES (Table)
--   GET_FIZIOTERAPEVT_KONS (Function)
--   GET_KONSID (Function)
--   GET_NAZ_PROCESS (Function)
--   GET_VIPNAZ (Function)
--   INSNAZ (Package)
--   TTECHBOLEZNI (Table)
--   TKONSULT_USLUG (Table)
--   VNAZ (Table)
--   TPRIEMNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_DEL" 
 BEFORE 
 DELETE
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
LastKonsID number;
LastDate Date;
nidnew number;
--LastNazCount number;
CURSOR c1
  IS
    SELECT fk_id
      FROM tsmid
     START WITH fk_id = :old.fk_smid
    CONNECT BY PRIOR fk_owner = fk_id
     ORDER BY ROWNUM DESC;
BEGIN
  delete from asu.tkonsult_uslug where fk_nazid = :old.fk_id; -- Prihodko N. 08.07.2010
   IF INSNAZ.BINS THEN
     RETURN;
   END IF;
   INSNAZ.BINS:=TRUE;
   
   DELETE FROM asu.TNAZIS   WHERE FK_ID = :OLD.FK_ID;
   DELETE FROM asu.TNAZKONS WHERE FK_ID = :OLD.FK_ID;
   DELETE FROM asu.TNAZLECH WHERE FK_ID = :OLD.FK_ID;
   DELETE FROM asu.TNAZAN   WHERE FK_ID = :OLD.FK_ID;
   DELETE FROM asu.TTECHBOLEZNI WHERE FK_STIM = :OLD.FK_ID; --BY TIMURLAN
   DELETE FROM asu.TPRIEMNAZ WHERE FK_NAZID=:OLD.FK_ID AND FK_PARENTID=:OLD.FK_NAZOWNER;
   DELETE FROM asu.TRICHVIEWDATA WHERE FK_PACID =:OLD.FK_ID;
   DELETE FROM asu.VRES WHERE FK_NAZID =:OLD.FK_ID;
   
   /*из VRES удалают, но из Tres'ов не удаляется из-за флага INSNAZ.BINS*/
   DELETE FROM TRESIS   WHERE FK_NAZID = :OLD.FK_ID;
   DELETE FROM TRESKONS WHERE FK_NAZID = :OLD.FK_ID;
   DELETE FROM TRESLECH WHERE FK_NAZID = :OLD.FK_ID;
   DELETE FROM TRESAN   WHERE FK_NAZID = :OLD.FK_ID;
   /**/
   
   
   DELETE FROM asu.TPACLST WHERE NAZID =:OLD.FK_ID;
   delete from asu.TAMBTALON_NAZ WHERE FK_NAZID=:OLD.FK_ID;
   DELETE FROM asu.VNAZ_GUID WHERE FK_NAZID = :OLD.FK_ID; -- Prihodko N. 03.05.2012

   DELETE FROM asu.TCLOBS WHERE TCLOBS.FK_ID = :OLD.FK_OBOSNOVID;
   DELETE FROM asu.TCLOBS WHERE TCLOBS.FK_ID = :OLD.FK_DIFFERID;
   DELETE FROM asu.TCLOBS WHERE TCLOBS.FK_ID = :OLD.FK_SINDROMID;
   
   
   -- данный код для кардиоцентра.ю отлаживалась на хантах за не имением бызы
   if  (:old.fk_nazsosid = asu.Get_Vipnaz) or (:old.fk_nazsosid = asu.Get_NAZ_process)  then
    OPEN c1;
    FETCH c1 INTO nidnew;
    CLOSE c1;    
    
    if nidnew = get_konsid THEN    
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
    
    /*if nidnew = get_procid THEN     
     select Count(1)
         into LastKonsID
         from ASU.Treslech,
              (Select FK_ID
                 from ASU.TSMID
                where FL_SHOWANAL = 1
               connect by prior FK_ID = FK_OWNER
                start with FC_SYNONIM = 'PROC_FIZTER') TSM
         where FK_PACID = :old.FK_PACID 
          and TSM.FK_ID = TresLEch.FK_SMID
          and FK_NAZID <> :old.FK_ID;  
          
     if LastKonsID > 0 then 
          select FD_INS, FK_NAZID
            into LastDate, LastKonsID
            from (select FK_NAZID,
                         FD_INS,
                         ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN
                    from asu.TResLech,
                         (Select FK_ID
                            from ASU.TSMID
                           where FL_SHOWANAL = 1
                          connect by prior FK_ID = FK_OWNER
                           start with FC_SYNONIM = 'PROC_FIZTER') TSM
                   where TSM.FK_ID = TresLEch.FK_SMID
                     and FK_PACID = :old.FK_PACID
                     and FK_NAZID <> :old.FK_ID 
                  )
           where RN = 1;
          update ASU.Tlastnazs SET FK_FIZIOPROCID = LastKonsID, FD_FIZIOPROCINSDATE = LastDate where FK_PACID = :old.FK_PACID;       
     else
          update ASU.Tlastnazs SET FK_FIZIOPROCID = NULL, FD_FIZIOPROCINSDATE = NULL where FK_PACID = :old.FK_PACID;
     end if;              
    end if;  */  
   end if;
   
    insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
END;
/
SHOW ERRORS;


