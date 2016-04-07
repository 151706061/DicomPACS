ALTER TABLE ASU.TSMID_TEMPLATES
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSMID_TEMPLATES CASCADE CONSTRAINTS
/

--
-- TSMID_TEMPLATES  (Table) 
--
--  Dependencies: 
--   TSMID_TEMPLATES (Table)
--
CREATE TABLE ASU.TSMID_TEMPLATES
(
  FK_ID          NUMBER                         NOT NULL,
  FC_NAME        VARCHAR2(150 BYTE)             NOT NULL,
  REMARK         VARCHAR2(500 BYTE),
  FK_SOTR        NUMBER,
  FD             DATE                           DEFAULT sysdate               NOT NULL,
  FN_TYPE        NUMBER                         DEFAULT 2                     NOT NULL,
  FK_PARENT      NUMBER,
  FN_TEMPL_TYPE  NUMBER                         NOT NULL,
  FK_SMID        NUMBER(15)
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

COMMENT ON TABLE ASU.TSMID_TEMPLATES IS 'Шаблоны дерева SMID c галками'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES.FK_ID IS 'SEQUENCE=[SEQ_NAZN_TEMPLATES]'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES.FC_NAME IS 'Название шаблоны'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES.REMARK IS 'Примечание'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES.FK_SOTR IS 'Изменивший сотрудник'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES.FD IS 'Дата изменения шаблона'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES.FN_TYPE IS '1-папка 2- шаблон'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES.FK_PARENT IS 'Родитель'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES.FN_TEMPL_TYPE IS 'Тип шаблона 1 Назначение, 2 - Услуги'
/


--
-- PK_TSMID_TEMPLATES  (Index) 
--
--  Dependencies: 
--   TSMID_TEMPLATES (Table)
--
CREATE UNIQUE INDEX ASU.PK_TSMID_TEMPLATES ON ASU.TSMID_TEMPLATES
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
-- TSMID_TEMPLATES_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TSMID_TEMPLATES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_TEMPLATES_BEFORE_UPDATE" 
 BEFORE
 UPDATE OF FC_NAME, FK_ID, REMARK
 ON asu.tsmid_templates
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  select sysDate() into :new.FD from dual;
end;
/
SHOW ERRORS;


--
-- TSMID_TEMPLATES_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSMID_TEMPLATES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_TEMPLATES_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tsmid_templates
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN_TEMPLATES
    if :new.FK_ID is null then
      select SEQ_NAZN_TEMPLATES.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSMID_TEMPLATES 
-- 
ALTER TABLE ASU.TSMID_TEMPLATES ADD (
  CONSTRAINT PK_TSMID_TEMPLATES
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
-- Foreign Key Constraints for Table TSMID_TEMPLATES 
-- 
ALTER TABLE ASU.TSMID_TEMPLATES ADD (
  CONSTRAINT CK_TSMID_TEMPLATES__TSMID_TE 
 FOREIGN KEY (FK_PARENT) 
 REFERENCES ASU.TSMID_TEMPLATES (FK_ID))
/

