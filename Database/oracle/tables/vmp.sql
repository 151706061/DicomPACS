ALTER TABLE ASU.VMP
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.VMP CASCADE CONSTRAINTS
/

--
-- VMP  (Table) 
--
CREATE TABLE ASU.VMP
(
  FK_ID       NUMBER                            NOT NULL,
  VID_VME     VARCHAR2(15 BYTE),
  VID_HMP     VARCHAR2(14 BYTE),
  METOD_HMP   VARCHAR2(13 BYTE),
  CODE_USL    VARCHAR2(15 BYTE),
  TARIF       NUMBER(9,2),
  FK_PERESEL  VARCHAR2(15 BYTE),
  PROFIL      NUMBER
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.VMP IS 'Таблица создана автоматически в результате загрузки DBF'
/

COMMENT ON COLUMN ASU.VMP.FK_ID IS 'ASU.SEQ_VMP'
/


--
-- K_VMP_ID  (Index) 
--
--  Dependencies: 
--   VMP (Table)
--
CREATE UNIQUE INDEX ASU.K_VMP_ID ON ASU.VMP
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
-- VMP_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   VMP (Table)
--
CREATE OR REPLACE TRIGGER ASU.VMP_BEFORE_INSERT
  BEFORE INSERT
  ON ASU.VMP   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
BEGIN
  SELECT ASU.SEQ_VMP.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table VMP 
-- 
ALTER TABLE ASU.VMP ADD (
  CONSTRAINT K_VMP_ID
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

