ALTER TABLE ASU.TINSURNOTDOCS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TINSURNOTDOCS CASCADE CONSTRAINTS
/

--
-- TINSURNOTDOCS  (Table) 
--
CREATE TABLE ASU.TINSURNOTDOCS
(
  FK_ID       NUMBER                            NOT NULL,
  FK_INSURID  NUMBER,
  FK_TYPEDOC  NUMBER
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TINSURNOTDOCS IS 'Связь страховых документов с типами документов не являющимися страховыми'
/

COMMENT ON COLUMN ASU.TINSURNOTDOCS.FK_INSURID IS 'Ссылка на TinsurDoc'
/

COMMENT ON COLUMN ASU.TINSURNOTDOCS.FK_TYPEDOC IS 'Ссылка на Тtypedoc'
/


--
-- PK_INSURDOC  (Index) 
--
--  Dependencies: 
--   TINSURNOTDOCS (Table)
--
CREATE UNIQUE INDEX ASU.PK_INSURDOC ON ASU.TINSURNOTDOCS
(FK_ID)
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
-- TINSURNOTDOCS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TINSURNOTDOCS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINSURNOTDOCS_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tinsurnotdocs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  select seq_TINSURnotDOCs.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TINSURNOTDOCS 
-- 
ALTER TABLE ASU.TINSURNOTDOCS ADD (
  CONSTRAINT PK_INSURDOC
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

