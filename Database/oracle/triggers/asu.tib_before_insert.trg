DROP TRIGGER ASU.TIB_BEFORE_INSERT
/

--
-- TIB_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TIB (Sequence)
--   TIB (Table)
--   TSMID (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIB_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tib
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  select seq_tib.nextval into :new.fk_id from dual;
  -- Временно для поддержки старых личных данных by Xand
  FOR C IN (SELECT fk_peplid FROM tkarta WHERE fk_id=:new.fk_pacid) LOOP
    EXIT;
   FOR CC IN (SELECT fk_id FROM tsmid WHERE fc_synonim LIKE 'LD%' CONNECT BY PRIOR fk_id=fk_owner START WITH fk_id=:new.fk_smeditid) LOOP
     INSERT INTO tib(fk_pacid,fk_smid,fk_smeditid) VALUES (C.fk_peplid,:new.fk_smid,:new.fk_smeditid);
    EXIT;
   END LOOP;
  END LOOP;
  -------------
  -- Для поддержки старых функций определения социального положения пациента by Nefedov S.M. 23.06.2006
  FOR C IN (select fk_id from tsmid where fc_synonim='LD_SOC_POL' and fk_id = :new.fk_smeditid) LOOP
        update TKARTA
        set fk_coc_polid = :new.fk_smid
        where fk_id = :new.fk_pacid;
  END LOOP;
  -------------

End;
/
SHOW ERRORS;


