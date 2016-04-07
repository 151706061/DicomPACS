DROP TRIGGER ASU.TRESAN_INSERT
/

--
-- TRESAN_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TIB (Table)
--   TRESAN (Table)
--   PKG_DONOR (Package)
--   TSMID (Table)
--   VRES (Table)
--   PKG_REGIST_PACFUNC (Package)
--   INSNAZ (Package)
--   PKG_STATUTIL (Package)
--
CREATE OR REPLACE TRIGGER ASU."TRESAN_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRESAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  VRACHID NUMBER;
   LD_BLOOD_GROUP NUMBER;
   LICH_DANDON_REZUS NUMBER;
   nTmp Number;
   nTmpPacInfo Number;  
Begin
  /*added by A.Nakorjakov 071208 started*/
  if :new.fk_guid is null then
     :new.fk_guid := sys_guid();
  end if;
  /*added by A.Nakorjakov 071208 finished*/
    
  if insnaz.bins then
    return;
  end if;
  insnaz.bins:=true;
--  SELECT SEQ_TRES.NEXTVAL INTO :NEW.FK_ID FROM DUAL;\
  select seq_tkarta.nextval into :new.fk_id from dual;
  insert into vres(FK_ID,FK_SMID,FD_INS,FC_RES,FK_BLOBID,FN_RES,FC_TYPE,FK_VRACHID,FK_PACID,
                   FK_NAZID,FK_PATID,FC_COMENT,FK_SOS,FL_ZAKL,fl_patfirst)
    values (:new.FK_ID, :new.FK_SMID, :new.FD_INS, :new.FC_RES, :new.FK_BLOBID, :new.FN_RES, :new.FC_TYPE, :new.FK_VRACHID, :new.FK_PACID,
            :new.FK_NAZID, :new.fk_patid, :new.FC_COMENT, :new.FK_SOS, :new.fl_zakl, :new.fl_patfirst);


 --Added by A.nakorjakov 20-08-2007
    --Вносим группу крови?
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
        nTmp:=asu.pkg_donor .get_rezus_id(:new.fk_pacid);

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
    --Вносим ТИТР?
    if :new.fk_smid = stat.pkg_statutil.get_smidid('TITR_AMOUNT') then
        begin
        
          nTmpPacInfo := stat.pkg_statutil.GET_SMIDID('LD_TITR');
          select nvl(max(tib.fk_id), -1)
          into ntmp
          from asu.tib
           where tib.fk_pacid = asu.pkg_regist_pacfunc.get_pepl_id(:new.fk_pacid)
             and fk_smeditid = nTmpPacInfo;
             
          --известен ТИТР?
          if (nTmp = -1) then
            insert into asu.tib (fk_pacid,fk_smid,fk_smeditid,fk_vrachid,fd_date) values
              (asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid),nTmpPacInfo,nTmpPacInfo,:new.fk_vrachid,trunc(sysdate));
          else
            update asu.tib set fd_date = trunc(sysdate)
                where fk_id = ntmp;
          end if;
          
        exception when no_data_found then
          null;
        end;
    end if;                    
  insnaz.bins:=false;
  exception
    when others then
      insnaz.bins:=false;
      raise;
End;
/
SHOW ERRORS;


