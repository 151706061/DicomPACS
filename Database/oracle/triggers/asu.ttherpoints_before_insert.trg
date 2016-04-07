DROP TRIGGER ASU.TTHERPOINTS_BEFORE_INSERT
/

--
-- TTHERPOINTS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TTHERPOINTS (Sequence)
--   TVRACHKAB (Table)
--   TVRACHKAB_NAZ (Table)
--   TTHERPOINTS (Table)
--   GET_SYNID (Function)
--   DO_UPDATE_TVRACHKAB_NAZ (Procedure)
--   TKABINET (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTHERPOINTS_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TTHERPOINTS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
kabid NUMBER;
nazvrachid NUMBER;
Begin

  SELECT SEQ_TTHERPOINTS.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  INSERT INTO tkabinet (fc_name) VALUES (:new.fc_name) returning fk_id into kabid;
  Insert into tvrachkab (fk_sotrid,fk_kabinetid) values(:new.fk_vrachid,kabid) returning fk_id into nazvrachid;
  Insert into tvrachkab_naz (fk_sotrkabid, fk_smid) values(nazvrachid,get_synid('KONS_UCH_PEDIATR'));
  DO_UPDATE_TVRACHKAB_NAZ(nazvrachid);
  select nazvrachid into :new.fk_nazvrachid from dual;

End;
/
SHOW ERRORS;


