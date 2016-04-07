DROP TABLE ASU.TNAZMARK_X CASCADE CONSTRAINTS
/

--
-- TNAZMARK_X  (Table) 
--
CREATE TABLE ASU.TNAZMARK_X
(
  FK_ID       NUMBER(15)                        NOT NULL,
  FK_NAZID    NUMBER(15),
  FL_SHOWPAC  NUMBER(1)                         DEFAULT 0,
  FL_PODT     NUMBER(1)                         DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          40K
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

COMMENT ON TABLE ASU.TNAZMARK_X IS 'таблица дополнительных параметров по рентгену'
/

COMMENT ON COLUMN ASU.TNAZMARK_X.FK_ID IS 'SEQUENCE=[SEQ_TNAZMARK_X]'
/

COMMENT ON COLUMN ASU.TNAZMARK_X.FK_NAZID IS 'VNAZ.FK_ID'
/

COMMENT ON COLUMN ASU.TNAZMARK_X.FL_SHOWPAC IS 'Признак выдачи снимка пациенту (0 - не выдан, 1 - выдан)'
/

COMMENT ON COLUMN ASU.TNAZMARK_X.FL_PODT IS 'Признак совпадения с обоснованием назначения (0 - совпадает, 1 - не совпадает)'
/


--
-- TNAZMARK_X_ID  (Index) 
--
--  Dependencies: 
--   TNAZMARK_X (Table)
--
CREATE UNIQUE INDEX ASU.TNAZMARK_X_ID ON ASU.TNAZMARK_X
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
-- TNAZMARK_X_NAZID  (Index) 
--
--  Dependencies: 
--   TNAZMARK_X (Table)
--
CREATE UNIQUE INDEX ASU.TNAZMARK_X_NAZID ON ASU.TNAZMARK_X
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
-- TNAZMARK_X_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZMARK_X (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZMARK_X_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tnazmark_x
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  SELECT SEQ_TNAZMARK_X.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


