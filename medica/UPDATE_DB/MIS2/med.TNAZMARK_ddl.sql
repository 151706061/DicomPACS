-- Start of DDL Script for Table ASU.TNAZMARK
-- Generated 20-май-2011 11:34:04 from ASU@H100609

CREATE TABLE med.tnazmark
    (fk_id                          NUMBER(15,0) NOT NULL,
    fk_nazid                       NUMBER(15,0),
    fk_sotrid                      NUMBER(15,0),
    fl_nazmark                     NUMBER(1,0) DEFAULT 1,
    fd_post                        DATE,
    fk_nazmedlechid                NUMBER
  )
/





-- Indexes for ASU.TNAZMARK

CREATE INDEX med.tnazmark_by_nazid ON med.tnazmark
  (
    fk_nazid                        ASC
  )
/

CREATE INDEX med.tnazmark_fk_nazmedlechid ON med.tnazmark
  (
    fk_nazmedlechid                 ASC
  )
/



-- Triggers for ASU.TNAZMARK
/*
CREATE OR REPLACE TRIGGER med.tnazmark_before_insert
 BEFORE
  INSERT
 ON med.tnazmark
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

CREATE OR REPLACE TRIGGER asu.tnazmark_upd_fk_nazid
 BEFORE
   UPDATE OF fk_nazid
 ON asu.tnazmark
REFERENCING NEW AS NEW OLD AS OLD
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
*/

-- Comments for ASU.TNAZMARK

COMMENT ON TABLE med.tnazmark IS 'Таблица связи на отметку принятия назначения 31.01.06 Author:Zag '
/
COMMENT ON COLUMN med.tnazmark.fk_id IS 'SEQUENCE=[SEQ_TNAZMARK]'
/
COMMENT ON COLUMN med.tnazmark.fk_nazid IS 'код назначения'
/
COMMENT ON COLUMN med.tnazmark.fk_nazmedlechid IS 'TNAZMEDLECH.FK_ID - код назначенного препарата на выдачу. Только для медикоментозных назначений. Add A.Nakorjakov 13122007'
/
COMMENT ON COLUMN med.tnazmark.fk_sotrid IS 'код сотрудника, поставившего отметку о принятии назначения'
/

-- End of DDL Script for Table ASU.TNAZMARK

