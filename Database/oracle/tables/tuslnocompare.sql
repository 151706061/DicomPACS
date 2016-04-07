ALTER TABLE ASU.TUSLNOCOMPARE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSLNOCOMPARE CASCADE CONSTRAINTS
/

--
-- TUSLNOCOMPARE  (Table) 
--
CREATE TABLE ASU.TUSLNOCOMPARE
(
  FK_ID       NUMBER(15)                        NOT NULL,
  FK_USLID    NUMBER(15),
  FK_SMID     NUMBER(15),
  FK_TIPROOM  NUMBER(15)
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

COMMENT ON TABLE ASU.TUSLNOCOMPARE IS 'В таблицу сохраняются данные о несопоставленных услугах и диагнозах, обнаруженных в процессе выгрузки в DBF Author:Efimov'
/

COMMENT ON COLUMN ASU.TUSLNOCOMPARE.FK_ID IS 'SEQ_USLNOCOMPARE'
/

COMMENT ON COLUMN ASU.TUSLNOCOMPARE.FK_USLID IS 'TUSL_DBF.FK_ID - услуга, при добавлении которой было выявлено отсутствие соответствия'
/

COMMENT ON COLUMN ASU.TUSLNOCOMPARE.FK_SMID IS 'TSMID.FK_ID - not null если отсутствует соответствие назначение - услуга'
/

COMMENT ON COLUMN ASU.TUSLNOCOMPARE.FK_TIPROOM IS 'TTIPROOM.FK_ID - not null если отсутствует соответствие профиля койки - стандарт'
/


--
-- I_TUSLNOCOMPARE_SMIDID  (Index) 
--
--  Dependencies: 
--   TUSLNOCOMPARE (Table)
--
CREATE INDEX ASU.I_TUSLNOCOMPARE_SMIDID ON ASU.TUSLNOCOMPARE
(FK_SMID)
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
-- I_TUSLNOCOMPARE_TIPROOM  (Index) 
--
--  Dependencies: 
--   TUSLNOCOMPARE (Table)
--
CREATE INDEX ASU.I_TUSLNOCOMPARE_TIPROOM ON ASU.TUSLNOCOMPARE
(FK_TIPROOM)
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
-- I_TUSLNOCOMPARE_USLID  (Index) 
--
--  Dependencies: 
--   TUSLNOCOMPARE (Table)
--
CREATE INDEX ASU.I_TUSLNOCOMPARE_USLID ON ASU.TUSLNOCOMPARE
(FK_USLID)
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
-- K_TUSLNOCOMPARE_ID  (Index) 
--
--  Dependencies: 
--   TUSLNOCOMPARE (Table)
--
CREATE UNIQUE INDEX ASU.K_TUSLNOCOMPARE_ID ON ASU.TUSLNOCOMPARE
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
-- TUSLNOCOMPARE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSLNOCOMPARE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSLNOCOMPARE_INSERT" 
 BEFORE
  INSERT
 ON asu.TUSLNOCOMPARE
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TUSLNOCOMPARE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TUSLNOCOMPARE 
-- 
ALTER TABLE ASU.TUSLNOCOMPARE ADD (
  CONSTRAINT K_TUSLNOCOMPARE_ID
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

