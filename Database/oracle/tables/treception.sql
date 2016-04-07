ALTER TABLE ASU.TRECEPTION
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECEPTION CASCADE CONSTRAINTS
/

--
-- TRECEPTION  (Table) 
--
--  Dependencies: 
--   TNAZN (Table)
--   TNAZN_STATUS (Table)
--
CREATE TABLE ASU.TRECEPTION
(
  FK_ID          INTEGER,
  FK_SMID        INTEGER,
  FK_NAZN        INTEGER,
  FK_VRACH       INTEGER,
  FK_KABINET_ID  INTEGER,
  FK_STATUS      INTEGER,
  FD_EXECUTION   DATE,
  FD             DATE                           DEFAULT sysdate,
  FK_SOTR        INTEGER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TRECEPTION IS 'Приемы'
/

COMMENT ON COLUMN ASU.TRECEPTION.FK_ID IS 'SEQUENCE=[SEQ_TRECEPTION]'
/

COMMENT ON COLUMN ASU.TRECEPTION.FK_NAZN IS 'ссылка на назначение'
/

COMMENT ON COLUMN ASU.TRECEPTION.FK_VRACH IS 'Врач выполнивший, ответсвенный'
/

COMMENT ON COLUMN ASU.TRECEPTION.FK_KABINET_ID IS 'Кабинет врача'
/

COMMENT ON COLUMN ASU.TRECEPTION.FK_STATUS IS 'Cтатус TNAZN_STATUS'
/

COMMENT ON COLUMN ASU.TRECEPTION.FD_EXECUTION IS 'Дата выполнения, назначения'
/

COMMENT ON COLUMN ASU.TRECEPTION.FD IS 'Дата создания, изменения'
/

COMMENT ON COLUMN ASU.TRECEPTION.FK_SOTR IS 'Сотрудник изменивший запись'
/


--
-- PK_TRECEPTION  (Index) 
--
--  Dependencies: 
--   TRECEPTION (Table)
--
CREATE UNIQUE INDEX ASU.PK_TRECEPTION ON ASU.TRECEPTION
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
-- TRECEPTION_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TRECEPTION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_BEFORE_UPDATE" 
 BEFORE
  UPDATE
 ON asu.treception
REFERENCING NEW AS NEW OLD AS OLD
BEGIN
  PKG_NAZN.init_recept_table;
END;
/
SHOW ERRORS;


--
-- TRECEPTION_BEFORE_INSERT2  (Trigger) 
--
--  Dependencies: 
--   TRECEPTION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_BEFORE_INSERT2" 
 BEFORE
  INSERT
 ON asu.treception
REFERENCING NEW AS NEW OLD AS OLD
BEGIN
  PKG_NAZN.init_recept_table;
END;
/
SHOW ERRORS;


--
-- TRECEPTION_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRECEPTION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON treception
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_TRECEPTION
    if :new.FK_ID is null then
      select SEQ_TRECEPTION.NEXTVAL INTO :new.FK_ID from dual;
          end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


--
-- TRECEPTION_AFTER_UPD_FK_STATUS  (Trigger) 
--
--  Dependencies: 
--   TRECEPTION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_AFTER_UPD_FK_STATUS" 
 AFTER
 UPDATE OF FK_STATUS
 ON asu.treception
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  pkg_nazn.add_recept_to_list(:NEW.fk_id);
  RETURN;
END;
/
SHOW ERRORS;


--
-- TRECEPTION_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TRECEPTION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_AFTER_UPDATE" 
 AFTER
  UPDATE
 ON asu.treception
REFERENCING NEW AS NEW OLD AS OLD
BEGIN
  pkg_nazn.calc_status_on_nazn;
END;
/
SHOW ERRORS;


--
-- TRECEPTION_AFTER_INSERT2  (Trigger) 
--
--  Dependencies: 
--   TRECEPTION (Table)
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


--
-- TRECEPTION_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRECEPTION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_AFTER_INSERT" 
 AFTER
  INSERT
 ON asu.treception
REFERENCING NEW AS NEW OLD AS OLD
BEGIN
  pkg_nazn.calc_status_on_nazn;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECEPTION 
-- 
ALTER TABLE ASU.TRECEPTION ADD (
  CONSTRAINT PK_TRECEPTION
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

-- 
-- Foreign Key Constraints for Table TRECEPTION 
-- 
ALTER TABLE ASU.TRECEPTION ADD (
  CONSTRAINT CK_TRECEPTION__TNAZN 
 FOREIGN KEY (FK_NAZN) 
 REFERENCES ASU.TNAZN (FK_ID),
  CONSTRAINT CK_TRECEPTION__TNAZN_ST 
 FOREIGN KEY (FK_STATUS) 
 REFERENCES ASU.TNAZN_STATUS (FK_ID))
/

