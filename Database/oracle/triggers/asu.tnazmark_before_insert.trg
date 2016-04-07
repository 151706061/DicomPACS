DROP TRIGGER ASU.TNAZMARK_BEFORE_INSERT
/

--
-- TNAZMARK_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   GET_SOTRNAME (Function)
--   GET_SOTR_OTDELNAME (Function)
--   SEQ_TNAZMARK (Sequence)
--   TNAZMARK (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZMARK_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tnazmark
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  nm_count NUMBER;
  SOTR_ID NUMBER;
BEGIN
  IF :NEW.FD_POST IS NULL THEN
    :NEW.FD_POST := SYSDATE;
  END IF;

  -- проверка на выполнение назначения
  select count(1), MAX(nm.fk_sotrid) into nm_count, SOTR_ID from asu.tnazmark nm where nm.fk_nazid =:NEW.fk_nazid and TRUNC(nm.fd_post) = TRUNC(:NEW.fd_post) and NVL(nm.fk_nazmedlechid,-1) = NVL(:NEW.fk_nazmedlechid,-1);
  if nm_count > 0 then
    RAISE_APPLICATION_ERROR(-20011, 'Списание уже было произведено сотрудником: '||CHR(13)||CHR(10)||LOGIN.GET_SOTRNAME(SOTR_ID)||' ('||login.get_sotr_otdelname(SOTR_ID)||')');
  end if;

  IF :NEW.FK_ID IS NULL THEN
    SELECT SEQ_TNAZMARK.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
END TNAZMARK_BEFORE_INSERT;
/
SHOW ERRORS;


