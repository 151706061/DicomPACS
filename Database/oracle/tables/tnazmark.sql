ALTER TABLE ASU.TNAZMARK
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZMARK CASCADE CONSTRAINTS
/

--
-- TNAZMARK  (Table) 
--
CREATE TABLE ASU.TNAZMARK
(
  FK_ID            NUMBER(15)                   NOT NULL,
  FK_NAZID         NUMBER(15),
  FK_SOTRID        NUMBER(15),
  FL_NAZMARK       NUMBER(1)                    DEFAULT 1,
  FD_POST          DATE,
  FK_NAZMEDLECHID  NUMBER,
  FC_REMARK        VARCHAR2(300 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TNAZMARK IS 'Таблица связи на отметку принятия назначения 31.01.06 by Zag'
/

COMMENT ON COLUMN ASU.TNAZMARK.FK_ID IS 'SEQUENCE=[SEQ_TNAZMARK]'
/

COMMENT ON COLUMN ASU.TNAZMARK.FK_NAZID IS 'код назначения'
/

COMMENT ON COLUMN ASU.TNAZMARK.FK_SOTRID IS 'код сотрудника, поставившего отметку о принятии назначения'
/

COMMENT ON COLUMN ASU.TNAZMARK.FK_NAZMEDLECHID IS 'TNAZMEDLECH.FK_ID - код назначенного препарата на выдачу. Только для медикоментозных назначений. Add A.Nakorjakov 13122007'
/

COMMENT ON COLUMN ASU.TNAZMARK.FC_REMARK IS 'Примечание'
/


--
-- TNAZMARK_BY_ID  (Index) 
--
--  Dependencies: 
--   TNAZMARK (Table)
--
CREATE UNIQUE INDEX ASU.TNAZMARK_BY_ID ON ASU.TNAZMARK
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZMARK_BY_NAZID  (Index) 
--
--  Dependencies: 
--   TNAZMARK (Table)
--
CREATE INDEX ASU.TNAZMARK_BY_NAZID ON ASU.TNAZMARK
(FK_NAZID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZMARK_FK_NAZMEDLECHID  (Index) 
--
--  Dependencies: 
--   TNAZMARK (Table)
--
CREATE INDEX ASU.TNAZMARK_FK_NAZMEDLECHID ON ASU.TNAZMARK
(FK_NAZMEDLECHID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZMARK_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZMARK (Table)
--
CREATE OR REPLACE TRIGGER ASU.tnazmark_after_insert
 AFTER
  INSERT
 ON ASU.TNAZMARK REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  update asu.tnazmed set FN_VIDANO = NVL(FN_VIDANO,0) + 1 where fk_id = :NEW.fk_nazid;
  asu.correct_tnazmed_state(:NEW.fk_nazid);
END TNAZMARK_BEFORE_INSERT;
/
SHOW ERRORS;


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


--
-- TNAZMARK_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
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


DROP PUBLIC SYNONYM TNAZMARK
/

--
-- TNAZMARK  (Synonym) 
--
--  Dependencies: 
--   TNAZMARK (Table)
--
CREATE PUBLIC SYNONYM TNAZMARK FOR ASU.TNAZMARK
/


-- 
-- Non Foreign Key Constraints for Table TNAZMARK 
-- 
ALTER TABLE ASU.TNAZMARK ADD (
  CONSTRAINT TNAZMARK_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

