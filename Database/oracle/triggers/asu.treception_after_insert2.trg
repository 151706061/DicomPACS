DROP TRIGGER ASU.TRECEPTION_AFTER_INSERT2
/

--
-- TRECEPTION_AFTER_INSERT2  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESLECH (Table)
--   TNAZN (Table)
--   TNAZN_LINK_VNAZ (Table)
--   TRECEPTION (Table)
--   PKG_NAZN (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_AFTER_INSERT2" 
 AFTER
 INSERT
 ON asu.treception
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  v_VNAZ_ID integer;
--  v_TYPE varchar(100);
  v_LOINC_CODE integer;
  v_I integer;
  v_TNAZN_SMID integer;
  v_VRACH_ID integer;
  v_Pac_ID integer;
BEGIN
  -- Синхронизация со структурой TResLECH
  -- Сначала  код соответсующзего VNAZ
  -- Возможна ошибка данных не найдено!
  SELECT count(*) INTO v_VNAZ_ID
    FROM TNAZN_LINK_VNAZ LV
   WHERE  LV.fk_tnazn=:NEW.FK_NAZN;
  IF v_VNAZ_ID=0 THEN
    RETURN;
  END IF;
  SELECT LV.FK_VNAZ INTO v_VNAZ_ID
    FROM TNAZN_LINK_VNAZ LV
   WHERE LV.fk_tnazn=:NEW.FK_NAZN;
  SELECT N.fk_smid,N.fk_creator
    INTO v_TNAZN_SMID, v_VRACH_ID
    FROM TNAZN N
   WHERE N.fk_id=:NEW.FK_NAZN;
   -- еще нам нужен хитрый PAC_ID который DOC_ID
  SELECT N.FK_PACID   INTO v_PAC_ID
    FROM VNAZ N
   WHERE N.fk_id=v_VNAZ_ID;
  INSERT INTO treslech
            (fk_smid, fk_pacid, fk_nazid, fk_sos, fd_ins   )
     VALUES (v_tnazn_smid, v_pac_id, v_vnaz_id, 2, SYSDATE );
  PKG_NAZN.add_recept_to_list(:NEW.fk_id);
END;
/
SHOW ERRORS;


