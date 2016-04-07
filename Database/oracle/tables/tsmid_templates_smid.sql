ALTER TABLE ASU.TSMID_TEMPLATES_SMID
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSMID_TEMPLATES_SMID CASCADE CONSTRAINTS
/

--
-- TSMID_TEMPLATES_SMID  (Table) 
--
CREATE TABLE ASU.TSMID_TEMPLATES_SMID
(
  FK_ID                NUMBER                   NOT NULL,
  FK_SMID_ID           NUMBER                   NOT NULL,
  FK_SMID_TEMPLATE_ID  NUMBER                   NOT NULL,
  FN_ORDER             NUMBER(3),
  FN_YEAR              NUMBER                   DEFAULT 0,
  FN_SEX               NUMBER                   DEFAULT -1
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

COMMENT ON TABLE ASU.TSMID_TEMPLATES_SMID IS 'Значения SMID  в шаблоне'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES_SMID.FK_ID IS 'SEQUENCE=[SEQ_NAZN_TEMPL_SMID]'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES_SMID.FK_SMID_ID IS 'ссылка на SMID'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES_SMID.FK_SMID_TEMPLATE_ID IS 'ссылка на Шаблон'
/

COMMENT ON COLUMN ASU.TSMID_TEMPLATES_SMID.FN_ORDER IS 'Порядок'
/


--
-- PK_TSMID_TEMPLATES_SMID  (Index) 
--
--  Dependencies: 
--   TSMID_TEMPLATES_SMID (Table)
--
CREATE UNIQUE INDEX ASU.PK_TSMID_TEMPLATES_SMID ON ASU.TSMID_TEMPLATES_SMID
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
-- TSMID_TEMPLATES_SMID_BEFOR_INS  (Trigger) 
--
--  Dependencies: 
--   TSMID_TEMPLATES_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_TEMPLATES_SMID_BEFOR_INS" 
 BEFORE
  INSERT
 ON asu.tsmid_templates_smid
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN_TEMPL_SMID
    if :new.FK_ID is null then
      select SEQ_NAZN_TEMPL_SMID.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSMID_TEMPLATES_SMID 
-- 
ALTER TABLE ASU.TSMID_TEMPLATES_SMID ADD (
  CONSTRAINT PK_TSMID_TEMPLATES_SMID
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

