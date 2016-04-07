ALTER TABLE ASU.TVACCIN_UNIT
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVACCIN_UNIT CASCADE CONSTRAINTS
/

--
-- TVACCIN_UNIT  (Table) 
--
CREATE TABLE ASU.TVACCIN_UNIT
(
  FK_ID          INTEGER                        NOT NULL,
  FC_NAME        VARCHAR2(30 BYTE)              NOT NULL,
  FC_SHORT_NAME  VARCHAR2(15 BYTE)              NOT NULL
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TVACCIN_UNIT IS 'Единицы измерения для вакцинации
Сделал потому как med.tei засрали
Author: Ura'
/

COMMENT ON COLUMN ASU.TVACCIN_UNIT.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TVACCIN_UNIT.FC_SHORT_NAME IS 'Сокращение'
/


--
-- PK_TVACCIN_UNIT  (Index) 
--
--  Dependencies: 
--   TVACCIN_UNIT (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVACCIN_UNIT ON ASU.TVACCIN_UNIT
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
-- TVACCIN_UNIT_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVACCIN_UNIT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVACCIN_UNIT_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tvaccin_unit
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
    --  Column "FK_ID" uses sequence SEQ_TVACCIN_UNIT

  IF :NEW.fk_id IS NULL
  THEN
    SELECT SEQ_TVACCIN_UNIT.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVACCIN_UNIT 
-- 
ALTER TABLE ASU.TVACCIN_UNIT ADD (
  CONSTRAINT PK_TVACCIN_UNIT
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

