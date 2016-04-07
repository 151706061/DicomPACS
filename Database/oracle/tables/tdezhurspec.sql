ALTER TABLE ASU.TDEZHURSPEC
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TDEZHURSPEC CASCADE CONSTRAINTS
/

--
-- TDEZHURSPEC  (Table) 
--
CREATE TABLE ASU.TDEZHURSPEC
(
  FK_ID          NUMBER                         NOT NULL,
  FC_NAME        VARCHAR2(4000 BYTE),
  FL_SHOW        NUMBER(1)                      DEFAULT 1,
  FK_REALSPECID  NUMBER,
  FN_ORDER       NUMBER                         DEFAULT 0,
  FN_STYLE       NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
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

COMMENT ON TABLE ASU.TDEZHURSPEC IS 'Справочник специализация для дежурств'
/

COMMENT ON COLUMN ASU.TDEZHURSPEC.FL_SHOW IS 'отображать в справочнике дежурств ??'
/

COMMENT ON COLUMN ASU.TDEZHURSPEC.FK_REALSPECID IS 'Cсылка на TS_SPRAV'
/

COMMENT ON COLUMN ASU.TDEZHURSPEC.FN_STYLE IS 'Стиль. 0  - нормальный, 1 - жирный, 2 - курсив, 3 - подчеркнутый '
/


--
-- TDEZH_FK_SPEC  (Index) 
--
--  Dependencies: 
--   TDEZHURSPEC (Table)
--
CREATE UNIQUE INDEX ASU.TDEZH_FK_SPEC ON ASU.TDEZHURSPEC
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
-- TDEZHSPEC_REALSPECID  (Index) 
--
--  Dependencies: 
--   TDEZHURSPEC (Table)
--
CREATE INDEX ASU.TDEZHSPEC_REALSPECID ON ASU.TDEZHURSPEC
(FK_REALSPECID)
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
-- TDEZHURSPEC_INSERT  (Trigger) 
--
--  Dependencies: 
--   TDEZHURSPEC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDEZHURSPEC_INSERT" 
  BEFORE INSERT
  ON ASU.TDEZHURSPEC   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  select SEQ_TDEZHURSPEC.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TDEZHURSPEC 
-- 
ALTER TABLE ASU.TDEZHURSPEC ADD (
  CONSTRAINT TDEZH_FK_SPEC
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

