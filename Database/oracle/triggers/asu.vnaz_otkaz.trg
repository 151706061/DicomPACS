DROP TRIGGER ASU.VNAZ_OTKAZ
/

--
-- VNAZ_OTKAZ  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--   TSMID (Table)
--   GET_VIPNAZ (Function)
--   TUSLVID (Table)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_OTKAZ" 
 AFTER UPDATE or INSERT
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
 nTmp number;
BEGIN
  if :new.FK_NAZSOSID=asu.get_vipnaz then

    --Узнаем, отках от госпитализации или нет
    Select count(1)
      into nTmp
      from ASU.TKarta,
           (select fk_id
              from asu.tsmid
             where fc_synonim = 'GOSPZAKL_OTKAZ'
               and rownum = 1) TOtkaz,
           asu.tuslvid
    where
      tkarta.fk_uslvidid = tuslvid.fk_id
        and
      tuslvid.fk_docid = TOtkaz.fk_id
       and
      Tkarta.FK_ID = :new.FK_PACID;
    --Если это стационарный пациент с отказанной госпитализацией
    --insert into asu.TTEST(fc_name) values(TO_CHAR(:new.FK_ID));
    if nTmp = 1 then
     select NVL(MAX(FK_ID),-1) into nTmp  from ASU.Tambtalon where FK_AMBID = :new.FK_PACID and FN_SOS = 0;
     --insert into asu.TTEST(fc_name) values(TO_CHAR(nTmp));
     --Если у стационарного есть талон, то тогда записываем на него все назначения
     if nTmp > 0 then
      --insert into asu.TTEST(fc_name) values('GO!');
      delete from asu.tambtalon_naz where FK_NAZID = :new.FK_ID;
      insert into asu.tambtalon_naz(fk_talonid,fk_ambid,fk_nazid) values (nTmp, :new.FK_PACID, :new.FK_ID);
     end if;
    end if;
  end if;
 END;
/
SHOW ERRORS;


