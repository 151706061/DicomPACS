DROP TRIGGER ASU.TRESAN_AFTER_UPDATE
/

--
-- TRESAN_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TIB (Table)
--   TRESAN (Table)
--   PKG_DONOR (Package)
--   TSMID (Table)
--   VRES (Table)
--   PKG_REGIST_PACFUNC (Package)
--   INSNAZ (Package)
--   PKG_STATUTIL (Package)
--
CREATE OR REPLACE TRIGGER ASU."TRESAN_AFTER_UPDATE" 
AFTER  UPDATE  ON ASU.TRESAN REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
DECLARE
   VRACHID   NUMBER;
   LD_BLOOD_GROUP NUMBER;
   LICH_DANDON_REZUS NUMBER;
   nTmp Number;
   nTmpPacInfo Number;
BEGIN
   IF insnaz.bins THEN
      RETURN;
   END IF;
   insnaz.bins := TRUE;
   UPDATE vres
      SET fk_id = :new.fk_id,
          FK_SMID = :new.FK_SMID,
          FD_INS = :new.FD_INS,
          FC_RES = :new.FC_RES,
          FK_BLOBID = :new.FK_BLOBID,
          FN_RES = :new.FN_RES,
          FC_TYPE = :new.FC_TYPE,
          FK_VRACHID = :new.FK_VRACHID,
          FK_PACID = :new.FK_PACID,
          FK_NAZID = :new.FK_NAZID,
          FK_PATID = :new.FK_PATID,
          FC_COMENT = :new.FC_COMENT,
          FK_SOS = :new.FK_SOS,
          FL_ZAKL = :new.FL_ZAKL,
          FL_PATFIRST = :new.FL_PATFIRST
    WHERE fk_id = :old.FK_ID;
   
  --Added by A.nakorjakov 20-08-2007
    --Вносим группу крови?
    if (UPDATING('FK_BLOBID') or (UPDATING('FK_SMID'))) then
      if :new.FK_SMID = stat.pkg_statutil.get_smidid('GR_KROVI_CMB') then
          nTmp:=asu.pkg_donor.get_bloodgr_id(:new.fk_pacid);

          --определение ид группы крови в ветки Пациент - Рег.карта - Личные даные донора - Группа крови
          LD_BLOOD_GROUP := stat.pkg_statutil.get_smidid('LD_BLOOD_GROUP');
          select max(fk_id) into nTmpPacInfo
          from asu.tsmid
          where fc_synonim = (select max(fc_synonim)
              from asu.tsmid where fk_id = :new.fk_blobid)
              and fk_owner = LD_BLOOD_GROUP;

          begin
            --известна группа крови?
            if (nTmp = -1) then
                --вставка данных
                if (nTmpPacInfo is not null) then
                  
                  insert into asu.tib (fk_pacid,fk_smid,fk_smeditid,fk_vrachid) values
                    (asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid),nTmpPacInfo,LD_BLOOD_GROUP,:new.fk_vrachid);
                end if;
            else
                if (nTmp<>nTmpPacInfo) then --update только если вносимое значение отличается от записанного
                    --определение ид группы крови в ветки Пациент - Рег.карта - Личные даные донора - Группа крови
                    update asu.tib set tib.fk_smid = nTmpPacInfo, tib.fk_vrachid = :new.fk_vrachid
                        where tib.fk_pacid = asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid) and tib.fk_smeditid = LD_BLOOD_GROUP;
                end if;
            end if;
          exception when no_data_found then
            null;
          end;
      end if;
      --Вносим группу резус?
      if :new.fk_smid = stat.pkg_statutil.get_smidid('LAB_LICH_DANDON_REZUS_') then
          nTmp:=asu.pkg_donor.get_rezus_id(:new.fk_pacid);

          begin
            --определение ид резуса в ветки Пациент - Рег.карта - Личные даные донора - Резус
            LICH_DANDON_REZUS := ASU.PKG_DONOR.GET_LICHDANDON_REZUS;
            select max(fk_id) into nTmpPacInfo
            from asu.tsmid
            where fc_synonim = (select max(fc_synonim) from asu.tsmid where fk_id = :new.fk_blobid)
                and fk_owner = LICH_DANDON_REZUS;

            --известен резус?
            if (nTmp = -1) then
                if (nTmpPacInfo is not null) then
                  --определение ид группы крови в ветки Пациент - Рег.карта - Личные даные донора - Группа крови
                  insert into asu.tib (fk_pacid,fk_smid,fk_smeditid,fk_vrachid) values
                    (asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid),nTmpPacInfo,LICH_DANDON_REZUS,:new.fk_vrachid);
                end if;
            else
                if (nTmp<>nTmpPacInfo) then --update только если вносимое значение отличается от записанного
                    update asu.tib set tib.fk_smid = nTmpPacInfo, tib.fk_vrachid = :new.fk_vrachid
                        where tib.fk_pacid = asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid) and tib.fk_smeditid = LICH_DANDON_REZUS;
                end if;
            end if;
          exception when no_data_found then
            null;
          end;
      end if;          
    end if;
       
   insnaz.bins := FALSE;
EXCEPTION
   WHEN OTHERS THEN
      insnaz.bins := FALSE;
      RAISE;
END;
/
SHOW ERRORS;


