DROP TRIGGER ASU.TRESKONS_INSERT
/

--
-- TRESKONS_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TRESKONS (Table)
--   VRES (Table)
--   INSNAZ (Package)
--
CREATE OR REPLACE TRIGGER ASU."TRESKONS_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRESKONS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  if insnaz.bins then
    return;
  end if;
  insnaz.bins:=true;
--  SELECT SEQ_TRES.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  select seq_tkarta.nextval into :new.fk_id from dual;
  insert into vres(FK_ID,FK_SMID,FD_INS,FC_RES,FK_BLOBID,FN_RES,FC_TYPE,FK_VRACHID,FK_PACID,
                   FK_NAZID,FK_PATID,FC_COMENT,FK_SOS,FL_ZAKL,fl_patfirst)
    values (:new.FK_ID, :new.FK_SMID, :new.FD_INS, :new.FC_RES, :new.FK_BLOBID, :new.FN_RES, :new.FC_TYPE, :new.FK_VRACHID, :new.FK_PACID,
            :new.FK_NAZID, :new.fk_patid, :new.FC_COMENT, :new.FK_SOS, null, :new.fl_patfirst);
  insnaz.bins:=false;
  exception
    when others then
      insnaz.bins:=false;
      raise;
End;
/
SHOW ERRORS;


