ALTER TABLE ASU.TSLPRINT
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSLPRINT CASCADE CONSTRAINTS
/

--
-- TSLPRINT  (Table) 
--
CREATE TABLE ASU.TSLPRINT
(
  FK_ID      NUMBER                             NOT NULL,
  FP_TYPE    NUMBER                             DEFAULT 0,
  FD_PRINT   DATE,
  FC_NUM     VARCHAR2(15 BYTE),
  FK_INFOID  NUMBER,
  FK_SOTRID  NUMBER                             DEFAULT -1
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

COMMENT ON COLUMN ASU.TSLPRINT.FK_ID IS 'SEQUENCE=[SEQ_TSLPRINT]'
/

COMMENT ON COLUMN ASU.TSLPRINT.FP_TYPE IS 'Тип документа (0 - ЛН, 1 - справка, 2 - листок освобождения)'
/

COMMENT ON COLUMN ASU.TSLPRINT.FD_PRINT IS 'Дата печати'
/

COMMENT ON COLUMN ASU.TSLPRINT.FC_NUM IS 'Номер документа'
/

COMMENT ON COLUMN ASU.TSLPRINT.FK_INFOID IS 'TSLINFO.FK_ID'
/

COMMENT ON COLUMN ASU.TSLPRINT.FK_SOTRID IS 'Сотрудник, напечатавший документ нетрудоспособности'
/


--
-- BY_ID  (Index) 
--
--  Dependencies: 
--   TSLPRINT (Table)
--
CREATE UNIQUE INDEX ASU.BY_ID ON ASU.TSLPRINT
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSLPRINT_INFO  (Index) 
--
--  Dependencies: 
--   TSLPRINT (Table)
--
CREATE INDEX ASU.TSLPRINT_INFO ON ASU.TSLPRINT
(FK_INFOID)
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
-- TSLPRINT_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSLPRINT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSLPRINT_BEFORE_INSERT" 
  BEFORE INSERT
  ON ASU.TSLPRINT   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  SELECT SEQ_TSLPRINT.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSLPRINT 
-- 
ALTER TABLE ASU.TSLPRINT ADD (
  CONSTRAINT BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          80K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

