DROP TRIGGER ASU.TNAZMARK_UPD_FK_NAZID
/

--
-- TNAZMARK_UPD_FK_NAZID  (Trigger) 
--
--  Dependencies: 
--   TNAZMARK (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZMARK_UPD_FK_NAZID" 
 BEFORE 
 UPDATE OF FK_NAZID
 ON ASU.TNAZMARK  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  -- проверка на выполнение назначения
-- закоментил Воронов О.А. 09.02.2009 - устранение текщей ошибки - позже выяснить как сделать иначе
--  select count(1), MAX(nm.fk_sotrid) into nm_count, SOTR_ID from asu.tnazmark nm where nm.fk_nazid =:NEW.fk_nazid and TRUNC(nm.fd_post) = TRUNC(:NEW.fd_post) and NVL(nm.fk_nazmedlechid,-1) = NVL(:NEW.fk_nazmedlechid,-1);
--  if nm_count > 0 then
--    RAISE_APPLICATION_ERROR(-20011, 'Списание уже было произведено сотрудником: '||CHR(13)||CHR(10)||LOGIN.GET_SOTRNAME(SOTR_ID)||' ('||login.get_sotr_otdelname(SOTR_ID)||')');
--  end if;
 null;
END;
/
SHOW ERRORS;


